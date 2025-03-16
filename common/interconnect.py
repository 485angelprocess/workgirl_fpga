"""
Wishbone interconnect
"""
from amaranth import *
from amaranth.lib import wiring, enum, memory, data, fifo
from amaranth.lib.wiring import In, Out
from amaranth.sim import *
from amaranth.back import verilog

import common.signature as signature

from common.signature import BusTb, ImmReg
from common.mem import WishboneRam

def bus_connect(m, p, c):
        m.d.comb += [
            p.w.data.eq(c.w.data),
            p.w.enable.eq(c.w.enable),
            c.r.data.eq(p.r.data),
            p.addr.eq(c.addr),
            p.sel.eq(c.sel),
            p.cycle.eq(c.cycle),
            p.stb.eq(c.stb),
            c.ack.eq(p.ack)
        ]

class Direct(wiring.Component):
    def __init__(self, address_shape):
        super().__init__({
            "c": In(signature.Bus(address_shape, 32)),
            "p": Out(signature.Bus(address_shape, 32))
        })
    
    def elaborate(self, platform):
        m = Module()
        
        bus_connect(m, self.p, self.c)
        
        return m

class MapInstance(object):
    def __init__(self, address, sel):
        self.address = address
        self.sel = sel

class MemoryMap(wiring.Component):
    def __init__(self, address_shape, *addresses):
        self.addresses = addresses
        
        super().__init__({
            "c": In(signature.Bus(address_shape, 32)),
            "p": Out(signature.Bus(address_shape, 32))
        })
        
    def elaborate(self, platform):
        m = Module()
        
        p = self.p
        c = self.c
        
        with m.Switch(c.sel):
            for i in range(len(self.addresses)):
                with m.Case(i):
                    m.d.comb += p.addr.eq(c.addr | self.addresses.address[i])
                    m.d.comb += p.sel.eq(self.addresses.sel[i])
            with m.Default():
                # No offset
                m.d.comb += p.addr.eq(c.addr)
        
        m.d.comb += [
            p.w.data.eq(c.w.data),
            p.w.enable.eq(c.w.enable),
            c.r.data.eq(p.r.data),
            p.cycle.eq(c.cycle),
            p.stb.eq(c.stb),
            c.ack.eq(p.ack)
        ]
        
        return m

class Interconnect(wiring.Component):
    def __init__(self, num_inputs, num_outputs, address_shape = 16):
        self.address_shape = address_shape
        
        ports = list()
        sig = dict()
        for n in range(num_inputs):
            name = "c_{:02X}".format(n)
            ports.append(name)
            sig[name] = In(signature.Bus(address_shape, 32))
        self.in_ports = ports
        
        out_ports = list()
        for n in range(num_outputs):
            name = "p_{:02X}".format(n)
            out_ports.append(name)
            sig[name] = Out(signature.Bus(address_shape, 32))
        self.out_ports = out_ports
        
        super().__init__(sig)
        
    def connect_inputs(self, m, *input_ports, flip = False):
        for i in range(len(input_ports)):
            print("Connect input {}".format(i))
            if flip:
                wiring.connect(m, wiring.flipped(input_ports[i]), self.get_in_port(i))
            else:
                wiring.connect(m, input_ports[i], self.get_in_port(i))
            
    def connect_outputs(self, m, *output_ports, flip = False):
        for i in range(len(output_ports)):
            print("Connecting output {}".format(i))
            if flip:
                wiring.connect(m, wiring.flipped(output_ports[i]), self.get_out_port(i))
            else:
                wiring.connect(m, output_ports[i], self.get_out_port(i))
        
    def get_out_port(self, index):
        return getattr(self, self.out_ports[index])
        
    def get_in_port(self, index):
        return getattr(self, self.in_ports[index])
        
    def elaborate(self, platform):
        m = Module()
        
        select = Signal(range(len(self.in_ports)))
        
        bridge = m.submodules.bridge = Direct(self.address_shape)
        
        # Round robin select 
        with m.Switch(select):
            for i in range(len(self.in_ports)):
                with m.Case(i):
                    with m.If(self.get_in_port(i).cycle):
                        c = self.get_in_port(i)
                        wiring.connect(m, wiring.flipped(c), bridge.c)
                    with m.Else():
                        m.d.sync += select.eq(select + 1)
        
        if len(self.out_ports) > 1:
            with m.Switch(bridge.p.sel):
                for i in range(len(self.out_ports)):
                    with m.Case(i):
                        c = bridge
                        p = self.get_out_port(i)
                        wiring.connect(m, wiring.flipped(p), bridge.p)
                with m.Default():
                    # TODO err flag
                    m.d.comb += bridge.p.ack.eq(bridge.p.sel & bridge.p.cycle)
        else:
            # Sel gets forwarded
            wiring.connect(m, wiring.flipped(self.get_out_port(0)), bridge.p) 
        
        
        return m
        
def tb_interconnect():
    dut = Module()
    
    dut.submodules.interconnect = ic = Interconnect(4, 1)
    dut.submodules.mem = mem = WishboneRam(64)
    
    wiring.connect(dut, ic.p_00, mem.bus)
    
    async def process(ctx):
        
        # Read and write
        await BusTb.write_single(ctx, ic.get_in_port(0), 0x10, 0x01)
        assert await BusTb.read_single(ctx, ic.get_in_port(0), 0x10) == 0x01
        
        # Semaphore
        assert await BusTb.semaphore(ctx, ic.get_in_port(1), 0x02, 0x65) == 0x65
        
        # Switched write
        await BusTb.write_single(ctx, ic.get_in_port(2), 0x03, 0x04)
        await BusTb.write_single(ctx, ic.get_in_port(3), 0x04, 0x06)
        assert await BusTb.read_single(ctx, ic.get_in_port(2), 0x03) == 0x04
        assert await BusTb.read_single(ctx, ic.get_in_port(3), 0x04) == 0x06
        
        print("OK")
        
    sim = Simulator(dut)
    sim.add_clock(1e-8)
    sim.add_testbench(process)
    
    with sim.write_vcd("bench/tb_interconnect.vcd"):
        sim.run()
        
if __name__ == "__main__":
    tb_interconnect()