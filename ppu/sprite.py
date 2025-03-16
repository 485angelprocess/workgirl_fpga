from amaranth import *
from amaranth.lib import wiring, enum, memory, data, fifo
from amaranth.lib.wiring import In, Out
from amaranth.sim import *
from amaranth.back import verilog

import common.signature as signature

from common.mem import WishboneRam, Cache, PixelMap

from common.signature import ImmReg, RegType, BusTb, StreamTb

def flag_layout():
    return data.StructLayout({
        "color": 4, # reserved
        "pallette": 1,
        "xflip": 1,
        "yflip": 1,
        "bg_priority": 1
    })

def oam_layout():
    return data.StructLayout({
        "y": 8,
        "x": 8,
        "tile": 8,
        "flags": 8
    })
    
class BusSelect(object):
    SpriteLoc = 0
    
class SpriteCheckReg(enum.Enum):
    Enable = 0
    Line = 1
    SpriteCount = 2
    Done = 3
    ValidOcc = 4
    
class SpriteCheck(wiring.Component):
    """
    Creates a stream of valid sprite lines for the current horizontal line
    """
    def __init__(self):
        super().__init__({
            "ctl": In(signature.Bus(4, 32)), # From ppu controller
            "bus": Out(signature.Bus(16, 32)), # Memory access
            "produce": Out(signature.DataStream(oam_layout()))
        })
        
    def elaborate(self, platform):
        m = Module()
        
        enable = Signal()
        line = Signal(8)
        num_sprites = Signal(8)
        done = Signal()
        
        sprite_height = 8
        
        valid_sprite = m.submodules.valid_sprites = fifo.SyncFIFO(width = oam_layout().size, depth = 10)
        
        regs = [
            ImmReg(SpriteCheckReg.Enable, enable),
            ImmReg(SpriteCheckReg.Line, line),
            ImmReg(SpriteCheckReg.SpriteCount, num_sprites),
            ImmReg(SpriteCheckReg.Done, done, RegType.Read),
            ImmReg(SpriteCheckReg.ValidOcc, valid_sprite.level, RegType.Read)
        ]
        
        ImmReg.run_write(m, self.ctl, regs)
        ImmReg.run_read(m, self.ctl, regs)
        
        sprite = Signal(oam_layout(), name = "sprite_attr")
        
        # Oam
        valid = Signal(1, name = "sprite_valid")
        
        x_valid = Signal()
        y_valid = Array([Signal(name = "y_{}".format(b)) for b in ("above", "below")])
        buffer_valid = Signal()
        
        m.d.comb += x_valid.eq(sprite.x > 0)
        m.d.comb += y_valid[0].eq((line + 16) >= (sprite.y))
        m.d.comb += y_valid[1].eq((line + 16) < (sprite.y + sprite_height))
        
        # TODO account for tall sprite mode (height == 16)
        y_below = (line + 16) < (sprite.y + sprite_height)
        m.d.comb += buffer_valid.eq(valid_sprite.level < 10)
            
        # Valid conditions
        m.d.comb += valid.eq(x_valid & y_valid[0] & y_valid[1] & buffer_valid)
        
        # This should not be read until all sprites in the line have been checked
        m.d.comb += [
            self.produce.data.eq(valid_sprite.r_data),
            self.produce.valid.eq(valid_sprite.r_rdy),
            valid_sprite.r_en.eq(self.produce.ready),
            self.produce.last.eq(valid_sprite.level == 1)
        ]
        
        sprite_oam_index = Signal(4)
        sprite_loc_pointer = Signal(8)
        sprite_loc_base = Signal(8)
        sprite_stride = 0
        
        m.d.comb += sprite_oam_index.eq(sprite.tile)
        
        with m.FSM() as fsm:
            with m.State("Idle"):
                # Wait for all sprites to be checked
                with m.If(enable & (num_sprites > 0)):
                    m.next = "SpriteCheck"
            with m.State("SpriteCheck"):
                # Read in data from ram
                m.d.comb += self.bus.sel.eq(BusSelect.SpriteLoc)
                m.d.comb += self.bus.addr.eq(sprite_loc_pointer << sprite_stride)
                m.d.comb += self.bus.stb.eq(1)
                m.d.comb += self.bus.cycle.eq(1)
                
                m.d.comb += sprite.eq(self.bus.r.data)
                
                with m.If(self.bus.stb & self.bus.ack):
                    with m.If(valid):
                        m.d.comb += valid_sprite.w_data.eq(sprite)
                        m.d.comb += valid_sprite.w_en.eq(1)
                    m.next = "NextSprite"
            with m.State("NextSprite"):
                with m.If(sprite_loc_pointer == num_sprites - 1):
                    m.d.sync += sprite_loc_pointer.eq(0)
                    m.d.sync += enable.eq(0)
                    m.next = "Idle"
                with m.Else():
                    m.d.sync += sprite_loc_pointer.eq(sprite_loc_pointer + 1)
                    m.next = "SpriteCheck"
                    
        with m.If(fsm.ongoing("Idle")):
            m.d.comb += done.eq(1)
        with m.Else():
            m.d.comb += done.eq(0)
                
        return m

def pack_oam(y, x, tile, flags):
    return y + (x << 8) + (tile << 16) + (flags << 24)
    
def map_oam(y, x, tile, flags):
    return {"y": y, "x": x, "tile": tile, "flags": flags}

def tb_sprite_checker():
    dut = Module()
    
    sc = dut.submodules.sc = SpriteCheck()
    ram = dut.submodules.ram = WishboneRam(64)
    
    ram.init = [pack_oam(18, 8, 0, 0), pack_oam(24, 16, 1, 0)]
    
    wiring.connect(dut, sc.bus, ram.bus)
    
    async def check_testbench(ctx):
        # Register setup
        await BusTb.write_single(ctx, sc.ctl, SpriteCheckReg.SpriteCount, 2)
        await BusTb.write_single(ctx, sc.ctl, SpriteCheckReg.Line, 2)
        
        # Check registers were written
        assert await BusTb.read_single(ctx, sc.ctl, SpriteCheckReg.SpriteCount) == 2
        assert await BusTb.read_single(ctx, sc.ctl, SpriteCheckReg.Line) == 2
        
        # Start write
        await BusTb.write_single(ctx, sc.ctl, SpriteCheckReg.Enable, 1)
        
        # Poll
        counter = await BusTb.poll(ctx, sc.ctl, SpriteCheckReg.Done, 1)
        
        print("Sprite read took {} cycles".format(counter))
        
        sprite = await StreamTb.get(ctx, sc.produce)
        
        assert sprite["y"] == 18
        assert sprite["x"] == 8
        assert sprite["tile"] == 0
        
    sim = Simulator(dut)
    sim.add_clock(1e-8)
    sim.add_testbench(check_testbench)
    
    with sim.write_vcd("bench/tb_sprite_checker.vcd"):
        sim.run()
        
if __name__ == "__main__":
    tb_sprite_checker()