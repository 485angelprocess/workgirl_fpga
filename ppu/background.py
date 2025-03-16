from amaranth import *
from amaranth.lib import wiring, enum, memory, data, fifo
from amaranth.lib.wiring import In, Out
from amaranth.sim import *
from amaranth.back import verilog

from ppu.sprite import *

import common.signature as signature
from common.signature import ImmReg, RegType
from common.signature import BusTb, StreamTb

from common.mem import WishboneRam, Cache, CacheMap

class TileGridReg(enum.Enum):
    Enable = 0
    Line = 1
    Wx = 2
    Wy = 3
    Sel = 4
    AddressMode = 5

# TODO load flags from memory if in color mode
class TileGrid(wiring.Component):
    def __init__(self):
        super().__init__({
            "ctl": In(signature.Bus(4, 32)),
            "bus": Out(signature.Bus(16, 8)),
            "produce": Out(signature.DataStream(oam_layout()))
        })
        
    def elaborate(self, platform):
        m = Module()
        
        enable = Signal()
        line = Signal(8)
        wx = Signal(8)
        wy = Signal(8)
        sel = Signal(16)
        address_mode = Signal()
        
        regs = [
            ImmReg(TileGridReg.Enable, enable),
            ImmReg(TileGridReg.Line, line),
            ImmReg(TileGridReg.Wx, wx),
            ImmReg(TileGridReg.Wy, wy),
            ImmReg(TileGridReg.Sel, sel),
            ImmReg(TileGridReg.AddressMode, address_mode)
        ]
        
        ImmReg.run_write(m, self.ctl, regs)
        ImmReg.run_read(m, self.ctl, regs)
        
        width = 160 >> 3
        
        tile_x = Signal(range(32))
        tile_y = Signal(range(32))
        
        offset_x_tile = wx >> 3
        offset_x_pix = wx & 0b111
        
        offset_y_tile = wy >> 3
        offset_y_pix = wy & 0b111
        
        m.d.comb += tile_y.eq(line >> 3)
        
        # Index of tile being read
        # Wx and Wy offset the tile
        x_addr = Signal(range(32))
        m.d.comb += x_addr.eq(tile_x + offset_x_tile)
        y_addr = Signal(range(32))
        m.d.comb += y_addr.eq(tile_y + offset_y_tile)
        
        m.d.comb += self.produce.valid.eq(self.bus.ack)
        
        # Map the tile location to line location
        m.d.comb += self.produce.data.y.eq((tile_y << 3) + offset_y_pix + 16)
        m.d.comb += self.produce.data.x.eq((tile_x << 3) + offset_x_pix)
        
        with m.If(address_mode == 0):
            m.d.comb += self.produce.data.tile.eq(self.bus.r.data)
        with m.Else():
            m.d.comb += self.produce.data.tile.eq(127 + self.bus.r.data.as_signed())
        m.d.comb += self.produce.last.eq(tile_x == 31)
        m.d.comb += self.produce.data.flags.eq(0)
        
        tile_address = Signal(8)
        
        m.d.comb += tile_address.eq(x_addr + (y_addr << 5))
        
        # $8000 method, tiles are unsigned
        m.d.comb += self.bus.addr.eq(tile_address)
        m.d.comb += self.bus.sel.eq(sel)
        
        with m.FSM():
            with m.State("Idle"):
                with m.If(enable):
                    m.d.sync += tile_x.eq(0)
                    m.next = "Load"
            with m.State("Load"):
                with m.If(~enable):
                    m.next = "Idle"
                m.d.comb += self.bus.stb.eq(self.produce.ready)
                m.d.comb += self.bus.cycle.eq(self.produce.ready)
                
                with m.If(self.produce.valid & self.produce.ready):
                    with m.If(tile_x == width):
                        m.d.sync += enable.eq(0)
                        m.d.sync += tile_x.eq(0)
                        m.next = "Idle"
                    with m.Else():
                        m.d.sync += tile_x.eq(tile_x + 1)
        
        return m
        
def tb_tile_grid_load():
    dut = Module()
    
    dut.submodules.grid = grid = TileGrid()
    dut.submodules.cache = cache = Cache(CacheMap(8, 4))
    dut.submodules.ram = ram = WishboneRam(64)
    
    ram.init = [0x04030201, 0x08070605, 0xAABBCCDD, 0x33221155]
    
    wiring.connect(dut, grid.bus, cache.cache)
    wiring.connect(dut, cache.bus, ram.bus)
    
    async def tg_testbench(ctx):
        await BusTb.write_single(ctx, grid.ctl, TileGridReg.Line, 2)
        await BusTb.write_single(ctx, grid.ctl, TileGridReg.Wx, 12)
        await BusTb.write_single(ctx, grid.ctl, TileGridReg.Wy, 4)
        
        assert await BusTb.read_single(ctx, grid.ctl, TileGridReg.Wx) == 12
        
        await BusTb.write_single(ctx, grid.ctl, TileGridReg.Enable, 1)
        
        for i in range(32):
            data = await StreamTb.get(ctx, grid.produce)
            print("Got attribute id: {}, y: {}, x: {}".format(data["tile"], data["y"], data["x"]))
            
    sim = Simulator(dut)
    sim.add_clock(1e-8)
    sim.add_testbench(tg_testbench)
            
    with sim.write_vcd('bench/tb_tile_grid.vcd'):
        sim.run_until(100 * 1e-8)
            
if __name__ == "__main__":
    tb_tile_grid_load()