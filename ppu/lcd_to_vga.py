from amaranth import *
from amaranth.lib import wiring, enum, memory
from amaranth.lib.wiring import In, Out
from amaranth.sim import *
from amaranth.back import verilog
import math

import common.signature as signature

class UpsampleHorizontal(wiring.Component):
    def __init__(self, divide, shape = signature.PixelLayout()):
        self.divide = divide
        self.shape = shape
        super().__init__({
            "consume": In(signature.VideoStream(shape)),
            "produce": Out(signature.VideoStream(shape))
        })
        
    def elaborate(self, platform):
        m = Module()
        
        sync_reg = Signal()
        data_reg = Signal(self.shape)
        
        counter = Signal(range(self.divide))
        
        # Copy data to registers
        with m.If(self.consume.valid & self.consume.ready):
            m.d.sync += data_reg.eq(self.consume.data)
            m.d.sync += sync_reg.eq(self.consume.vsync)
        
        # Keep track of how many copies of data we have sent
        with m.If(self.produce.valid & self.produce.ready):
            with m.If(counter == self.divide - 1):
                m.d.sync += counter.eq(0)
            with m.Else():
                m.d.sync += counter.eq(counter + 1)
                
        with m.If(counter == 0):
            # Data from stream
            m.d.comb += self.produce.data.eq(self.consume.data)
            m.d.comb += self.produce.valid.eq(self.consume.valid)
            m.d.comb += self.consume.ready.eq(self.produce.ready)
        with m.Else():
            # From registers
            m.d.comb += self.produce.data.eq(data_reg)
            m.d.comb += self.produce.valid.eq(1)
            m.d.comb += self.consume.ready.eq(0) # Explicit block incoming stream
            
        # Sync flag on last sampled value
        with m.If(counter == self.divide - 1):
            m.d.comb += self.produce.vsync.eq(sync_reg)
        
        return m
        
class UpsampleVertical(wiring.Component):
    def __init__(self, divide = 4, width = 160, shape = signature.PixelLayout()):
        self.divide = divide
        self.width = width
        self.shape = shape
        super().__init__({
            "consume": In(signature.VideoStream(shape)),
            "produce": Out(signature.VideoStream(shape))
        })
        
    def elaborate(self, platform):
        m = Module()
        
        sync_flag = Signal()
        line_buffer = m.submodules.buffer = memory.Memory(shape = self.shape, depth = self.width, init = [])
        
        write_port = line_buffer.write_port()
        read_port = line_buffer.read_port(domain = "comb")
        
        addr = Signal(range(self.width))
        addr_last = Signal()
        
        m.d.comb += addr_last.eq(addr == self.width - 1)
        
        line_counter = Signal(range(self.divide))
        active = Signal()
        
        m.d.comb += active.eq(line_counter == 0)
        
        with m.If(self.consume.valid & self.consume.ready):
            with m.If(self.consume.vsync):
                m.d.sync += sync_flag.eq(1)
        
        m.d.comb += self.produce.vsync.eq(sync_flag & (line_counter == self.divide - 1) & (addr_last))
        
        with m.If(self.produce.valid & self.produce.ready):
            with m.If(self.produce.vsync):
                m.d.sync += sync_flag.eq(0)
            with m.If(addr_last):
                m.d.sync += addr.eq(0)
                with m.If(line_counter == self.divide - 1):
                    m.d.sync += line_counter.eq(0)
                with m.Else():
                    m.d.sync += line_counter.eq(line_counter + 1)
            with m.Else():
                m.d.sync += addr.eq(addr + 1)
        
        with m.If(active):
            m.d.comb += [
                self.produce.data.eq(self.consume.data),
                self.produce.valid.eq(self.consume.valid),
                self.consume.ready.eq(self.produce.ready)
            ]
            
            # Write to buffer
            m.d.comb += write_port.en.eq(self.produce.valid & self.produce.ready)
            m.d.comb += write_port.data.eq(self.produce.data)
            m.d.comb += write_port.addr.eq(addr)
        with m.Else():
            m.d.comb += read_port.addr.eq(addr)
            m.d.comb += self.produce.valid.eq(1)
            m.d.comb += self.produce.data.eq(read_port.data)
        
        return m

