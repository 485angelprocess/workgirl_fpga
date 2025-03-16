class Operation(enum.Enum):
    Add = 0
    Sub = 1
    Mul = 2
    Div = 3

def flag_shape():
    return data.StructLayout({
        "signed": 1
    })

def operand_shape():
    return data.StructLayout({
        "a": 8,
        "b": 8
        "flag": flag_shape() 
    })

class Alu(wiring.Component):
    def __init__(self):
        super().__init__({
            "bus": In(signature.Bus(Operation, operand_shape())),
            "result": Out(8),
            "valid": Out(1),
            "ready": In(1)
        })
    
    def elaborate(self, platform):
        m = Module()
        
        with m.Switch(self.bus.addr):
            with m.Case(Operation.Add):
                with m.If(self.bus.w.data.flag.signed):
                    m.d.comb += result.eq()
        
        return m