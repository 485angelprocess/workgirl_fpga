from cpu.instruction import *
from cpu.processor import DebugReg, Processor
from cpu.alu import Alu

from common.mem import WishboneRam
from common.signature import BusTb

from amaranth.lib import wiring
from amaranth.sim import *

import itertools

ctl_map = dict()
ctl_map["reg"] = [i for i in range(8)]

queries = (0, 1, 255)

DELAY = 4

async def program_write(ctx, clk_en, program):
    idling = True
    
    counter = 0
    timeout = 16

    while idling:
        ctx.set(clk_en, 1) # Pulse clock
        ctx.set(program.ack, 1)
        clk, rst, strobe, ack = await ctx.tick().sample(program.stb).sample(program.ack)
        if strobe and ack:
            idling = False # program bus written
            ctx.set(program.ack, 0)
        ctx.set(clk_en, 0)
        for i in range(DELAY):
            clk, rst, strobe, ack = await ctx.tick().sample(program.stb).sample(program.ack)
            if strobe and ack:
                ctx.set(program.ack, 0)
                idling = False
        # Programs can't stall
        counter += 1
        if counter == timeout:
            raise Exception("Didn't load program in {} program cycles".format(timeout))

class ProcessorState(object):
    """
    Keep track of processor state
    """
    def __init__(self):
        """
        Initializer, mem is memory object of ram data
        """
        self.reset()
    
    def reset(self):
        self.reg = [0 for _ in range(8)]
        self.sp = 0
        self.pc = 0
        self.arg = [0 for _ in range(2)]
        
    async def update(self, ctx, debug):
        # Load state using debug bus
        for i in range(8):
            # Load 8 bit registers
            self.reg[i] = await BusTb.read_single(ctx, debug, i)
            
        # Load stack pointer
        self.sp = await BusTb.read_single(ctx, debug, DebugReg.SP)
        
        # Load program counter
        self.pc = await BusTb.read_single(ctx, debug, DebugReg.PC)
        
    def set_command(self, op, *args):
        self.arg = [op] + list(args)
        
    async def write_command(self, ctx, clk_en, program):
        """
        Write to the program bus
        """
        # Write arguments
        for i in range(len(self.arg)):
            ctx.set(program.r.data, self.arg[i])
            await program_write(ctx, clk_en, program)
        
    def set_wide(self, index, value):
        self.reg[index * 2] = value & 0xFF
        self.reg[(index * 2) + 1] = (value >> 8) & 0xFF
        
    def get_reg(self, index):
        # Get value of register at current state
        return self.reg[index]
    
    def get_wide(self, index):
        # Get value of wide register (HL) at current state
        base = index << 1 # 2 * index
        return self.reg[base] + (self.reg[base + 1] << 8)
        
    def get_arg(self, index):
        # Get argument passed to this program
        return self.arg[index]
        
    async def load_mem(self, ctx, rp, address):
        # stupid way to do this but copy contents
        # of ram to this,
        # feels like I should be able to do 
        # a promise? something like that, so I only read
        # needed values
        a = address % 256
        
        self.mem[a] = await BusTb.read_single(ctx, rp, a)
        #print("Loading memory address {}, got {}".format(a, self.mem[a]))
        
    def get_mem(self, address):
        # Get value at a pointer address
        a = address % 256
        r = self.mem[a]
        #print("Read memory at 0x{:02X}, got value {}".format(a, r))
        return r
        
    def verify_unimpacted(self, initial, impact):
        # Should clena this up later
        im = [im[1] for im in impact if im[0] == "reg"]
        
        for i in range(len(self.reg)):
            if i not in im:
                assert self.reg[i] == initial.reg[i]
        
    def copy(self):
        # Copy memory contents to array
        s = ProcessorState()
        s.mem = [int(m) for m in self.mem]
        s.reg = [int(r) for r in self.reg]
        s.arg = [int(a) for a in self.arg]
        s.sp = int(self.sp)
        s.pc = int(self.pc)
        return s
        
    def set(self, label, index, value):
        if label == "reg":
            self.reg[index] = value
        if label == "sp":
            self.sp = value
            
    async def init(self, ctx, debug):
        for i in range(len(self.reg)):
            await BusTb.write_single(ctx, debug, i, self.reg[i])
        await BusTb.write_single(ctx, debug, 0x08, self.sp)
        await BusTb.write_single(ctx, debug, 0x09, self.pc)
        
