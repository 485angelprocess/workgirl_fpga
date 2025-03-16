from amaranth import *
from amaranth.lib import wiring, memory
from amaranth.lib.wiring import In, Out
from amaranth.sim import *

from amaranth.back import verilog

import signature

from vga import to_pixel

class VideoStreamVerify(wiring.Component):
    def __init__(self, width = 800, height = 600, data = [0x00F], shape = signature.PixelLayout()):
        self.width = width
        self.height = height
        self.data = data
        self.shape = shape
        
        super().__init__({
            "produce": Out(signature.VideoStream(shape))
        })
        
    def elaborate(self, platform):
        m = Module()
        
        num_entries = len(self.data)
        
        mem_init = [Const(d, signature.PixelLayout()) for d in self.data]
        mem = m.submodules.mem = memory.Memory(shape = self.shape, depth = num_entries, init = mem_init)
        
        read_port = mem.read_port()
        
        pix_counter = Signal(range(self.width * self.height))
        pix_last = Signal()
        
        # Vsync flag
        m.d.comb += pix_last.eq(pix_counter == (self.width * self.height) - 1)
        m.d.comb += self.produce.vsync.eq(pix_last)
        
        counter = Signal(range(num_entries))
        
        m.d.comb += read_port.addr.eq(counter)
        
        m.d.comb += self.produce.data.eq(read_port.data)
        
        with m.If(read_port.en):
            m.d.sync += self.produce.valid.eq(1)
            
            # Where we are from memory
            with m.If(counter == num_entries - 1):
                m.d.sync += counter.eq(0)
            with m.Else():
                m.d.sync += counter.eq(counter + 1)
        
        # Load in data to start and then continuously stream
        with m.FSM() as fsm:
            with m.State("Init"):
                m.d.comb += read_port.en.eq(1)
                m.next = "Active"
            with m.State("Active"):
                m.d.comb += read_port.en.eq(self.produce.valid & self.produce.ready)
        
        with m.If(read_port.en & fsm.ongoing("Active")):
            # Where we are in frame
            with m.If(pix_last):
                m.d.sync += pix_counter.eq(0)
            with m.Else():
                m.d.sync += pix_counter.eq(pix_counter + 1)    
        
        return m

def verify_tb():
    data = [to_pixel(i) for i in range(16)]
    dut = VideoStreamVerify(4, 4, data)
    
    print("Data {}".format(data[0]))
    
    async def stream_get(ctx, stream, expect, vsync):
        ctx.set(stream.ready, 1)
        data, vs = await ctx.tick().sample(stream.data, stream.vsync).until(stream.valid)
        assert expect == data
        assert vs == vsync
        ctx.set(stream.ready, 0)
        
    async def testbench_produce(ctx):
        for i in range(100):
            index = i % len(data)
            expect = data[index]
            vs = (index == len(data) - 1)
            print("Index {}, expect {}, Vsync {}".format(index, expect, vs))
            await stream_get(ctx, dut.produce, expect, vs)
    
    sim = Simulator(dut)
    sim.add_clock(1e-8)
    sim.add_testbench(testbench_produce)
    with sim.write_vcd("bench/tb_verify.vcd"):
        sim.run_until(100*1e-8)
        
if __name__ == "__main__":
    verify_tb()
    
    width = 160
    height = 2
    
    data = list()
    for y in range(2):
        for x in range(width):
            if y < 72:
                if x < 40:
                    data.append(0x00F)
                elif x < 100:
                    data.append(0x0F0)
                else:
                    data.append(0xF00)
            else:
                if x < 40:
                    data.append(0xFFF)
                elif x < 100:
                    data.append(0x000)
                else:
                    data.append(0xFF0)
    
    data = [to_pixel(d) for d in data]
    
    with open("build/vga_verify.v", "w") as f:
        v = verilog.convert(VideoStreamVerify(width, height, data), name = "vga_verify")
        f.write(v)
    print("Wrote vga verify module")