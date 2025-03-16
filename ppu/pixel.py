from amaranth import *
from amaranth.lib import wiring, enum, memory, data
from amaranth.lib.wiring import In, Out

import common.signature as signature
from common.signature import ImmReg
from ppu.sprite import oam_layout, flag_layout
from common.mem import Cache, PixelMap

def pixel_layout(color_width = 2, has_valid = True):
    sig = {
        "color": color_width,
        "flags": 8,
    }
    if has_valid:
        sig |= {"valid": 1}
    return data.StructLayout(sig)
        
class LineBufferReg(enum.Enum):
    Enable = 0
    Line = 1
    Read = 2
        
class LineBuffer(wiring.Component):
    def __init__(self, color_width = 2, sel = 1):
        self.color_width = color_width
        self.sel = sel
        super().__init__({
            "ctl": In(signature.Bus(4, 32)),
            "bus": Out(signature.Bus(16, color_width)), # this is going go to a cache
            "consume": In(signature.DataStream(oam_layout())),
            "produce": Out(signature.DataStream(pixel_layout(color_width)))
        })
        
    def elaborate(self, platform):
        m = Module()
        
        mem_reset = Signal()
        
        # Store a line of data
        mem = memory.Memory(
                            shape = pixel_layout(self.color_width, has_valid = False).size, 
                            depth = 256, 
                            init = [])
        line_buffer = m.submodules.buffer = ResetInserter(mem_reset)(mem)
        
        valid = Signal(256)
        
        enable = Signal()
        line = Signal(8)
        read = Signal()
        
        regs = [
            ImmReg(LineBufferReg.Enable, enable),
            ImmReg(LineBufferReg.Line, line),
            ImmReg(LineBufferReg.Read, read)
        ]
        
        ImmReg.run_write(m, self.ctl, regs)
        ImmReg.run_read(m, self.ctl, regs)
        
        ##################################
        ## Read tile pixels ##############
        ##################################
        x_minor = Signal(range(8))
        y_minor = Signal(range(8))
        
        x_tile = Signal(range(8))
        y_tile = Signal(range(8))
        
        pixel = Signal(8)
        
        oam = Signal(oam_layout())
        flags = Signal(flag_layout())
        
        m.d.comb += flags.eq(oam.flags)
        
        # Load attributes of sprite
        with m.If(self.consume.ready & self.consume.valid):
            m.d.sync += oam.eq(self.consume.data)
        
        # Flip coordinates
        with m.If(flags.yflip):
            m.d.comb += x_tile.eq(7 - x_minor)
        with m.Else():
            m.d.comb += x_tile.eq(x_minor)
            
        with m.If(flags.xflip):
            m.d.comb += y_tile.eq(7 - y_minor)
        with m.Else():
            m.d.comb += y_tile.eq(y_minor)
        
        # Line of tile is based on which line we are currently on
        m.d.comb += y_minor.eq((line + 16) - oam.y)
        
        tile_base = Signal(8)
        tile_stride = 6
        
        m.d.comb += tile_base.eq(oam.tile)
        
        addr = Signal(16)
        
        # Base of tile and y and x
        m.d.comb += addr.eq((tile_base << tile_stride) + (y_tile << 3) + (x_tile))
        m.d.comb += self.bus.addr.eq(addr)
        m.d.comb += self.bus.sel.eq(self.sel)
        
        x_valid = Signal()
        y_valid = Signal()
        
        # Is this actually in range
        m.d.comb += x_valid.eq((oam.x + x_minor) >= 8)
        #m.d.comb += y_valid.eq(( (oam.y + y_minor) > (line + 16) ) & ( (oam.y + y_minor) < (line + 24) ))
        m.d.comb += y_valid.eq(( (oam.y) > (line + 8) ) & ( (oam.y) <= (line + 16) ))
        
        # Write to line buffer
        write_port = line_buffer.write_port()
        
        m.d.comb += write_port.en.eq(self.bus.stb & self.bus.ack & x_valid & y_valid)
        # Write data, include flag that this pixel exists
        # Could read data, instead of providing stream
        write_data = Signal(pixel_layout(self.color_width))
        m.d.comb += write_data.color.eq(self.bus.r.data)
        m.d.comb += write_data.flags.eq(flags)
        m.d.comb += write_port.data.eq(write_data)
        # What x coordinate we're on
        m.d.comb += write_port.addr.eq((oam.x + x_tile) - 8)
        
        with m.If(write_port.en):
            m.d.sync += valid.bit_select(write_port.addr, 1).eq(1)
        
        read_port = line_buffer.read_port(domain = "comb")
        
        m.d.comb += self.produce.data.color.eq(read_port.data[0:self.color_width])
        m.d.comb += self.produce.data.flags.eq(read_port.data[self.color_width:])
        m.d.comb += self.produce.data.valid.eq(valid.bit_select(read_port.addr, 1))
        
        m.d.comb += self.produce.last.eq(read_port.addr == 160 - 1)
        
        last_flag = Signal()
        
        with m.FSM():
            with m.State("Reset"):
                # Reset memory contents
                m.d.comb += mem_reset.eq(1)
                
                m.next = "Idle"
            with m.State("Idle"):
                # Wait for stream of pixels to be ready
                with m.If(read):
                    # end of sync reached, can't load any more pixels
                    m.next = "Read"
                m.d.comb += self.consume.ready.eq(enable)
                with m.If(self.consume.ready & self.consume.valid):
                    m.d.sync += last_flag.eq(self.consume.last)
                    m.d.sync += x_minor.eq(0)
                    m.next = "Load"
            with m.State("Load"):
                # Write tile pixels to line buffe
                m.d.comb += self.bus.cycle.eq(1)
                m.d.comb += self.bus.stb.eq(1)
                
                with m.If(self.bus.stb & self.bus.ack):
                    with m.If(x_minor == 7):
                        with m.If(last_flag):
                            m.next = "Read"
                        with m.Else():
                            m.next = "Idle"
                    with m.Else():
                        m.d.sync += x_minor.eq(x_minor + 1)
            with m.State("Read"):
                # After we loaded all sprites, we can provide fifo output
                m.d.comb += self.produce.valid.eq(1)
                
                with m.If(self.produce.valid & self.produce.ready):
                    with m.If(self.produce.last):
                        m.d.sync += read_port.addr.eq(0)
                        m.d.sync += enable.eq(0)
                        m.d.sync += read.eq(0)
                        m.d.sync += valid.eq(0)
                        m.next = "Reset"
                    with m.Else():
                        m.d.sync += read_port.addr.eq(read_port.addr + 1)
                    
        return m
        
