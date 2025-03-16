from amaranth import *
from amaranth.lib import wiring, memory, data
from amaranth.lib.wiring import In, Out
from amaranth.sim import *
from amaranth.back import verilog

import common.signature as signature
import math
import random

from common.signature import BusTb, StreamTb, ImmReg

class WishboneRam(wiring.Component):
    def __init__(self, width, height = 1, address_shape = 16, write_shape = 32, granularity = None, stream_shape = signature.PixelLayout(5), has_stream = False):
        self.width = width
        self.height = height
        self.write_shape = write_shape
        self.granularity = granularity
        self.stream_shape = stream_shape
        self.has_stream = has_stream
        
        self.init = []
        
        address_space = self.address_space()
        
        ports = {"bus": In(signature.Bus(address_shape, write_shape, burst = False))}
        
        if has_stream:
            ports |= {"produce": Out(signature.VideoStream(stream_shape))}
            
        super().__init__(ports)
            
    def address_space(self):
        divide = int(math.log(self.write_shape) / math.log(2.0))
        return (self.width * self.height * 8) >> (divide - 1)
            
    def write_bus(self, m, write_port):
        """
        Write framebuffer from bus
        """
        m.d.comb += write_port.data.eq(self.bus.w.data)
        m.d.comb += write_port.addr.eq(self.bus.addr)
        
        strobe_last = Signal(name = "write_stb_last")
        m.d.sync += strobe_last.eq(self.bus.stb)
        
        with m.If(self.bus.w.enable):    
            m.d.comb += self.bus.ack.eq(write_port.en)
            m.d.comb += write_port.en.eq(self.bus.stb & self.bus.cycle & (strobe_last))
            
    def read_bus(self, m, read_port):
        """
        Read framebuffer from bus
        """
        m.d.comb += self.bus.r.data.eq(read_port.data)
        m.d.comb += read_port.addr.eq(self.bus.addr)
        
        read_valid = Signal()
        
        with m.If(~self.bus.w.enable):
            m.d.comb += self.bus.ack.eq(read_valid & self.bus.stb)
            m.d.sync += read_valid.eq(read_port.en)
            m.d.comb += read_port.en.eq(self.bus.stb & self.bus.cycle  & ~self.bus.ack)
            
    def stream(self, m, read_port):
        """
        Stream contents
        """
        # TODO simulate sync regions
        addr = Signal(range(self.address_space()))
        addr_last = Signal()
            
        m.d.comb += addr_last.eq(addr == self.address_space() - 1)
        
        counter = Signal()
        
        m.d.comb += self.produce.vsync.eq(addr_last & (counter == 1))
        
        data = Signal(32, name = "stream_data")
        
        m.d.comb += read_port.addr.eq(addr)
        m.d.comb += data.eq(read_port.data)
        
        with m.If(counter == 0):
            m.d.comb += self.produce.data.eq(data[0:16])
            m.d.comb += self.produce.valid.eq(1)
            with m.If(self.produce.ready & self.produce.valid):
                m.d.sync += counter.eq(1)
        with m.Else():
            m.d.comb += self.produce.data.eq(data[16:])
            m.d.comb += self.produce.valid.eq(1)
            with m.If(self.produce.ready & self.produce.valid):
                m.d.sync += counter.eq(0)
                with m.If(addr_last):
                    m.d.sync += addr.eq(0)
                with m.Else():
                    m.d.sync += addr.eq(addr + 1)
                
            
    def elaborate(self, platform):
        m = Module()
        
        frame_size = self.width * self.height
        buffer = m.submodules.buffer = memory.Memory(shape = self.write_shape, depth = frame_size, init = self.init)
        
        self.write_bus(m, buffer.write_port(granularity = self.granularity))
        self.read_bus(m, buffer.read_port())
        
        if self.has_stream:
            self.stream(m, buffer.read_port(domain = "comb"))
        
        return m
        
def tb_framebuffer():
    dut = Framebuffer(10, 10, has_stream = True)
    
    addr = list()
    data = list()
    expect = dict()
    for i in range(20):
        addr.append(random.randrange(dut.address_space()))
        data.append(random.randrange(1 << 31))
        expect[addr[-1]] = data[-1]
        
    async def process(ctx):
        for i in range(len(addr)):
            await BusTb.write_single(ctx, dut.bus, addr[i], data[i])
        
        for key in expect:
            assert await BusTb.read_single(ctx, dut.bus, key) == expect[key]
        
        stream_expect = [0 for _ in range(dut.address_space())]
        
        for key in expect:
            stream_expect[key] = expect[key]
            
        m_expect = list()
        for e in stream_expect:
            m_expect.append(signature.to_pixel(e & 0xFFFF, 5))
            m_expect.append(signature.to_pixel((e >> 16) & 0xFFFF, 5))
        
        frame_last = (dut.width*dut.height) - 1
        
        for i in range(len(m_expect)):
            await signature.stream_get(ctx, dut.produce, m_expect[i], i == frame_last)
    
    sim = Simulator(dut)
    sim.add_clock(1e-8)
    sim.add_testbench(process)
    
    with sim.write_vcd("bench/tb_framebuffer.vcd"):
        sim.run_until(500*1e-8)
        
