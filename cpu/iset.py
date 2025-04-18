from functools import reduce
from amaranth import *

from cpu.instruction import *

from cpu.alu import AluCode

##########################################
#### Types of instruction ################
##########################################
class Noop(InstructionBase):
    def __init__(self):
        super().__init__()
        
    def describe(self, m, ctx, a, b, counter):
        m.next = "fetch"
        
    def name(self):
        return "noop"
    
    def op_str(self):
        return "noop"
            
    def verify(self, input, result):
        pass # Literally nothing
            
class Load(InstructionBase):
    """
    Load data into register
    """
    def __init__(self, dest, source):
        """
        Initializer for load instruction
        :arg dest: register that data is made of
        :arg source: some data can can be read from (register, pointer, immediate)
        """
        super().__init__(dest, source)
        
    def describe(self, m, ctx, a, b, counter):
        # load into dest
        m.d.sync += self.args[0].get(ctx).eq(b)
        # Finish
        m.next = "fetch"
        
    ##########
    ## Meta ##
    ##########
    def name(self):
        return "load_into_{}".format(str(self.args[0]))
        
    def op_str(self):
        return "<-"
        
    def verify(self, input, result):
        # The new register value == the last clock cycles argument valu
        assert self.args[0].source(result) == self.args[1].source(input)
        
class WriteTo(InstructionBase):
    def __init__(self, pointer, source):
        """
        Initializer for write to command
        :arg pointer: register which holds the address to write into
        :arg source: data type which is written into the address
        """
        super().__init__(pointer, source)
        
    def describe(self, m, ctx, a, b, counter):
        # Write to memory
        m.d.comb += ctx["bus"].addr.eq(a)
        m.d.comb += ctx["bus"].w.data.eq(b)
        m.d.comb += ctx["bus"].w.enable.eq(1)
        m.d.comb += ctx["bus"].stb.eq(1)
        m.d.comb += ctx["bus"].cycle.eq(1)
        
        # Finish
        with m.If(ctx["bus"].ack):
            m.next = "fetch"
        
    def name(self):
        return "load_write_pointer"
        
    ##################################
    ## Expected logical operation ####
    ##################################
    def verify(self, input, result):
        print("Write expect 0x{}, got 0x{}".format(
                    self.args[0].source(input),
                    result.get_mem(self.args[0].source(result))
                ))
        assert result.get_mem(self.args[0].source(result)) == self.args[1].source(input)
        
    def impact(self):
        im = list()
        for a in self.args:
            im += a.impact()
        im += [("mem", self.args[0].source)]
        return im
        
    ##########
    ## Meta ##
    ##########
    def signature(self):
        return "({r}) {o} {a}".format(r = str(self.args[0]), o = self.op_str(), a = str(self.args[1]))
        
    def op_str(self):
        return "<-"
        
class Pop(InstructionBase):
    def __init__(self, dest, pointer = RegisterWide.SP()):
        self.pointer = pointer
        self.dest = dest
        super().__init__(pointer, dest)
        
    def describe(self, m, ctx, a, b, counter):
        # TODO add some common hooks
        # i.e. read, and load into address so this isn't unique for each combination
        m.d.comb += ctx["bus"].stb.eq(1)
        m.d.comb += ctx["bus"].cycle.eq(1)
        m.d.comb += ctx["bus"].addr.eq(self.pointer.get(ctx))
        
        with m.Switch(counter):
            with m.Case(0):
                # Load data from address
                with m.If(ctx["bus"].ack):
                    m.d.sync += self.dest.get(ctx).word_select(1, 8).eq(ctx["bus"].r.data)
                    m.d.sync += self.pointer.get(ctx).eq(self.pointer.get(ctx) + 1)
                    m.d.sync += counter.eq(1)
            with m.Case(1):
                # Load data from address
                with m.If(ctx["bus"].ack):
                    m.d.sync += self.dest.get(ctx).word_select(0, 8).eq(ctx["bus"].r.data)
                    m.d.sync += self.pointer.get(ctx).eq(self.pointer.get(ctx) + 1)
                    m.d.sync += counter.eq(0)
                    m.next = "fetch"
                    
    def impact(self):
        im = list()
        for a in self.args:
            im += a.impact()
        
        # values in the stack
        im += [("mem", self.pointer.source)]
        im += [("mem", lambda ctx: self.pointer.source(ctx) - 1)]
        return im
        
    def name(self):
        return "pop_{}_{}".format(str(self.pointer), str(self.dest))
        
    def op_str(self):
        return "= >"
        
    def verification_startup(self, state):
        # Stack pointer must be less than max memory size
        sp = state.sp
        if sp > 128:
            state.sp = 128
            
    def verify(self, initial, result):
        # The new register value == the last clock cycles argument value
        sp_0 = initial.get_mem(self.pointer.source(initial) + 1)
        sp_1 = initial.get_mem(self.pointer.source(initial))
        sp = sp_0 + (sp_1 << 8) # LSB first?
        
        # The dest register have the data from the contents of the stack
        print("Loaded data from sp at {}, which is 0x{:04X}, expect at register, got 0x{:04X}".format(initial.sp, sp, self.dest.source(result)))
        assert sp == self.dest.source(result)
        assert self.pointer.source(initial) + 2 == self.pointer.source(result)
        
