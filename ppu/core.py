from amaranth import *
from amaranth.lib import wiring, enum, memory, data, fifo
from amaranth.lib.wiring import In, Out
from amaranth.sim import *
from amaranth.back import verilog

import common.signature as signature

from common.mem import DeviceWithCache, Cache, CacheMap, PixelMap
from common.interconnect import Interconnect
from common.signature import BusTb

from ppu.pixel import LineBuffer, ColorMap, PixelCombine
from ppu.background import TileGrid
from ppu.sprite import SpriteCheck

LCD_SIZE = 160*144

class PpuController(wiring.Component):
    def __init__(self):
        super().__init__({
            "ctl_consume": In(signature.Bus(4, 32)),
            "ctl_produce": Out(signature.Bus(4, 32))
        })
    
    def elaborate(self, platform): 
        m = Module()
        
        return m
        
class RamAccess(object):
    RAM = 0
    VRAM = 1
    
def GbaOffsets():
    return {
        "bg_map_1": 0x9C00,
        "bg_map_2": 0x9800
    }

class PpuCore(wiring.Component):
    def __init__(self):
        super().__init__({
            "ctl": In(signature.Bus(4, 32)), # from cpi
            "vram": Out(signature.Bus(16, 32)), # for vram
            "dma": Out(signature.Bus(16, 32)),  # for cpu ram
            "lcd": Out(signature.DataStream(16)) # for lcd
        })
        
    def elaborate(self, platform):
        m = Module()
        
        ##################
        ## Background ####
        ##################
        # Background
        background = DeviceWithCache(TileGrid(), Cache(CacheMap(8, 4)))
        background.connect(m, "background")
        
        # Line buffer
        background_buffer = DeviceWithCache(LineBuffer(), Cache(PixelMap()))
        background_buffer.connect(m, "background_buffer")
        
        wiring.connect(m, background.device.produce, background_buffer.device.consume)
        
        ####################
        ## Sprite ##########
        ####################
        sprite = DeviceWithCache(SpriteCheck(), Cache(CacheMap(32, 1)))
        sprite.connect(m, "sprite")
        
        sprite_buffer = DeviceWithCache(LineBuffer(), Cache(PixelMap()))
        sprite_buffer.connect(m, "sprite_buffer")
        
        wiring.connect(m, sprite.device.produce, sprite_buffer.device.consume)
        
        #######################
        ### Mix and render ####
        #######################
        pixel = m.submodules.pixel = PixelCombine()
        wiring.connect(m, sprite_buffer.device.produce, pixel.a)
        wiring.connect(m, background_buffer.device.produce, pixel.b)
        
        color_map = m.submodules.color_map = ColorMap()
        
        wiring.connect(m, pixel.produce, color_map.consume)
        wiring.connect(m, color_map.produce, wiring.flipped(self.lcd))
        
        print("Memory bus")
        mem_devices = list()
        mem_devices += [background.cache.bus, background_buffer.cache.bus]
        mem_devices += [sprite.cache.bus, sprite_buffer.cache.bus]
        
        mem_interconnect = m.submodules.mem_interconnect = Interconnect(len(mem_devices), 2)
        
        # Bus to memory
        mem_interconnect.connect_inputs(m, *mem_devices)
        mem_interconnect.connect_outputs(m, self.dma, self.vram, flip = True)
        
        print("Control bus")
        devices = list()
        devices += [background.device.ctl, background.cache.ctl]
        devices += [background_buffer.device.ctl, background_buffer.cache.ctl]
        devices += [sprite.device.ctl, sprite.cache.ctl]
        devices += [sprite_buffer.device.ctl, sprite_buffer.cache.ctl]
        devices.append(color_map.ctl)
        
        ctl_interconnect = m.submodules.ctl_interconnect = Interconnect(1, len(devices), address_shape = 4)
        
        # Controller to registers
        ctl_interconnect.connect_inputs(m, self.ctl, flip = True)
        ctl_interconnect.connect_outputs(m, *devices)
        
        return m

def tb_core():
    dut = Module()
    
    dut.submodules.core = core = PpuCore()
    dut.submodules.mem = mem = WishboneRam(64)
    
    async def process(ctx):
        # Load line of window
        ctl = core.ctl
        BusTb.sel(ctx, ctl, 0)
        await BusTb.write_single(ctx, ctl, TileGridReg.Line, 2)
        assert await BusTb.read_single(ctx, ctl, TileGridReg.Line) == 2
        
        BusTb.sel(ctx, ctl, 1)
        await BusTb.write_single(ctx, ctl, TileGridReg.Line, 2)
        assert await BusTb.read_single(ctx, ctl, TileGridReg.Line) == 2
        
    sim = Simulator(dut)
    sim.add_clock(1e-8)
    sim.add_testbench(process)
    
    with sim.write_vcd("bench/tb_core.vcd"):
        sim.run() 
        
if __name__ == "__main__":
    tb_core()