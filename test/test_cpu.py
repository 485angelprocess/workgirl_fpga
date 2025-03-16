from common.mem import WishboneRam, Cache, CacheMap
from common.signature import BusTb

from cpu.processor import DebugReg, Processor
from cpu.instruction import Reg

from amaranth import *
from amaranth.sim import *
from amaranth.lib import wiring

import unittest

async def clock_set(ctx, cpu):
    clk, rst, strobe, ack = await ctx.tick().sample(cpu.program.stb).sample(cpu.program.ack)
    return strobe and ack

async def step_program(ctx, cpu, lines, delay = 10):
    l = 0
    while l < lines:
        ctx.set(cpu.clk_en, 1)
        if await clock_set(ctx, cpu):
            l += 1
        ctx.set(cpu.clk_en, 0)
        for _ in range(delay):
            if await clock_set(ctx, cpu):
                l += 1
        
class TestCpu(unittest.TestCase):
    def setup(self, program):
        dut = Module()
        dut.submodules.cpu = cpu = Processor()
        dut.submodules.prog_mem = prog = WishboneRam(64, write_shape = 8)
        dut.submodules.mem = mem = WishboneRam(64, write_shape = 16)
        
        prog.init = program
        
        wiring.connect(dut, cpu.bus, mem.bus)
        wiring.connect(dut, cpu.program, prog.bus)
        
        return dut, cpu, prog
        
    def simulate(self, dut, name, *process):
        sim = Simulator(dut)
        sim.add_clock(1e-8)
        for p in process:
            sim.add_testbench(p)
        
        with sim.write_vcd("bench/tb_cpu_{}.vcd".format(name)):
            sim.run()
        
    def test_noop(self):
        program = [0x00, 0x00, 0x00, 0x00]
        dut, cpu, prog = self.setup(program)
        
        async def process(ctx):
            await step_program(ctx, cpu, len(program))
            assert await BusTb.read_single(ctx, cpu.debug, Reg.PC) == 4
        
        self.simulate(dut, "noop", process)
    
    def test_load_short(self):
        program = [0x06, 1, 0x0E, 2, 0x16, 3, 0x1E, 4, 0x26, 5, 0x2E, 6]
        dut, cpu, prog = self.setup(program)
        
        async def process(ctx):
            await step_program(ctx, cpu, len(program))
            assert await BusTb.read_single(ctx, cpu.debug, Reg.B) == 1
            assert await BusTb.read_single(ctx, cpu.debug, Reg.C) == 2
            assert await BusTb.read_single(ctx, cpu.debug, Reg.D) == 3
            assert await BusTb.read_single(ctx, cpu.debug, Reg.E) == 4
            assert await BusTb.read_single(ctx, cpu.debug, Reg.H) == 5
            assert await BusTb.read_single(ctx, cpu.debug, Reg.L) == 6
        
        self.simulate(dut, "load_u8", process)
    
    def test_load_reg(self):
        program = list()
        program += [0x06, 0x10] # Put 0x10 into B
        program += [0x78] # Copy B -> A
        program += [0x0E, 0x11] # Put 0x11 into C
        program += [0x26, 0x00] # Set H to 0
        program += [0x2E, 0x02] # Set L to 0x02 (address)
        program += [0x71] # Put contents of C to memory address 0x02
        program += [0x5E] # Load contents of 0x02 into E
        program += [0x00] # TEMP: program doesn't indicate its finished without a noop at the end
        
        dut, cpu, prog = self.setup(program)
        
        async def process(ctx):
            await step_program(ctx, cpu, len(program))
            self.assertEqual(await BusTb.read_single(ctx, cpu.debug, Reg.B), 0x10, "immediate load to B sets B to 0x10")
            self.assertEqual(await BusTb.read_single(ctx, cpu.debug, Reg.A), 0x10, "B copies to A")
            self.assertEqual(await BusTb.read_single(ctx, cpu.debug, Reg.C), 0x11, "Immediate load to C sets C to 0x11")
            self.assertEqual(await BusTb.read_single(ctx, cpu.debug, Reg.L), 0x02, "Immediate load to L sets L to 0x02")
            self.assertEqual(await BusTb.read_single(ctx, cpu.debug, Reg.H), 0x00, "Immediate load to H set H to 0x00")
            self.assertEqual(await BusTb.read_single(ctx, cpu.debug, Reg.E), 0x11, "E is loaded from memory")
        
        self.simulate(dut, "load_reg", process)
        
    def test_load_a(self):
        program = list()
        program += [0x3E, 0x10] #load immediate 1 into A
        program += [0x47] # Copy into register B
        program += [0x4F] # Copy into register C
        program += [0x57] # Copy into register D
        program += [0x5F] # Copy into register E
        program += [0x67] # Copy into register H
        program += [0x6F] # Copy into register L
        
        dut, cpu, prog = self.setup(program)
        
        async def process(ctx):
            await step_program(ctx, cpu, len(program))
            for i in (Reg.B, Reg.C, Reg.D, Reg.D, Reg.E, Reg.H, Reg.L):
                self.assertEqual(await BusTb.read_single(ctx, cpu.debug, i), 0x10, "Register {} should be 16".format(i))
                
        self.simulate(dut, "load_a", process)
                
    def test_inc_dec(self):
        program = list()
        program += [0x3E, 0x10] # Load immediate to A
        program += [0x26, 0x00]
        program += [0x2E, 0x02] # HL == 2
        program += [0x22] # Put A into HL (0)
        program += [0x3E, 0x11]
        program += [0x22]
        program += [0x3E, 0x15]
        program += [0x77] # Load (HL) into A don't increment
        program += [0x3A] # Copy into A
        program += [0x47] # copy A->B, B should have 0x15
        program += [0x3A] # copy into A
        program += [0x4F] # Copy A->C, should have 0x11
        program += [0x3A] # Copy into A
        program += [0x57] # Copy into D should have 010
        dut, cpu, prog = self.setup(program)
        
        async def process(ctx):
            await step_program(ctx, cpu, len(program))
            self.assertEqual(await BusTb.read_single(ctx, cpu.debug, Reg.B), 0x15, "B should have 0x15 loaded from memory")
            self.assertEqual(await BusTb.read_single(ctx, cpu.debug, Reg.C), 0x11, "C should have 0x11")
            self.assertEqual(await BusTb.read_single(ctx, cpu.debug, Reg.D), 0x10, "D should have 0x10")
        
        self.simulate(dut, "load_inc_dec_macros", process)

if __name__ == "__main__":
    unittest.main()