"""
VGA Display driver
"""
from amaranth import *
from amaranth.lib import wiring, enum
from amaranth.lib.wiring import In, Out
from amaranth.sim import *
from amaranth.back import verilog

import common.signature as signature

from common.signature import StreamTb

class VideoRegion(object):
    def __init__(self, active, front_porch, sync, back_porch):
        self.active = active
        self.front_porch = front_porch
        self.sync = sync
        self.back_porch = back_porch
        
    def total(self):
        return self.active + self.front_porch + self.sync + self.back_porch
        
class VideoState(enum.Enum):
    """
    Represents section of video
    """
    ACTIVE  = 0 # Video is currently sending
    FP      = 1 # Front porch
    SYNC    = 2 # Sync section
    BP      = 3 # Back porch
        
class VideoCounter(wiring.Component):
    """
    Horizontal or vertical video counter
    """
    def __init__(self, region):
        self.region = region
        super().__init__({
            "clk_en": In(1), # Pixel clock or horizontal clock
            "state": Out(VideoState),
            "ovf": Out(1)
        })
    
    def elaborate(self, platform):
        m = Module()
        
        counter = Signal(range(self.region.total()))
        ovf = Signal()
        
        m.d.comb += ovf.eq(counter == self.region.total() - 1)
        m.d.comb += self.ovf.eq(ovf & self.clk_en)
        
        
        # Map video section
        with m.If(counter < self.region.back_porch):
            m.d.comb += self.state.eq(VideoState.BP)
        with m.Elif(counter < self.region.back_porch + self.region.active):
            m.d.comb += self.state.eq(VideoState.ACTIVE)
        with m.Elif(counter < self.region.back_porch + self.region.active + self.region.sync):
            m.d.comb += self.state.eq(VideoState.FP)
        with m.Else():
            m.d.comb += self.state.eq(VideoState.SYNC)
        
        with m.If(self.clk_en):
            with m.If(self.ovf):
                m.d.sync += counter.eq(0)
            with m.Else():
                m.d.sync += counter.eq(counter + 1)
        
        return m
        
class Polarity(object):
    POS = 0
    NEG = 1
        
class VgaDriver(wiring.Component):
    def __init__(self, pix_divide, 
                        hregion, 
                        vregion,
                        polarity = Polarity.POS,
                        shape = signature.PixelLayout()):
        self.hregion = hregion
        self.vregion = vregion
        self.pix_divide = pix_divide
        self.polarity = polarity
        
        super().__init__({
            "consume": In(signature.VideoStream(shape)),
            "data": Out(12),
            "hsync": Out(1),
            "vsync": Out(1)
        })
        
    def elaborate(self, platform):
        m = Module()
        
        # Pixel clock divider
        pix_counter = Signal(range(self.pix_divide))
        pix_clk = Signal()
        
        m.d.comb += pix_clk.eq(pix_counter == 0)
        
        with m.If(pix_counter == self.pix_divide - 1):
            m.d.sync += pix_counter.eq(0)
        with m.Else():
            m.d.sync += pix_counter.eq(pix_counter + 1)
            
        # Horizontal region
        hcounter = m.submodules.hcounter = VideoCounter(self.hregion)
        
        m.d.comb += hcounter.clk_en.eq(pix_clk)
        
        # Vertical region
        vcounter = m.submodules.vcounter = VideoCounter(self.vregion)
        
        m.d.comb += vcounter.clk_en.eq(hcounter.ovf)
        
        input_enable = Signal(init = 1)
        video_active = Signal()
        
        m.d.comb += video_active.eq(
                        (hcounter.state == VideoState.ACTIVE) &
                        (vcounter.state == VideoState.ACTIVE))
        
        with m.If(input_enable & video_active):
            m.d.comb += self.consume.ready.eq(pix_clk)
            
        # Stop sending at end of frame
        with m.If(self.consume.ready & self.consume.valid & self.consume.vsync):
            m.d.sync += input_enable.eq(0)
        
        # Reached end of output frame, data can be send when pixels are active
        with m.If(vcounter.state == VideoState.SYNC):
            m.d.sync += input_enable.eq(1)
        
        with m.If(video_active & input_enable):
            # Top 4 bits of each pixel
            m.d.comb += self.data[0:4].eq(self.consume.data.r[-4:])
            m.d.comb += self.data[4:8].eq(self.consume.data.g[-4:])
            m.d.comb += self.data[8:12].eq(self.consume.data.b[-4:])
        with m.Else():
            m.d.comb += self.data.eq(0)
            
        # Sync flags
        if self.polarity == Polarity.POS:
            m.d.comb += self.hsync.eq(hcounter.state == VideoState.SYNC)
            m.d.comb += self.vsync.eq(vcounter.state == VideoState.SYNC)
        else:
            m.d.comb += self.hsync.eq(hcounter.state != VideoState.SYNC)
            m.d.comb += self.vsync.eq(vcounter.state != VideoState.SYNC)
        
        return m

def to_pixel(v):
    return {
        "r": (v) & 0b1111,
        "b": (v >> 4) & 0b1111,
        "g": (v >> 8) & 0b1111
    }

def vga_tb(pix, hregion, vregion):
    dut = VgaDriver(pix, hregion, vregion)
    
    async def testbench_vga(ctx):
        await StreamTb.video_put(ctx, dut.consume, to_pixel(0xABC))
        await StreamTb.video_put(ctx, dut.consume, to_pixel(0xDEF))
        await StreamTb.video_put(ctx, dut.consume, to_pixel(0x123))
        await StreamTb.video_put(ctx, dut.consume, to_pixel(0x456))
    
    sim = Simulator(dut)
    sim.add_clock(1e-8)
    sim.add_testbench(testbench_vga)
    with sim.write_vcd("bench/vga.vcd"):
        sim.run_until(1000*1e-8)
        
if __name__ == "__main__":
    vga_tb(3, VideoRegion(10, 2, 2, 2), VideoRegion(10, 2, 2, 2))
    
    vga = VgaDriver(3, VideoRegion(800, 40, 128, 88), VideoRegion(600, 1, 4, 23))
    with open("build/vga_driver.v", "w") as f:
        v = verilog.convert(vga, name = "vga_driver_svga")
        f.write(v)
    print("Wrote vga module")