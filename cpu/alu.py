from amaranth import *
from amaranth.lib import wiring, data, enum
from amaranth.lib.wiring import In, Out

class AluCode(enum.Enum):
    Add = 0x0
    Sub = 0x1
    Mul = 0x2
    Div = 0x3
    And = 0x4
    Or  = 0x5
    Xor = 0x6
    Adc = 0x7 # Add and carry
    Sbc = 0x8 # Subtract and carry
    Inc = 0x9
    Dec = 0xA
    
class AluSize(enum.Enum):
    Short = 0
    Wide = 1
    
def AluFlags():
    return data.StructLayout({
        "z": 1,
        "n": 1,
        "h": 1,
        "c": 1
    })
    
class AluInterface(wiring.Signature):
    def __init__(self):
        super().__init__({
            "code": In(AluCode),
            "mode": In(AluSize),
            "operand": In(data.ArrayLayout(16, 2)),
            "stb": In(1),
            
            "result": Out(8),
            "flags": Out(AluFlags()),
            "ack": Out(1)
        })

class Alu(wiring.Component):
    def __init__(self):
        super().__init__({
            "bus": Out(AluInterface())
        })
    
    def half_carry_short(self):
        # HC = (((a & 0xF) + (b & 0xF)) & 0x10) == 0x10
        a = self.bus.operand[0]
        b = self.bus.operand[1]
        mask_lower = (a & 0xF) & (b & 0xF)
        return mask_lower & 0x10 == 0x10
    
    def elaborate(self, platform):
        m = Module()
        
        result_short = Signal(9)
        flag_reg = Signal(AluFlags())
        
        # Carry information in this gist:
        # https://gist.github.com/meganesu/9e228b6b587decc783aa9be34ae27841
        a = self.bus.operand[0]
        b = self.bus.operand[1]
        
        m.d.comb += self.bus.flags.z.eq(self.bus.result == 0)
        
        with m.If(self.bus.mode == AluSize.Short):
            
            m.d.comb += self.bus.flags.c.eq(result_short[8])
            m.d.comb += self.bus.flags.h.eq(self.half_carry_short())
            
            with m.Switch(self.bus.code):
                with m.Case(AluCode.Add):
                    m.d.comb += result_short.eq(a + b)
                with m.Case(AluCode.Adc):
                    # ? What does it specifically do
                    m.d.comb += result_short.eq(a + b + flag_reg.c)
                with m.Case(AluCode.Sub):
                    m.d.comb += result_short.eq(a - b)
                    m.d.comb += self.bus.flags.c.eq(a < b)
                with m.Case(AluCode.Sbc):
                    m.d.comb += result_short.eq(a - b)
                with m.Case(AluCode.Mul):
                    m.d.comb += result_short.eq(a * b)
                with m.Case(AluCode.And):
                    m.d.comb += result_short.eq(a & b)
                with m.Case(AluCode.Or):
                    m.d.comb += result_short.eq(a | b)
                with m.Case(AluCode.Xor):
                    m.d.comb += result_short.eq(a ^ b)
                with m.Case(AluCode.Inc):
                    m.d.comb += result_short.eq(a + 1)
                    m.d.comb += self.bus.flags.c.eq(0)
                with m.Case(AluCode.Dec):
                    m.d.comb += result_short.eq(a - 1)
                    m.d.comb += self.bus.flags.c.eq(0)
        
            m.d.comb += self.bus.result.eq(result_short)
        
        m.d.comb += self.bus.ack.eq(self.bus.stb)
        
        with m.If(self.bus.ack & self.bus.stb):
            m.d.sync += flag_reg.eq(self.bus.flags)
        
        return m