class Push(InstructionBase):
    def __init__(self, source, pointer = RegisterWide.SP()):
        self.source = source
        self.pointer = pointer
        
        super().__init__(self.pointer, self.source)
        
    def describe(self, m, ctx, a, b, counter):
        m.d.comb += ctx["bus"].w.enable.eq(1)
        m.d.comb += ctx["bus"].w.data.eq(b[0:8])
        m.d.comb += ctx["bus"].stb.eq(1)
        m.d.comb += ctx["bus"].cycle.eq(1)
        m.d.comb += ctx["bus"].addr.eq(self.pointer.get(ctx))
        
        with m.Switch(counter):
            with m.Case(0):
                with m.If(ctx["bus"].ack):
                    # Shift next word
                    m.d.sync += b.eq(b >> 8)
                    m.d.sync += self.pointer.get(ctx).eq(self.pointer.get(ctx) - 1)
                    m.d.sync += counter.eq(1)
            with m.Case(1):
                with m.If(ctx["bus"].ack):
                    m.d.sync += b.eq(0)
                    m.d.sync += self.pointer.get(ctx).eq(self.pointer.get(ctx) - 1)
                    m.d.sync += counter.eq(0) # Clean up
                    m.next = "fetch" # Next instruction
                
    def impact(self):
        im = list()
        for a in self.args:
            im += a.impact()
        
        # values in the stack
        im += [("mem", self.pointer.source)]
        im += [("mem", lambda ctx: self.pointer.source(ctx) - 1)]
        return im
                
    def name(self):
        return "push_{}".format(str(self.pointer))
        
    def op_str(self):
        return "< ="
        
    def verification_startup(self, state):
        # It is an error case if the stack pointer is already below 2
        if state.sp < 2:
            state.sp += 2
        
    def verify(self, initial, result):
        # The new register value == the last clock cycles argument value
        sp_1 = result.get_mem(self.pointer.source(initial) - 1)
        sp_0 = result.get_mem(self.pointer.source(initial))
        sp = sp_0 + (sp_1 << 8)
        
        # The stack contains the data that had been in the registers
        assert sp == self.source.source(initial)
        assert self.pointer.source(initial) - 2 == self.pointer.source(result)
        
class AluInst(InstructionBase):
    def __init__(self, code, register, *args):
        super().__init__(register, *args, default_op = False)
        
        self.code = code
        
    def name(self):
        # Because all ALU instructions write to A register,
        # This should just be one value per
        return "{}_{}".format(self.alu_name(), str(self.args[0]))
        
    def describe(self, m, ctx, a, b, counter):
        m.d.comb += ctx["alu"].stb.eq(1)
        m.d.comb += ctx["alu"].code.eq(self.code)
        m.d.comb += ctx["alu"].operand[0].eq(a)
        m.d.comb += ctx["alu"].operand[1].eq(b)
        
        with m.If(ctx["alu"].ack):
            m.d.sync += self.args[0].get(ctx).eq(ctx["alu"].result)
            m.d.sync += counter.eq(0) # Clean up
            m.next = "fetch" # Next instruction
        