async def stream_put(ctx, stream, data, vsync):
    ctx.set(stream.data, data)
    ctx.set(stream.vsync, vsync)
    ctx.set(stream.valid, 1)
    await ctx.tick().until(stream.ready)
    ctx.set(stream.valid, 0)
    

async def stream_get(ctx, stream, expect, vsync):
    ctx.set(stream.ready, 1)
    data, vs = await ctx.tick().sample(stream.data, stream.vsync).until(stream.valid)
    assert expect == data
    assert vs == vsync
    ctx.set(stream.ready, 0)
    await ctx.tick().repeat(2)
    
def tb_vertical_resample():
    dut = UpsampleVertical(4, 4, shape = unsigned(16))
    
    async def write_process(ctx):
        for i in range(10):
            for j in range(4):
                await stream_put(ctx, dut.consume, j, 0)
    
    async def read_process(ctx):
        for i in range(100):
            for j in range(16):
                await stream_get(ctx, dut.produce, j % 4, 0)
    
    sim = Simulator(dut)
    sim.add_clock(1e-8)
    sim.add_testbench(write_process)
    sim.add_testbench(read_process)
    
    with sim.write_vcd("bench/tb_upsample_vertical.vcd"):
        sim.run_until(100*1e-8)
        
def tb_horizontal_resample():
    dut = UpsampleHorizontal(4, shape = unsigned(16))
    
    async def write_process(ctx):
        for i in range(10):
            for j in range(4):
                await stream_put(ctx, dut.consume, j, 0)
    
    async def read_process(ctx):
        for i in range(100):
            for j in range(16):
                await stream_get(ctx, dut.produce, math.floor(j / 4), 0)
    
    sim = Simulator(dut)
    sim.add_clock(1e-8)
    sim.add_testbench(write_process)
    sim.add_testbench(read_process)
    
    with sim.write_vcd("bench/tb_upsample_horizontal.vcd"):
        sim.run_until(100*1e-8)

class Upsample(wiring.Component):
    def __init__(self, divide = 4, width = 160, shape = signature.PixelLayout()):
        self.divide = divide
        self.width = width
        self.shape = shape
        
        super().__init__({
            "consume": In(signature.VideoStream(shape)),
            "produce": Out(signature.VideoStream(shape))
        })
        
    def elaborate(self, platform):
        m = Module()
        
        ver = m.submodules.ver = UpsampleVertical(self.divide, self.width, self.shape)
        hor = m.submodules.hor = UpsampleHorizontal(self.divide, self.shape)
        
        wiring.connect(m, wiring.flipped(self.consume), ver.consume)
        wiring.connect(m, ver.produce, hor.consume)
        wiring.connect(m, wiring.flipped(self.produce), hor.produce)
        
        return m
        
class HorizontalBorder(wiring.Component):
    def __init__(self, margin = 80, width = 800, fill = {"r": 0, "g": 0x0, "b": 0x6}, shape = signature.PixelLayout()):
        self.margin = margin
        self.width = width
        self.fill = Const(fill, shape)
        
        super().__init__({
            "consume": In(signature.VideoStream(shape)),
            "produce": Out(signature.VideoStream(shape))
        })
        
    def elaborate(self, platform):
        m = Module()
        
        sync_reg = Signal()
        counter = Signal(range(self.width))
        
        active = Signal()
        
        active_start = self.margin
        active_end = self.width - self.margin
        
        with m.If((counter >= active_start) & (counter < active_end)):
            m.d.comb += active.eq(1)
            
        counter_last = Signal()
            
        m.d.comb += counter_last.eq(counter == self.width - 1)
            
        m.d.comb += self.produce.vsync.eq(sync_reg & counter_last)
            
        with m.If(self.produce.valid & self.produce.ready):
            with m.If(self.produce.vsync):
                m.d.sync += sync_reg.eq(0)
            with m.If(counter_last):
                m.d.sync += counter.eq(0)
            with m.Else():
                m.d.sync += counter.eq(counter + 1)
                
        with m.If(self.consume.valid & self.consume.ready & self.consume.vsync):
            m.d.sync += sync_reg.eq(1)
            
        with m.If(active):
            m.d.comb += [
                self.produce.data.eq(self.consume.data),
                self.produce.valid.eq(self.consume.valid),
                self.consume.ready.eq(self.produce.ready)
            ]
        with m.Else():
            m.d.comb += self.produce.valid.eq(1)
            m.d.comb += self.produce.data.eq(self.fill)
        
        return m
        
