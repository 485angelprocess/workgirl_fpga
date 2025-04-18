from amaranth import *
from amaranth.lib import wiring, data
from amaranth.lib.wiring import In, Out

import common.signature as signature
from common.signature import ImmReg
from common.interconnect import AsyncBus

from cpu.iset import LoadInstructionSet
from cpu.instruction import *
from cpu.alu import AluInterface

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
    SP = 0x08
    PC = 0x09
    Op = 0x10
    Arg0 = 0x11
    Arg1 = 0x12

class Processor(wiring.Component):
    def __init__(self):
        super().__init__({
            "clk_en": In(1),
            "program": Out(signature.Bus(16, 8)),
            "bus": Out(signature.Bus(16, 8)),
            "alu": In(AluInterface()),
            "debug": In(signature.Bus(8, 16)),
            "interrupt": In(signature.Bus(8, 16))
        })
        
    def load_arguments(self, m, inst, ctx, a, b):
        if len(inst.args) > 0:
            m.d.sync += a.eq(inst.args[0].get(ctx))
        if len(inst.args) > 1:
            m.d.sync += b.eq(inst.args[1].get(ctx))
        
    def elaborate(self, platform):
        m = Module()
        
        command = Signal(instruction())
        reg_data = Signal(register())
        
        reg = reg_data.standard
        wide = reg_data.wide
        pc = reg.long[1]
        
        iset = LoadInstructionSet()
        
        ##############################
        ## Debug interface ###########
        ##############################
        debug = list()
        for r in (Reg.A, Reg.B, Reg.C, Reg.D, Reg.E, Reg.F, Reg.H, Reg.L):
            debug.append(ImmReg(r, reg.short[r]))
        debug.append(ImmReg(DebugReg.SP, reg.long[0]))
        debug.append(ImmReg(DebugReg.PC, reg.long[1]))
        debug.append(ImmReg(DebugReg.Op, command.op))
        debug.append(ImmReg(DebugReg.Arg0, command.arg[1]))
        debug.append(ImmReg(DebugReg.Arg1, command.arg[2]))
        
        ImmReg.run_read(m, self.debug, debug)
        ImmReg.run_write(m, self.debug, debug)
        
        ###################
        ## Parse op code ##
        ###################
        arg_counter = Signal(4)
        
        interrupt_enable = Signal(init = 1) # Flag enables or disables interrupt after next instruction
        interrupt_latch = Signal() # Allows interrupts to go through
        
        # Introduce to do some asynchronous
        # Tracking, would like to remove this at some poitn
        run_counter = Signal(8)
        arg_length = Signal(4)
        
        read_value = Signal(16)
        
        ctx = InstructionContext(register = reg.short, # 8 bit register
                                wide = reg_data.wide,  # 16 bit registers
                                arg = command.arg,     # Arguments
                                arg_counter = arg_counter,
                                alu = self.alu,
                                ram_bus = self.bus,
                                read_value = read_value,
                                interrupt_enable = interrupt_enable)
        
        opcode = command.op
        
        # Get arg length for current instruction
        with m.Switch(opcode):
            for o in iset:
                with m.Case(o):
                    m.d.comb += arg_length.eq(iset[o].arg_length())
            with m.Default():
                m.d.sync += Print("Unimplemented command ", command.op)
                m.d.sync += Assert(0, "Unimplemented command")
                m.d.comb += arg_length.eq(0)
                    
        ####################
        ## Load program in #
        ####################
        program_async = m.submodules.program_async = AsyncBus()
        wiring.connect(m, program_async.bus, wiring.flipped(self.program))
        
        run_state = dict()
        
        # Collect states, which are the types of instructions that can be run
        for o in iset:
            state = iset[o].run()
            if state not in run_state:
                run_state[state] = iset[o].describe
       
        # Temp registers for operations 
        a = Signal(16)
        b = Signal(16)
        
        with m.If(program_async.r_ready):
            m.d.sync += command.arg[arg_counter].eq(program_async.r_data)
            
        # Current location of program counter
        m.d.comb += program_async.addr.eq(pc)
        
        with m.FSM():
            with m.State("fetch"): # TODO rename to fetch
                ################################
                # Load in arguments of opcode ##
                ################################
                m.d.comb += program_async.r_en.eq(self.clk_en)
                
                with m.If(interrupt_latch & self.interrupt.stb):
                    # Interrupts are enabled, when received, do interrupt
                    m.d.comb += self.interrupt.ack.eq(1)
                    m.d.sync += Assert(0, "Interrupts not implemented")
                    # TODO jump to interrupt
                with m.Elif(program_async.r_ready):
                    # Instruction was fetched,
                    # Increment program counter
                    m.d.sync += pc.eq(pc + 1)
                    m.next = "check"
                    
            with m.State("check"):
                with m.If(arg_counter == arg_length):
                    # All arguments were loaded
                    m.d.sync += arg_counter.eq(0)
                    
                    # Latches on instruction after it was changed
                    m.d.sync += interrupt_latch.eq(interrupt_enable)
                    
                    ###############################
                    # Jump to first state required by instruction
                    with m.Switch(opcode):
                        for o in iset:
                            with m.Case(o):
                                m.next = iset[o].on_load()
                                self.load_arguments(m, iset[o], ctx, a, b)
                    ###############################
                with m.Else():
                    # Op code requires more than 1 byte
                    m.d.sync += arg_counter.eq(arg_counter + 1)
                    m.next = "fetch"
                    
            with m.State("halted"):
                # Halts until interrupt occurs
                m.d.sync += interrupt_latch.eq(1) # Make sure interrupt is used
                with m.If(self.interrupt.stb):
                    # Jump to something from interrupt table?
                    m.next = "fetch"
                    
            with m.State("stopped"):
                # Stops until button pressed
                # TODO send data to stop LCD Display
                m.d.sync += interrupt_latch.eq(1) # May not be proper state
                with m.If(self.interrupt.stb):
                    m.next = "fetch"
            with m.State("read"):
                ###############################
                # Load in value from address ##
                ###############################
                m.d.comb += self.bus.stb.eq(1)
                m.d.comb += self.bus.cycle.eq(1)
                
                # Address based on operation
                with m.Switch(opcode):
                    for o in iset:
                        read_address = iset[o].read_address()
                        if read_address is not None:
                            #print("Read address for 0x{:02X} is {}".format(o, read_address))
                            with m.Case(o):
                                #m.d.sync += Print("Read address is ", read_address.get(ctx))
                                m.d.comb += self.bus.addr.eq(read_address.get(ctx))
                                
                                with m.If(self.bus.ack):
                                    self.load_arguments(m, iset[o], ctx, a, b)
                                    m.next = iset[o].on_read()
                    with m.Default():
                        # Catch while verifying
                        m.d.sync += Assert(0, "Invalid command for reading")
            for state in run_state:
                # These are states defined by instructions
                with m.State(state):
                    run_state[state](m, ctx, a, b, run_counter)
            
        return m