class AddShort(AluInst):
    def __init__(self, register, *args):
        super().__init__(AluCode.Add, register, *args)
        
    def alu_name(self):
        return "Add"
        
    def op_str(self):
        return "+"
        
    def verify(self, initial, result):
        print("Warning flags not checked yet")
        # Adds two numbers
        # may need some specifics later
        assert self.args[0].source(result) == (self.args[0].source(initial) + self.args[1].source(initial)) % 256
        
class Sub(AluInst):
    def __init__(self, register, *args):
        super().__init__(AluCode.Sub, register, *args)
        
    def alu_name(self):
        return "Sub"
        
    def op_str(self):
        return "-"
    
    def verify(self, initial, result):
        assert self.args[0].source(result) == (self.args[0].source(initial) - self.args[1].source(initial)) % 256
        
class And(AluInst):
    """
    Bitwise AND using the ALU
    """
    def __init__(self, register, *args):
        super().__init__(AluCode.And, register, *args)
    
    def alu_name(self):
        return ("And")
    
    def op_str(self):
        return "&"
        
    def verify(self, initial, result):
        assert self.args[0].source(result) == (self.args[0].source(initial) & self.args[1].source(initial))
        
class Inc(InstructionBase):
    """
    Increment a wide register
    """
    def __init__(self, register):
        super().__init__(register)
        
    def name(self):
        return "Inc_{}".format(str(self.args[0]))
        
    def op_str(self):
        return "++"
        
    def describe(self, m, ctx, a, b, counter):
        # Increment
        m.d.sync += self.args[0].get(ctx).eq(self.args[0].get(ctx) + 1)
        # Finish
        m.next = "fetch"
        
    def verify(self, initial, result):
        # TODO handle 16 bit better
        self.args[0].source(result) == (self.args[0].source(initial) + 1) % 256
        
class Dec(InstructionBase):
    """
    Decrement a wide regsiter
    """
    def __init__(self, register):
        super().__init__(register)
        
    def name(self):
        return "Dec_{}".format(str(self.args[0]))
    
    def op_str(self):
        return "--"
        
    def describe(self, m, ctx, a, b, counter):
        # Increment
        m.d.sync += self.args[0].get(ctx).eq(self.args[0].get(ctx) - 1)
        # Finish
        m.next = "fetch"
        
    def verify(self, initial, result):
        self.args[0].source(result) == (self.args[0].source(initial) - 1) % 256

class Halt(InstructionBase):
    def __init__(self):
        super().__init__()
        
    def name(self):
        return "Halt"
        
    def op_str(self):
        return "Halt"
        
    def describe(self, m, ctx, a, b, counter):
        m.next = "halted"
        
    def verify(self, initial, result):
        pass
        
class Stop(InstructionBase):
    def __init__(self):
        super().__init__(ShortImm())
        
    def name(self):
        return "Stop"
        
    def op_str(self):
        return "stop"
        
    def describe(self, m, ctx, a, b, counter):
        m.next = "stopped"

class DisableInterrupt(InstructionBase):
    def __init__(self):
        super().__init__()
        
    def name(self):
        return "Disable Interrupt"
    
    def op_str(self):
        return "DI"
        
    def describe(self, m, ctx, a, b, counter):
        m.d.sync += ctx.interrupt_enable.eq(0)
        m.next = "fetch"
    
class EnableInterrupt(InstructionBase):
    def __init__(self):
        super().__init__()
        
    def name(self):
        return "Enable Interrupt"
        
    def op_str(self):
        return "EI"
    
    def describe(self, m, ctx, a, b, counter):
        m.d.sync += ctx.interrupt_enable.eq(1)
        m.next = "fetch"