class VerticalBorder(wiring.Component):
    def __init__(self, margin = 12, width = 800, fill = {"r": 0, "g": 0x6, "b": 0x6}, shape = signature.PixelLayout()):
        self.margin = margin
        self.width = width
        self.fill = Const(fill, shape)
        
        super().__init__({
            "consume": In(signature.VideoStream(shape)),
            "produce": Out(signature.VideoStream(shape))
        })
        
    def elaborate(self, platform):
        m = Module()
        
        fill_pixels = 2 * self.margin * self.width
        sync_location = self.margin * self.width
        
        active = Signal()
        pix_counter = Signal(range(fill_pixels))
        
        m.d.comb += self.produce.vsync.eq(pix_counter == sync_location - 1)
        
        # When we receive a vsync, start border
        with m.If(self.consume.valid & self.consume.ready):
            with m.If(self.consume.vsync):
                m.d.sync += active.eq(0)
                m.d.sync += pix_counter.eq(0)
        
        # Active
        with m.If(active):
            # Pass stream through (don't pass vsync)
            m.d.comb += [
                self.produce.valid.eq(self.consume.valid),
                self.consume.ready.eq(self.produce.ready),
                self.produce.data.eq(self.consume.data)
            ]
        with m.Else():
            # Fill border
            m.d.comb += self.produce.data.eq(self.fill)
            m.d.comb += self.produce.valid.eq(1)
            
            with m.If(self.produce.valid & self.produce.ready):
                # How many pixels have been filled
                with m.If(pix_counter == fill_pixels - 1):
                    m.d.sync += active.eq(1)
                    m.d.sync += pix_counter.eq(0)
                with m.Else():
                    m.d.sync += pix_counter.eq(pix_counter + 1)
        
        return m
        
class Border(wiring.Component):
    def __init__(self, hmargin, vmargin, shape = signature.PixelLayout()):
        self.h = hmargin
        self.v = vmargin
        self.shape = shape
        super().__init__({
            "consume": In(signature.VideoStream(shape)),
            "produce": Out(signature.VideoStream(shape))
        })
        
    def elaborate(self, platform):
        m = Module()
        
        hor = m.submodules.hor = HorizontalBorder(self.h, shape = self.shape)
        ver = m.submodules.ver = VerticalBorder(self.v, shape = self.shape)
        
        wiring.connect(m, wiring.flipped(self.consume), hor.consume)
        #wiring.connect(m, wiring.flipped(self.produce), hor.produce)
        wiring.connect(m, hor.produce, ver.consume)
        wiring.connect(m, wiring.flipped(self.produce), ver.produce)
        
        return m
        
class Resize(wiring.Component):
    def __init__(self, upsample, border, shape = signature.PixelLayout()):
        self.upsample = upsample
        self.border = border
        super().__init__({
            "consume": In(signature.VideoStream(shape)),
            "produce": Out(signature.VideoStream(shape))
        })
        
    def elaborate(self, platform):
        m = Module()
        
        m.submodules.upsample = self.upsample
        m.submodules.border = self.border
        
        wiring.connect(m, wiring.flipped(self.consume), self.upsample.consume)
        wiring.connect(m, self.upsample.produce, self.border.consume)
        wiring.connect(m, wiring.flipped(self.produce), self.border.produce)
        
        return m
        
if __name__ == "__main__":
    tb_vertical_resample()
    tb_horizontal_resample()
    
    upsample = Upsample(4, width = 160)
    border = Border(80, 12)
    
    resize = Resize(upsample, border)
    with open("build/lcd_to_vga.v", "w") as f:
        v = verilog.convert(resize, name = "lcd_to_vga")
        f.write(v)
    print("Wrote lcd to vga module")