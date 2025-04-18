from amaranth import *
from amaranth.lib import wiring, data
from amaranth.lib.wiring import In, Out

import common.signature as signature
from common.signature import ImmReg

import cpu.instruction as inst
from cpu.instruction import Reg, WideReg

def register():
    return data.UnionLayout({
        "standard": data.StructLayout({
            "short": data.ArrayLayout(8, 8),
            "long": data.ArrayLayout(16, 2)
        }),
        "wide": data.ArrayLayout(16, 6)
    })
    
def instruction():
    return data.UnionLayout({
        "op": unsigned(8),
        "arg": data.ArrayLayout(8, 4)
    })
    
class DebugReg(object):
    Op = 0x10
    Arg0 = 0x11
    Arg1 = 0x12
    
class Processor(wiring.Component):
    def __init__(self):
        super().__init__({
            "clk_en": In(1),
            "program": Out(signature.Bus(16, 8)), # Load in program
            "bus": Out(signature.Bus(16, 8)), # Data memory
            "debug": In(signature.Bus(8, 16)) # Debugger
        })
    
    def get_instructions(self):
        """
        Describe instruction set
        :returns: lookup table of instruction objects,
            each instruction provides number of arguments,
            and methods that operate on processor registers
        """
        iset = dict()
        iset[0x00] = inst.Noop()
        
        # Load short
        iset[0x06] = inst.LoadImmediate(Reg.B)
        iset[0x0E] = inst.LoadImmediate(Reg.C)
        iset[0x16] = inst.LoadImmediate(Reg.D)
        iset[0x1E] = inst.LoadImmediate(Reg.E)
        iset[0x26] = inst.LoadImmediate(Reg.H)
        iset[0x2E] = inst.LoadImmediate(Reg.L)
        iset[0x3E] = inst.LoadImmediate(Reg.A)
        
        # Load into register A into register A
        iset[0x7F] = inst.LoadRegister(dest = Reg.A, source = Reg.A)
        iset[0x47] = inst.LoadRegister(Reg.B, Reg.A)
        iset[0x4F] = inst.LoadRegister(Reg.C, Reg.A)
        iset[0x57] = inst.LoadRegister(Reg.D, Reg.A)
        iset[0x5F] = inst.LoadRegister(Reg.E, Reg.A)
        iset[0x67] = inst.LoadRegister(Reg.H, Reg.A)
        iset[0x6F] = inst.LoadRegister(Reg.L, Reg.A)
        
        # Load into register A, B, C, D, E, H, L
        regs = [Reg.A, Reg.B, Reg.C, Reg.D, Reg.E, Reg.H, Reg.L]
        base = [0x78, 0x40, 0x48, 0x50, 0x58, 0x60, 0x68]
        for reg in range(len(base)):
            for i in range(5):
                b = base[reg]
                iset[b + i] = inst.LoadRegister(regs[reg], regs[i + 1])
        
        # Read from memory
        regs = [Reg.A, Reg.B, Reg.C, Reg.D, Reg.E, Reg.H, Reg.L]
        ops = [0x7E, 0x46, 0x4E, 0x56, 0x5E, 0x66, 0x6E]
        for i in range(len(ops)):
            iset[ops[i]] = inst.LoadRead(regs[i])
            
        # Write to memory
        regs = [Reg.B, Reg.C, Reg.D, Reg.E, Reg.H, Reg.L]
        ops = [0x70, 0x71, 0x72, 0x73, 0x74, 0x75]
        for i in range(len(ops)):
            iset[ops[i]] = inst.LoadWrite(regs[i])
        
        # Additional A register commands
        iset[0x0A] = inst.LoadRead(Reg.A, (Reg.B, Reg.C)) # A <- Memory at (BC)
        iset[0x1A] = inst.LoadRead(Reg.A, (Reg.D, Reg.E)) # A <- Memory at (DE)
        iset[0xFA] = inst.LoadReadImm(Reg.A) # A <- Memory at (nn)
        
        iset[0x02] = inst.LoadWrite(Reg.A, (Reg.B, Reg.C)) # A -> Memory at (BC)
        iset[0x12] = inst.LoadWrite(Reg.A, (Reg.D, Reg.E)) # A -> Memory at (DE)
        iset[0x77] = inst.LoadWrite(Reg.A, (Reg.H, Reg.L)) # A -> Memory at (HL)
        iset[0xEA] = inst.LoadWriteImm(Reg.A) # A -> Memory at (nn)
        
        iset[0xF2] = inst.LoadRead.Offset(Reg.A) # A <- Memory at (C + #FF00)
        iset[0xE2] = inst.LoadWrite.Offset(Reg.A) # A -> Memory at (C + #FF00)
        
        # Load and increment/decrement
        iset[0x3A] = inst.LoadRead(Reg.A).set_macro(inst.Macro.decrement_wide(WideReg.HL))
        iset[0x32] = inst.LoadWrite(Reg.A).set_macro(inst.Macro.decrement_wide(WideReg.HL))
        iset[0x2A] = inst.LoadRead(Reg.A).set_macro(inst.Macro.increment_wide(WideReg.HL))
        iset[0x22] = inst.LoadWrite(Reg.A).set_macro(inst.Macro.increment_wide(WideReg.HL))
        
        # Load offset from immediate
        iset[0xE0] = inst.LoadWriteImm.Offset(Reg.A)
        iset[0xF0] = inst.LoadReadImm.Offset(Reg.A)
        
        # Load 16 bit words
        iset[0x01] = inst.LoadImmediate(WideReg.BC, long = True)
        iset[0x11] = inst.LoadImmediate(WideReg.DE, long = True)
        iset[0x21] = inst.LoadImmediate(WideReg.HL, long = True)
        iset[0x31] = inst.LoadImmediate(WideReg.SP, long = True)
        
        # Load HL into stack pointer
        iset[0x59] = inst.LoadRegister(WideReg.SP, WideReg.HL, long = True)
        iset[0xF8] = inst.LoadWideRegisterWithImm(WideReg.HL, WideReg.SP)
        
        iset[0x08] = inst.LoadWriteWideImm(WideReg.SP)
        
        # Push
        iset[0xF5] = inst.Push(WideReg.AF)
        iset[0xC5] = inst.Push(WideReg.BC)
        iset[0xD5] = inst.Push(WideReg.DE)
        iset[0xE5] = inst.Push(WideReg.HL)
        
        # Pop
        iset[0xF1] = inst.Pop(WideReg.AF)
        iset[0xC1] = inst.Pop(WideReg.BC)
        iset[0xD1] = inst.Pop(WideReg.DE)
        iset[0xE1] = inst.Pop(WideReg.HL)
        
        # ALU
        
        print("{}/245 implemented".format(len(iset)))
        
        return iset
        
    def elaborate(self, platform):
        m = Module()
        
        command = Signal(instruction())
        
        reg_data = Signal(register())
        reg = reg_data.standard
        pc = reg.long[1]
        
        ##############################
        ## Debug interface ###########
        ##############################
        debug = list()
        for r in (Reg.A, Reg.B, Reg.C, Reg.D, Reg.E, Reg.F, Reg.H, Reg.L):
            debug.append(ImmReg(r, reg.short[r]))
        debug.append(ImmReg(Reg.SP, reg.long[0]))
        debug.append(ImmReg(Reg.PC, reg.long[1]))
        debug.append(ImmReg(DebugReg.Op, command.op))
        debug.append(ImmReg(DebugReg.Arg0, command.arg[1]))
        debug.append(ImmReg(DebugReg.Arg1, command.arg[2]))
        
        ImmReg.run_read(m, self.debug, debug)
        ImmReg.run_write(m, self.debug, debug)
        
        ###############################
        ## Setup instructions #########
        ###############################
        iset = self.get_instructions()
        cycle_counter = Signal(8)
        bus_counter = Signal(2)
        bus_data = Signal(16)
        
        ctx = inst.InstructionContext(self.bus, reg.short, reg_data.wide, command.arg, cycle_counter, bus_counter)
        
        arg_counter = Signal(2)
        
        m.d.comb += self.program.addr.eq(pc)
        
        # Length of current operation
        arg_length = Signal(2)
        read_length = Signal(2)
        write_length = Signal(2)
        command_done = Signal()
        
        # Keep track of command attributes
        command_ready = Signal()
        m.d.comb += command_ready.eq(arg_counter == arg_length)
        
        
        # Command attributes
        with m.Switch(command.op):
            for key in iset:
                with m.Case(key):
                    # Number of arguments to load in
                    m.d.comb += arg_length.eq(iset[key].length())
                    # Flag indicates another command should load in
                    m.d.comb += command_done.eq(iset[key].done(ctx))
                    # Number of write bus transatcions
                    m.d.comb += write_length.eq(iset[key].write_length())
                    # Number of read bus transactions
                    m.d.comb += read_length.eq(iset[key].read_length())
                    # Address for accessing memory
                    m.d.comb += self.bus.addr.eq(iset[key].address(ctx))
                    # Address to write to bus (only used on write)
                    m.d.comb += bus_data.eq(iset[key].write_data(ctx))
            with m.Default():
                m.d.comb += arg_length.eq(1)
                m.d.comb += command_done.eq(1)
        
        # Working on this, 
        # But for some instructions I want to add in dummy cycles
        # since they need to buffers inserted
        cycle_next = Signal(8)
        
        with m.If(self.clk_en):
            m.d.sync += cycle_counter.eq(cycle_counter + 1)
                
        # Load in from program bus
        program_busy = Signal()
        
        with m.If(command_done & command_ready):
            m.d.sync += bus_counter.eq(0)
            m.d.sync += cycle_counter.eq(0)
            m.d.sync += command.op.eq(0)
            m.d.sync += arg_counter.eq(0)
            
        #########################################
        ### Load next byte from program memory ##
        #########################################
        m.d.comb += self.program.addr.eq(pc)
        
        with m.If(self.program.stb & self.program.ack):
            m.d.sync += arg_counter.eq(arg_counter + 1)
            m.d.sync += pc.eq(pc + 1)
            #with m.If(arg_counter == arg_length - 1):
                # TODO flag this as debug
            #    m.d.sync += Print("Loaded command ", command.op)
            m.d.sync += command.arg[arg_counter].eq(self.program.r.data)
        
        # Allow for slow bus reads
        with m.If(self.program.stb & ~self.program.ack):
            m.d.sync += program_busy.eq(1)
        with m.Elif(self.program.stb & self.program.ack):
            m.d.sync += program_busy.eq(0)
        
        with m.If(self.clk_en | program_busy):
            with m.If(arg_counter == 0):
                # Load instruction
                m.d.comb += self.program.stb.eq(1)
                m.d.comb += self.program.cycle.eq(1)
            with m.Else():
                with m.If(arg_counter < arg_length):
                    m.d.comb += self.program.stb.eq(1)
                    m.d.comb += self.program.cycle.eq(1)
        
        ###################################
        ## Read and write from ram ########
        ###################################
        bus_busy = Signal()
        
        with m.If(self.bus.stb & ~self.bus.ack):
            m.d.sync += bus_busy.eq(1)
        with m.If(self.bus.stb & self.bus.ack):
            m.d.sync += bus_counter.eq(bus_counter + 1)
            m.d.sync += bus_busy.eq(0)
        
        m.d.comb += self.bus.w.data.eq(bus_data.word_select(bus_counter, 8))
        
        with m.If(write_length > 0):
            with m.If(self.bus.stb & self.bus.ack & self.bus.w.enable):
                with m.Switch(command.op):
                    for key in iset:
                        if iset[key].on_write(ctx) is not None:
                            with m.Case(key):
                                m.d.sync += iset[key].on_write(ctx)
            
            with m.If((command_ready & self.clk_en) | bus_busy):
                m.d.comb += self.bus.stb.eq(1)
                m.d.comb += self.bus.cycle.eq(1)
                m.d.comb += self.bus.w.enable.eq(1)
        
        with m.If(read_length > 0):
            with m.If(self.bus.stb & self.bus.ack):
                with m.Switch(command.op):
                    for key in iset:
                        if iset[key].on_read(ctx) is not None:
                            with m.Case(key):
                                m.d.sync += iset[key].on_read(ctx)
            
            with m.If((command_ready & self.clk_en) | bus_busy):
                m.d.comb += self.bus.stb.eq(1)
                m.d.comb += self.bus.cycle.eq(1)
        
        # TODO read and write from ALU
        
        ########################################
        ### Run command ########################
        ########################################
        with m.If(command_ready):
            with m.Switch(command.op):
                for key in iset:
                    with m.Case(key):
                        iset[key].operate(m, ctx)
                with m.Default():
                    # Flag when an operation has not been implemented
                    m.d.sync += Print("Unimplemented command ", command.op)
                    m.d.sync += Assert(0, "Unimplemented command")
        
        return m