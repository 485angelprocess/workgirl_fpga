from amaranth.sim import *
from top import *
from ppu.pixel import ColorMap
from ppu.pixel import LineBuffer, LineBufferReg
from ppu.core import PpuCore
from ppu.background import TileGridReg

from matplotlib import pyplot as plt
from common.signature import BusTb, StreamTb
from common.mem import *


def render_vga(dut, port, vga, data, pix_clock, name):
    
    img_data = np.zeros((1200, 800, 3))
    
    async def write(ctx):
        for d in data:
            #ctx.set(port.data, data)
            ctx.set(port.valid, 1)
            await ctx.tick().until(port.ready)
        ctx.set(port.valid, 0)
    
    async def read(ctx):
        y = 0
        x = 0
        hsync_last = False
        while True:
            data = ctx.get(vga.data)
            hsync = ctx.get(vga.hsync)
            vsync = ctx.get(vga.vsync)
            
            if vsync:
                print("Reached end of frame")
                return
            elif hsync:
                x = 0
                if not hsync_last:
                    y += 1
                    print("Line {}".format(y))
            else:
                img_data[x][y][0] = data & 0xF
                img_data[x][y][1] = (data >> 4) & 0xF
                img_data[x][y][2] = (data >> 8) & 0xF
            await ctx.tick().repeat(pix_clock)
            x += 1
            hsync_last = hsync
    
    sim = Simulator(dut)
    sim.add_clock(1e-8)
    sim.add_testbench(write)
    sim.add_testbench(read)
    
    with sim.write_vcd("bench/render_{}.vcd".format(name)):
        sim.run()
        
  
    
def render_display():
    dut = display_module()
    
    data = list()
    for i in range(160):
        for j in range(144):
            if i < 50:
                data.append({"r": 255, "g": 0, "b": 0})
            elif i < 100:
                data.append({"r": 0, "g": 255, "b": 0})
            else:
                data.append({"r": 0, "g": 0, "b": 255})
    
    render_vga(dut, dut.submodules.resize.consume, dut.submodules.vga, data, 3, "display_output")
        
def render_lcd_sync(dut, port, lcd, mdata, name, setup = None, new_line = None):
    img_data = np.zeros((160*144, 3))
    
    async def process(ctx):
        if setup:
            await setup(ctx)
        for line in range(len(mdata)):
            #print("{} / {}".format(line, len(mdata)))
            if new_line is not None:
                new_line(ctx, line)
            if line < len(mdata):
                for d in mdata[line]:
                    ctx.set(port.data, d)
                    ctx.set(port.valid, 1)
                    await ctx.tick().until(port.ready)
            ctx.set(port.valid, 0)
            
    async def read_process(ctx):
        print("Read")
        for i in range(160*144):
            ctx.set(lcd.ready, 1)
            data,  = await ctx.tick().sample(lcd.data).until(lcd.valid)
            #print("Got data {}".format(data))
                
            img_data[i][0] = ((data & 0x1F) << 3) / 256.0
            img_data[i][1] = (((data >> 5) & 0x1F) << 3) / 256.0
            img_data[i][2] = (((data >> 10) & 0x1F) << 3) / 256.0
            
            
    sim = Simulator(dut)
    sim.add_clock(1e-8)
    sim.add_testbench(process)
    sim.add_testbench(read_process)
        
    print("Rendering {}".format(name))
    with sim.write_vcd("bench/render_{}.vcd".format(name)):
        sim.run()
    
    lcd_data = np.reshape(img_data, (144, 160, 3))
    #print(lcd_data)
    plt.imshow(lcd_data, interpolation='nearest')
    plt.show()
        
def render_lcd_async(dut, port, lcd, mdata, name, setup = None, new_line = None, write_done = None):
    lines = 32
    
    img_data = np.zeros((lines, 160, 3))
    
    async def process(ctx):
        if setup:
            await setup(ctx)
        for line in range(lines):
            print("{} / 160".format(line))
            if new_line is not None:
                await new_line(ctx, line)
            print("Write")
            if line < len(mdata):
                for i in range(len(mdata[line])):
                    ctx.set(port.data, mdata[line][i])
                    ctx.set(port.last, i == len(mdata[line]) - 1)
                    ctx.set(port.valid, 1)
                    #print("writing {}".format(d))
                    await ctx.tick().until(port.ready)
            if write_done is not None:
                await write_done(ctx, line)
            ctx.set(port.valid, 0)
            print("Read")
            for i in range(160):
                ctx.set(lcd.ready, 1)
                data, last = await ctx.tick().sample(lcd.data, lcd.last).until(lcd.valid)
                
                if last:
                    print("Received last on x = {}".format(i))
                    assert i == 159
                
                img_data[line][i][0] = ((data & 0x1F) << 3) / 256.0
                img_data[line][i][1] = (((data >> 5) & 0x1F) << 3) / 256.0
                img_data[line][i][2] = (((data >> 10) & 0x1F) << 3) / 256.0
            
            
    sim = Simulator(dut)
    sim.add_clock(1e-8)
    sim.add_testbench(process)
        
    print("Rendering {}".format(name))
    with sim.write_vcd("bench/render_{}.vcd".format(name)):
        sim.run()
    
    lcd_data = np.reshape(img_data, (lines, 160, 3))
    print(lcd_data)
    plt.imshow(lcd_data, interpolation='nearest')
    plt.show()
        