def LoadInstructionSet():
    iset = dict()
    iset[0x00] = Noop()
    
    # Load shorts
    codes = [0x06, 0x0E, 0x16, 0x1E, 0x26, 0x2E, 0x3E]
    regs =  [Reg.B, Reg.C, Reg.D, Reg.E, Reg.H, Reg.L, Reg.A]
    for c, r in zip(codes, regs):
        #print("Iset [{}] load register {}".format(c, r))
        iset[c] = Load(Register(r), ShortImm())
    
    #########################
    ## Load r2 into r1 ######
    #########################
    # Load r2 into r1 (A)
    codes = [0x7F, 0x78, 0x79, 0x7A, 0x7B, 0x7C, 0x7D]
    regs = [Reg.A, Reg.B, Reg.C, Reg.D, Reg.E, Reg.H, Reg.L]
    for c, r in zip(codes, regs):
        iset[c] = Load(Register(Reg.A), Register(r))
        
    # Load r2 into r1 (B)
    codes = [0x40, 0x41, 0x42, 0x43, 0x44, 0x45]
    regs = [Reg.B, Reg.C, Reg.D, Reg.E, Reg.H, Reg.L]
    for c, r in zip(codes, regs):
        iset[c] = Load(Register(Reg.B), Register(r))
        
    # Load r2 into r1 (C)
    codes = [0x48, 0x49, 0x4A, 0x4B, 0x4C, 0x4D]
    regs = [Reg.B, Reg.C, Reg.D, Reg.E, Reg.H, Reg.L]
    for c, r in zip(codes, regs):
        iset[c] = Load(Register(Reg.C), Register(r))
    
    # Load r2 into r1 (D)
    codes = [0x50, 0x51, 0x52, 0x53, 0x54, 0x55]
    regs = [Reg.B, Reg.C, Reg.D, Reg.E, Reg.H, Reg.L]
    for c, r in zip(codes, regs):
        iset[c] = Load(Register(Reg.D), Register(r))
        
    # Load r2 in r1 (E)
    codes = [0x58, 0x59, 0x5A, 0x5B, 0x5C, 0x5D]
    regs = [Reg.B, Reg.C, Reg.D, Reg.E, Reg.H, Reg.L]
    for c, r in zip(codes, regs):
        iset[c] = Load(Register(Reg.E), Register(r))
    
    # Load r2 in r1 (H)
    codes = [0x60, 0x61, 0x62, 0x63, 0x64, 0x65]
    regs = [Reg.B, Reg.C, Reg.D, Reg.E, Reg.H, Reg.L]
    for c, r in zip(codes, regs):
        iset[c] = Load(Register(Reg.H), Register(r))
    
    codes = [0x68, 0x68, 0x69, 0x6A, 0x6B, 0x6C, 0x6D]
    regs = [Reg.B, Reg.C, Reg.D, Reg.E, Reg.H, Reg.L]
    for c, r in zip(codes, regs):
        iset[c] = Load(Register(Reg.L), Register(r))
        
    # Load wide immediate
    iset[0x01] = Load(RegisterWide.BC(), WideImm())
    iset[0x11] = Load(RegisterWide.DE(), WideImm())
    iset[0x21] = Load(RegisterWide.HL(), WideImm())
    iset[0x31] = Load(RegisterWide.SP(), WideImm())
        
    ##########################
    ## Load from HL pointer ##
    ##########################
    codes = [0x7E, 0x46, 0x4E, 0x56, 0x5E, 0x66, 0x6E]
    regs = [Reg.A, Reg.B, Reg.C, Reg.D, Reg.E, Reg.H, Reg.L]
    for c, r in zip(codes, regs):
        iset[c] = Load(Register(r), ReadFrom(RegisterWide.HL()))
    
    ##############################
    ## Read from HL pointer ######
    ##############################
    codes = [0x70, 0x71, 0x72, 0x73, 0x74, 0x75]
    regs = [Reg.B, Reg.C, Reg.D, Reg.E, Reg.H, Reg.L]
    for c, r in zip(codes, regs):
        iset[c] = WriteTo(RegisterWide.HL(), Register(r))
    
    # Write short imm
    iset[0x36] = WriteTo(RegisterWide.HL(), Register(r))
    
    ##############################
    ## Read from pointers to A ###
    ##############################
    codes = [0x0A, 0x1A]
    regs = [WideReg.BC, WideReg.DE]
    for c, r in zip(codes, regs):
        iset[c] = Load(Register(Reg.A), ReadFrom(RegisterWide(r)))
    
    # Load from immediate register
    iset[0xFA] = Load(Register(Reg.A), ReadFrom(WideImm()))
    
    ###############################
    ## Stack pointer ##############
    ###############################
    codes = [0xF5, 0xC5, 0xD5, 0xE5]
    regs = [WideReg.AF, WideReg.BC, WideReg.DE, WideReg.HL]
    for c, r in zip(codes, regs):
        iset[c] = Push(RegisterWide(r))
        
    codes = [0xF1, 0xC1, 0xD1, 0xE1]
    regs = [WideReg.AF, WideReg.BC, WideReg.DE, WideReg.HL]
    for c, r in zip(codes, regs):
        iset[c] = Pop(RegisterWide(r))
        
    # Short increment
    iset[0x04] = Inc(Register(Reg.B))
    iset[0x14] = Inc(Register(Reg.D))
    iset[0x24] = Inc(Register(Reg.H))
    
    iset[0x05] = Dec(Register(Reg.B))
    iset[0x15] = Dec(Register(Reg.D))
    iset[0x25] = Dec(Register(Reg.H))
    
    #####################################
    ### ALU #############################
    #####################################    
    # Add short
    codes = [0x87, 0x80, 0x81, 0x82, 0x83, 0x84, 0x85]
    regs = [Reg.A, Reg.B, Reg.C, Reg.D, Reg.E, Reg.H, Reg.L]
    for c, r in zip(codes, regs):
        iset[c] = AddShort(Register(Reg.A), Register(r))
    
    iset[0x86] = AddShort(Register(Reg.A), ReadFrom(RegisterWide(WideReg.HL)))
    # TODO check what 0xC6 Add A, # means
    iset[0xC6] = AddShort(Register(Reg.A), ShortImm())
    
    # TODO add and carry
    
    # Subtract
    codes = [0x97, 0x90, 0x91, 0x92, 0x93, 0x94, 0x95]
    regs = [Reg.A, Reg.B, Reg.C, Reg.D, Reg.E, Reg.H, Reg.L]
    for c, r in zip(codes, regs):
        iset[c] = Sub(Register(Reg.A), Register(r))
        
    iset[0x96] = Sub(Register(Reg.A), ReadFrom(RegisterWide(WideReg.HL)))
    
    # TODO subtract and carry
    
    # And
    codes = [0xA7, 0xA0, 0xA1, 0xA2, 0xA3, 0xA4, 0xA5]
    regs = [Reg.A, Reg.B, Reg.C, Reg.D, Reg.E, Reg.H, Reg.L]
    for c, r in zip(codes, regs):
        iset[c] = And(Register(Reg.A), Register(r))
        
    iset[0xA6] = And(Register(Reg.A), ReadFrom(RegisterWide(WideReg.HL)))
    
    #########################
    ## 16 bit arithmetic ####
    #########################
    
    # Increment wide registers
    iset[0x03] = Inc(RegisterWide.BC())
    iset[0x13] = Inc(RegisterWide.DE())
    iset[0x23] = Inc(RegisterWide.HL())
    iset[0x33] = Inc(RegisterWide.SP())
            
    # Decrement wide register
    iset[0x0B] = Dec(RegisterWide.BC())
    iset[0x1B] = Dec(RegisterWide.DE())
    iset[0x2B] = Dec(RegisterWide.HL())
    iset[0x3B] = Dec(RegisterWide.SP())
    
    #######################################
    ## Miscellaneous 3.3.5 of CPU manual ##
    #######################################
    # Swap upper and lower nibbles
    # TODO, requires flag sets
    iset[0xF3] = DisableInterrupt()
    iset[0xFB] = EnableInterrupt()
    iset[0x76] = Halt()
    iset[0x10] = Stop()
    
    return iset
                
def ReportIset(iset):
    
    for i in range(255):
        ending = "\t"
        if i % 16 == 15:
            ending = "\n"
        if i in iset:
            print("0x{:02X}: {}".format(i, iset[i].name()[0:3]), end = ending)
        else:
            print("0x{:02X}: ___".format(i), end = ending)