def tb_line_buffer():
    dut = Module()
    
    sb = dut.submodules.sb = LineBuffer()
    cache = dut.submodules.cache = Cache(PixelMap())
    # Represents pixel cache
    ram = dut.submodules.ram = WishboneRam(64, write_shape = 32)
    
    ram.init = [0xC3A5C3A5] * 8
    
    wiring.connect(dut, sb.bus, cache.cache)
    wiring.connect(dut, cache.bus, ram.bus)
    
    async def check_testbench(ctx):
        # Register setup
        await BusTb.write_single(ctx, sb.ctl, SpriteLineReg.Line, 2)
        assert await BusTb.read_single(ctx, sb.ctl, SpriteLineReg.Line) == 2
        
        await BusTb.write_single(ctx, sb.ctl, SpriteCheckReg.Enable, 1)
        
        await StreamTb.put(ctx, sb.consume, map_oam(18, 8, 0, 0), True)
        
        for i in range(160):
            data = await StreamTb.get(ctx, sb.produce)
            if data["valid"]:
                print("Got data {}".format(data["color"]))
        
    sim = Simulator(dut)
    sim.add_clock(1e-8)
    sim.add_testbench(check_testbench)
    
    with sim.write_vcd("bench/tb_sprite_line_buffer.vcd"):
        sim.run()
        
def rule_priority_b(a, b):
    return ~b.valid

def rule_priority_a(a, b):
    return a.valid
    
def rule_a_alpha(a, b):
    return a.valid & (a.color > 0)
    
def blend_normal(above, below):
    return above
    
class PixelCombine(wiring.Component):
    """
    Take two streams, align them
    and apply rule and blend them
    """
    def __init__(self, rule = rule_alpha_a, blend = blend_normal):
        """
        :arg rule: callable for arguments (signal a data, signal b data) which 
            returns amaranth boolean
            :evaluates to true: A is upper pixel
            :evaluates to false: B is upper pixel
        :arg blend: callable for arguments (signal upper data, signal lower data)
            which returns amaranth boolean
            returns mixed data of same shape as input data
        """
        self.rule = rule
        self.blend = blend
        super().__init__({
            "a": In(signature.DataStream(pixel_layout())),
            "b": In(signature.DataStream(pixel_layout())),
            "produce": Out(signature.DataStream(pixel_layout()))
        })
    
    def elaborate(self, platform):
        m = Module()
        
        m.d.comb += self.produce.valid.eq(self.a.valid & self.b.valid)
        m.d.comb += self.a.ready.eq(self.produce.valid & self.produce.ready)
        m.d.comb += self.b.ready.eq(self.produce.valid & self.produce.ready)
        m.d.comb += self.produce.last.eq(self.a.last | self.b.last) # ? 
        
        upper_pixel = Signal()
        m.d.comb += upper_pixel.eq(self.rule(self.a.data, self.b.data))
        
        with m.If(upper_pixel):
            m.d.comb += self.produce.data.eq(self.blend(self.a.data, self.b.data))
        with m.Else():
            m.d.comb += self.produce.data.eq(self.blend(self.b.data, self.a.data))
        
        return m

def rgb555(r, g, b):
    return (r >> 3) + ((g >> 3) << 5) + ((b >> 3) << 10)

class ColorMap(wiring.Component):
    """
    Look up colors of pallette
    Not fully operational for GBC
    """
    def __init__(self, num_colors = 4, init = [rgb555(0, 0, 0), rgb555(50, 50, 50), rgb555(100, 100, 100), rgb555(255, 255, 255)]):
        self.num_colors = num_colors
        self.init = init
        super().__init__({
            "ctl": In(signature.Bus(4, 32)),
            "consume": In(signature.DataStream(pixel_layout())),
            "produce": Out(signature.DataStream(16))
        })
        
    def elaborate(self, platform):
        m = Module()
        
        color = Array([Signal(16, name = "color_{}".format(i), init = self.init[i]) 
                                for i in range(self.num_colors)])
        
        regs = list()
        
        # Color mapping from control bus
        for i in range(self.num_colors):
            regs.append(ImmReg(i, color[i]))
        
        ImmReg.run_write(m, self.ctl, regs)
        ImmReg.run_read(m, self.ctl, regs)
        
        with m.If(self.consume.data.valid):
            m.d.comb += self.produce.data.eq(color[self.consume.data.color])
        
        m.d.comb += [
            self.produce.last.eq(self.consume.last),
            self.produce.valid.eq(self.consume.valid),
            self.consume.ready.eq(self.produce.ready)
        ]
        
        return m