def render_color_map():
    dut = ColorMap()
    
    data = [list() for _ in range(144)]
    
    for y in range(144):
        for x in range(160):
            if x < 40:
                data[y].append({"color": 1, "flags": 0, "valid": 1})
            elif x < 80:
                data[y].append({"color": 0, "flags": 0, "valid": 1})
            elif x < 120:
                data[y].append({"color": 2, "flags": 0, "valid": 1})
            else:
                data[y].append({"color": 3, "flags": 0, "valid": 1})
    
    render_lcd_sync(dut, dut.consume, dut.produce, data, "Color map")
        
def render_tile():
    dut = Module()
    
    sb = dut.submodules.sb = LineBuffer()
    cache = dut.submodules.cache = Cache(PixelMap())
    # Represents pixel cache
    ram = dut.submodules.ram = WishboneRam(64, write_shape = 32)
    color = dut.submodules.color = ColorMap()
    
    wiring.connect(dut, sb.bus, cache.cache)
    wiring.connect(dut, cache.bus, ram.bus)
    wiring.connect(dut, sb.produce, color.consume)
    
    ram.init = [0xC3A5C3A5] * 16
        
    async def new_line(ctx, line):
        await BusTb.write_single(ctx, sb.ctl, LineBufferReg.Line, line)
        await BusTb.write_single(ctx, sb.ctl, LineBufferReg.Enable, 1)
        
    async def write_done(ctx, line):
        await BusTb.write_single(ctx, sb.ctl, LineBufferReg.Read, 1)
    
    data = [[{"y": 16 + (8*i), "x": 8*(i+1), "tile": 0, "flags": 0} for i in range(6)] for _ in range(32)]
    
    render_lcd_async(dut, sb.consume, color.produce, data, "Line buffer", new_line = new_line, write_done = write_done)

def render_lcd_static(dut, lcd, name, setup = None, new_line = None, write_done = None):
    lines = 32
    
    img_data = np.zeros((lines, 160, 3))
    
    async def process(ctx):
        if setup:
            await setup(ctx)
        for line in range(lines):
            print("{} / 160".format(line))
            if new_line is not None:
                await new_line(ctx, line)
            await ctx.tick().repeat(512) # MAke closer to exact sync time
            if write_done is not None:
                await write_done(ctx, line)
            print("Read")
            for i in range(160):
                ctx.set(lcd.ready, 1)
                data, last = await ctx.tick().sample(lcd.data, lcd.last).until(lcd.valid)
                
                if last:
                    print("Received last on x = {}".format(i))
                    assert i == 159
                
                img_data[line][i][0] = ((data & 0x1F) << 3) / 256.0
                img_data[line][i][1] = (((data >> 5) & 0x1F) << 3) / 256.0
                img_data[line][i][2] = (((data >> 10) & 0x1F) << 3) / 256.0
            
            
    sim = Simulator(dut)
    sim.add_clock(1e-8)
    sim.add_testbench(process)
        
    print("Rendering {}".format(name))
    with sim.write_vcd("bench/render_{}.vcd".format(name)):
        sim.run()
    
    lcd_data = np.reshape(img_data, (lines, 160, 3))
    print(lcd_data)
    plt.imshow(lcd_data, interpolation='nearest')
    plt.show()

def render_ppu_core():
    dut = Module()
    
    core = dut.submodules.core = PpuCore()
    vram = dut.submodules.vram = WishboneRam(64, write_shape = 32)
    ram = dut.submodules.ram = WishboneRam(64, write_shape = 32)
    
    # Pixel data    
    vram.init = [0xC3A5C3A5] * 64
    # Background map
    ram.init = [0x02020101] * 32 + [0x01]
    
    wiring.connect(dut, core.dma, ram.bus)
    wiring.connect(dut, core.vram, vram.bus)
    
    async def new_line(ctx, line):
        BusTb.sel(ctx, core.ctl, 0)
        await BusTb.write_single(ctx, core.ctl, TileGridReg.Line, line)
        await BusTb.write_single(ctx, core.ctl, TileGridReg.Enable, 1)
        for sel in (2, 6):
            BusTb.sel(ctx, core.ctl, sel)
            await BusTb.write_single(ctx, core.ctl, LineBufferReg.Line, line)
            await BusTb.write_single(ctx, core.ctl, LineBufferReg.Enable, 1)
               
               
    async def write_done(ctx, line):
        BusTb.sel(ctx, core.ctl, 0)
        await BusTb.write_single(ctx, core.ctl, TileGridReg.Enable, 0)
        for sel in (2, 6):
            BusTb.sel(ctx, core.ctl, sel)
            await BusTb.write_single(ctx, core.ctl, LineBufferReg.Read, 1)
               
    render_lcd_static(dut, core.lcd, "core", new_line = new_line, write_done = write_done)
               
if __name__ == "__main__":
    #render_color_map()
    #render_tile()
    render_ppu_core()