class CacheMap(object):
    """
    Map subset of ram to client
    """
    def __init__(self, width, n = 1):
        assert width in (1, 2, 4, 8, 16, 32)
        self._n = n
        self._width = width
        
    def num_reads(self):
        return self._n
        
    def width(self):
        return self._width
        
    def total(self):
        return self.width() * self.num_reads()
    
    def cache_shape(self):
        array_len = int(32 / self.width())
        shape = data.UnionLayout({
                    "w": data.ArrayLayout(32, self._n),
                    "r": data.ArrayLayout(self.width(), self._n * array_len)
                })
        return shape
        
    def cache_stride(self):
        w_stride = int(math.log(32 / (self.width())) / math.log(2.0))
        n_stride = int(math.log(self.num_reads()) / math.log(2.0))
        return w_stride + n_stride
        
    def write(self, m, cache, data, counter):
        m.d.sync += cache.w[counter].eq(data)
        
    def read(self, m, cache, data, offset):
        m.d.comb += data.eq(cache.r[offset])
        
class PixelMap(CacheMap):
    """
    Map 2bpp pixel data from ram
    """
    def __init__(self):
        pass
        
    def num_reads(self):
        return 1
        
    def width(self):
        return 2
    
    def cache_shape(self):
        return data.ArrayLayout(16, 2)
        
    def write(self, m, cache, data, counter):
        m.d.sync += cache[0][0:8].eq(data[0:8])
        m.d.sync += cache[0][8:16].eq(data[16:24])
        m.d.sync += cache[1][0:8].eq(data[8:16])
        m.d.sync += cache[1][8:16].eq(data[24:32])
        
    def read(self, m, cache, data, offset):
        upper = Signal()
        lower = Signal()
        
        m.d.comb += upper.eq(cache[1].bit_select(offset, 1))
        m.d.comb += lower.eq(cache[0].bit_select(offset, 1))
        
        m.d.comb += data.eq(Cat(lower, upper))
    
class Cache(wiring.Component):
    """
    Cache for reading ram as  desired shape
    """
    def __init__(self, mapper, base_address = 0x0):
        self.map = mapper
        self.width = mapper.width()
        
        # TODO maybe have more flexible
        self.base_address = base_address
        
        super().__init__({
            "ctl": In(signature.Bus(4, 32)),
            "bus": Out(signature.Bus(16, 32)),
            "cache": In(signature.Bus(16, mapper.width()))
        })
        
    def elaborate(self, platform):
        m = Module()
        
        mem_offset = Signal(16, init = self.base_address)
        
        regs = [
            ImmReg(0x00, mem_offset)
        ]
        
        ImmReg.run_write(m, self.ctl, regs)
        ImmReg.run_read(m, self.ctl, regs)
        
        map_addr = Signal(16)
        cache = Signal(self.map.cache_shape())
        cache_base = Signal(16)
        
        base = Signal(16)
        offset = Signal(16)
        
        print("Cache total is {}".format(self.map.total()))
        print("Cache stride is {}".format(self.map.cache_stride()))
       
        # Base is the first address of the group
        m.d.comb += base.eq(self.cache.addr >> self.map.cache_stride())
        # Offset is what member of the cached value we are reading
        m.d.comb += offset.eq(self.cache.addr - (base << self.map.cache_stride()))
        
        load_counter = Signal(range(self.map.num_reads()))
        
        # Read from base adddress
        # TODO make shift not multiply
        m.d.comb += self.bus.addr.eq(((base * self.map.num_reads()) + load_counter) | mem_offset)
        
        self.map.read(m, cache, self.cache.r.data, offset)
        
        cache_valid = Signal()
        
        with m.FSM():
            with m.State("Load"):
                m.d.comb += self.bus.stb.eq(self.cache.stb)
                m.d.comb += self.bus.cycle.eq(self.cache.cycle)
                m.d.comb += self.bus.sel.eq(self.cache.sel)
                with m.If(self.bus.stb & self.bus.ack):
                    # Map data
                    self.map.write(m, cache, self.bus.r.data, counter = load_counter)
                    m.d.sync += cache_base.eq(base)
                    with m.If(load_counter == self.map.num_reads() - 1):
                        m.d.sync += load_counter.eq(0)
                        m.next = "Cached"
                    with m.Else():
                        m.d.sync += load_counter.eq(load_counter + 1)
            with m.State("Cached"):
                with m.If(self.cache.stb & self.cache.cycle):
                    with m.If(base == cache_base):
                        m.d.comb += self.cache.ack.eq(1)
                    with m.Else():
                        # Need to load new cache value
                        m.next = "Load"
                        
        return m
        
def remove_port(interface, port):
    b = dict()
    members = interface.signature.members
    for key in members:
        if key is not port:
            b[key] = members[key]
    return b

class DeviceWithCache(object):
    """
    Wrapper for how I've generally been writing modules,
    a
    """
    def __init__(self, device, cache):
        self.device = device
        self.cache = cache
        
    def connect(self, m, prefix):
        m.submodules["{}_device".format(prefix)] = self.device
        m.submodules["{}_cache".format(prefix)] = self.cache
        wiring.connect(m, self.device.bus, self.cache.cache)

if __name__ == "__main__":
    tb_framebuffer()