class CpuVerifier(object):
    def __init__(self, contents = None):
        pass
        
    def setup(self, contents = None):
        dut = Module()
        dut.submodules.cpu = cpu = Processor()
        dut.submodules.mem = mem = WishboneRam(256, write_shape = 8)
        
        dut.submodules.alu = alu = Alu()
        
        if contents is not None:
            mem.init = contents
        
        wiring.connect(dut, cpu.bus, mem.bus)
        wiring.connect(dut, cpu.alu, alu.bus)
        
        return dut, cpu, mem, alu
    
    def run_simulate(self, opcode, inst, state_params, args, verbose = 0): # TODO args
        impact = inst.impact()
        
        mem_init = [i for i in range(256)]
        
        dut, cpu, mem, alu = self.setup(mem_init)
        
        mem_write = [im for im in impact if im[0] == "mem"]
        
        async def process(ctx):
            initial = ProcessorState()
            initial.mem = mem_init
            
            # Set impacted register to initial case values
            for (im, c) in zip(impact, state_params):
                print("Setting {}: {} to {}".format(im[0], im[1], c))
                initial.set(im[0], im[1], c)
            
            # Force initial conditions
            inst.verification_startup(initial)
            
            await initial.init(ctx, cpu.debug)
            
            # Always run a noop after so that the program is known to be finished
            initial.set_command(opcode, *( list(args) + ( [0x00] )))
            
            result = initial.copy()
            await result.write_command(ctx, cpu.clk_en, cpu.program)
            await result.update(ctx, cpu.debug)
            
            # Load only memory that was expected to be written
            for m in mem_write:
                # A little obfuscated here, will try to rewrite
                address = m[1](initial)
                await result.load_mem(ctx, mem.verify, address)
            
            # Confirm that all other registers remain static
            result.verify_unimpacted(initial, impact)
            try:
                # Check conditions for this instruction
                inst.verify(initial, result)
            except AssertionError as e:
                print("Verification failed")
                # TODO print nicely
                print("Initial state: {}", initial.reg)
                print("Result state : {}", result.reg)
                raise e
        
        sim = Simulator(dut)
        sim.add_clock(1e-8)
        sim.add_testbench(process)
        
        with sim.write_vcd("bench/formal.vcd"):
            sim.run()
        
        #try:
        #    sim.run()
        #except Exception as e:
        #    print("Verify failed {}".format(e))
        #    sim.reset()
        #    with sim.write_vcd("bench/formal.vcd"):
        #        sim.run()
        
    
    def verify(self, opcode, instruction, verbose = 0):
        impact = instruction.impact()
        
        print("Instruction 0x{:02X}: {}".format(opcode, str(instruction)))
        
        if verbose > 0:
            instruction.print_info()
        
        if verbose > 1:
            print("Affected state variables of {} are {}".format(str(instruction), impact))
        
        reg_impact = [im for im in impact if im[0] == "reg"]
        
        case_len = len(reg_impact) + instruction.arg_length()
        
        cases = list(itertools.product(queries, repeat = case_len))
        
        if verbose > 1:
            print("Affected register of {} are {}".format(str(instruction), reg_impact))
            print("Cases are {}, options are {}".format(cases, queries))
        
        for case in cases:
            # State params
            # This is the initial states of affected registers
            state_params = case[0:len(impact)]
            
            # These are the variations in arguments available
            args = case[len(impact):]
            
            if verbose > 0:
                print("Checking 0x{:02X}: {} with params: {}, args: {}".format(opcode, str(instruction), state_params, args))
            
            self.run_simulate(opcode, instruction, state_params, args, verbose)
            
        print("OK")