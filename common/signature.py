"""
Common stream and bus signatures
"""
from amaranth.lib import wiring, data
from amaranth.lib.wiring import In, Out

def PixelLayout(width = 4):
    return data.StructLayout({
        "r": width,
        "g": width,
        "b": width
    })

def to_pixel(v, width):
    mask = (1 << width) - 1
    return {
        "r": v & mask,
        "g": (v >> width) & mask,
        "b": (v >> (2*width)) & mask
    }

class VideoStream(wiring.Signature):
    def __init__(self, shape):
        super().__init__({
            "data": Out(shape),
            "valid": Out(1),
            "ready": In(1),
            "vsync": Out(1)
        })
        
class DataStream(wiring.Signature):
    def __init__(self, shape, last = True):
        p = dict()
        if last:
            p["last"] = Out(1)
        super().__init__({
            "data": Out(shape),
            "valid": Out(1),
            "ready": In(1),
        } | p)
        
class CycleType(object):
    Classic = 0b000
    Constant = 0b001
    Increment = 0b010
    End = 0b111

class WritePort(wiring.Signature):
    def __init__(self, address_shape, data_shape):
        super().__init__({
            "data": Out(data_shape),
            "enable": Out(1)
        })

class ReadPort(wiring.Signature):
    def __init__(self, address_shape, data_shape):
        super().__init__({
            "data": In(data_shape)
        })

class Bus(wiring.Signature):
    def __init__(self, address_shape, data_shape, sel_width = 4, burst = False):
    
        ports = {
            "w": Out(WritePort(address_shape, data_shape)),
            "r": Out(ReadPort(address_shape, data_shape)),
            "addr": Out(address_shape),
            "sel": Out(sel_width),
            "err": In(1),
            "cycle": Out(1),
            "stb": Out(1),
            "ack": In(1)
        }
        
        if burst:
            ports = ports | {"cti": Out(3)}
        
        super().__init__(ports)

class RegType(object):
    Read = 0b01
    Write= 0b10
    RW = 0b11
        
class ImmReg(object):
    def __init__(self, addr, register, rw = RegType.RW):
        self.addr = addr
        self.register = register
        self.rw = rw
        
    def readable(self):
        return (self.rw & RegType.Read) > 0
        
    def writeable(self):
        return (self.rw & RegType.Write) > 0
        
    def write(self, m, port):
        m.d.sync += self.register.eq(port.w.data)
    
    def read(self, m, port):
        m.d.comb += port.r.data.eq(self.register)

    @staticmethod
    def run_write(m, port, registers):
        with m.If(port.w.enable):
            with m.If(port.stb & (~port.ack)):
                m.d.sync += port.ack.eq(1)
                with m.Switch(port.addr):
                    write_regs = [r for r in registers if r.writeable()]
                    for r in write_regs:
                        with m.Case(r.addr):
                            r.write(m, port)
            with m.If(port.ack):
                m.d.sync += port.ack.eq(0)
                
    @staticmethod  
    def run_read(m, port, registers):
        with m.If(~port.w.enable):
            with m.If(port.stb & (~port.ack)):
                m.d.sync += port.ack.eq(1)
        
        with m.If(port.ack):
            m.d.sync += port.ack.eq(0)
        
        with m.Switch(port.addr):
            read_regs = [r for r in registers if r.readable()]
            for r in read_regs:
                with m.Case(r.addr):
                    r.read(m, port)
            
class BusTb(object):
    @staticmethod        
    def sel(ctx, port, sel):
        ctx.set(port.sel, sel)
    
    @staticmethod
    async def write_single(ctx, port, addr, data):
        ctx.set(port.w.data, data)
        ctx.set(port.addr, addr)
        ctx.set(port.w.enable, 1)
        ctx.set(port.stb, 1)
        ctx.set(port.cycle, 1)
        await ctx.tick().until(port.ack)
        ctx.set(port.stb, 0)
        ctx.set(port.w.enable, 0)
        ctx.set(port.cycle, 0)
    
    @staticmethod   
    async def read_single(ctx, port, addr):
        ctx.set(port.addr, addr)
        ctx.set(port.w.enable, 0)
        ctx.set(port.cycle, 1)
        ctx.set(port.stb, 1)
        data, = await ctx.tick().sample(port.r.data).until(port.ack)
        ctx.set(port.stb, 0)
        ctx.set(port.cycle, 0)
        return data
    
    @staticmethod
    async def semaphore(ctx, port, addr, data):
        await BusTb.write_single(ctx, port, addr, data)
        return await BusTb.read_single(ctx, port, addr)
    
    @staticmethod
    async def poll(ctx, port, addr, until):
        counter = 0
        while await BusTb.read_single(ctx, port, addr) != until:
            counter += 1
        return counter

class StreamTb(object):
    @staticmethod
    async def get(ctx, stream):
        ctx.set(stream.ready, 1)
        data, = await ctx.tick().sample(stream.data).until(stream.valid)
        ctx.set(stream.ready, 0)
        return data
        
    @staticmethod
    async def put(ctx, stream, data, last = False):
        ctx.set(stream.data, data)
        ctx.set(stream.valid, 1)
        ctx.set(stream.last, last)
        await ctx.tick().until(stream.ready)
        ctx.set(stream.valid, 0)
        
    @staticmethod
    async def video_put(ctx, stream, data, vsync = 0):
        ctx.set(stream.data, data)
        ctx.set(stream.valid, 1)
        ctx.set(stream.vsync, vsync)
        await ctx.tick().until(stream.ready)
        ctx.set(stream.valid, 0)
        
    @staticmethod
    async def video_get(ctx, stream):
        ctx.set(stream.ready, 1)
        data, vs = await ctx.tick().sample(stream.data, stream.vsync).until(stream.valid)
        ctx.set(stream.ready, 0)
        return data, vs