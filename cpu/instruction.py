"""
Base classes for instruction set
"""
from functools import reduce
from amaranth import *

def InstructionParameters():
    return data.StructLayout({
        "arg_length": 2,
        "cycle_length": 4,
    })
    
class Reg(object):
    A = 1
    B = 3
    C = 2
    D = 5
    E = 4
    F = 0
    H = 7
    L = 6
    
    @staticmethod
    def to_str(index):
        members = ["F", "A", "C", "B", "E", "F", "L", "H"]
        return members[index]

class WideReg(object):
    AF = 0
    BC = 1
    DE = 2
    HL = 3
    SP = 4
    PC = 5
    
    @staticmethod
    def to_str(index):
        members = ["AF", "BC", "DE", "HL", "SP", "PC"]
        return members[index]

class InstructionContext(object):
    def __init__(self, register, 
                        wide, 
                        arg, 
                        arg_counter, 
                        alu, 
                        ram_bus, 
                        read_value,
                        interrupt_enable):
        self.register = register
        self.wide = wide
        self.arg = arg
        self._arg_counter = arg_counter
        self._bus = {"alu": alu, "bus": ram_bus}
        self.read_value = read_value
        self.interrupt_enable = interrupt_enable
    
    def arg_counter(self):
        return self._arg_counter
        
    def alu_result(self):
        return self["alu"].result
        
    def __getitem__(self, value):
        return self._bus[value]
        
    def read_data(self):
        return self.read_value
    
    def write_data(self):
        pass
        #return self._bus["bus"].w_data

class DataSize(object):
    SHORT = 0
    WIDE = 1
        
class OperandBase(object):
    def __init__(self, arg_length, size, cycles = 0):
        self._arg_length = arg_length
        self.size = size
        self._cycles = cycles
        self.requirements = list()
    
    def arg_length(self):
        return self._arg_length
        
    def on_load(self):
        return None
        
    def get(self, ctx):
        raise Exception("Getter must be overriden")
        
    def impact(self):
        return list()
        
    def source(self, ctx):
        pass

class InstructionBase(object):
    def __init__(self, *args, default_op = True):
        self.args = args
        
        self.conditions = list()
        
        self.steps = dict()
        
        self._impact = list()
      
    def arg_length(self):
        return sum([a.arg_length() for a in self.args])
    
    ################################
    ## Base instructions ###########
    ################################
    def run(self):
        return self.name()
        
    def describe(self, m, ctx, a, b, counter):
        m.d.sync += Print("Warning no implementation of instruction ", self.signature())
        return None
    
    def on_load(self):
        for a in self.args:
            if a.on_load() is not None:
                return a.on_load()
        return self.run()
        
    def on_read(self):
        return self.run()
        
    def read_address(self):
        if self.on_load() == "read":
            return self.args[1]
        else:
            return None
        
    def loaded(self, ctx):
        l = [Requirements.arg_count(self.arg_length())(ctx)]
        return reduce(lambda x, y: x & y, l)
        
    def args_ready(self, ctx):
        r = list()
        r += self.register.requires(ctx)
        r += [Requirements.arg_count(self.arg_length())(ctx)]
        for a in self.args:
            r += a.requires(ctx)
        return reduce(lambda x, y: x & y, r)
        
    ##################################
    ### automatic testing ############
    ##################################
    def push_impact(self, domain, value):
        self._impact.append((domain, value))
    
    def impact(self):
        im = list()
        for a in self.args:
            im += a.impact()
        im += self._impact
        im = [i for i in im if len(i) > 0]
        print("Impact {}".format(im))
        return im
        
    def verification_startup(self, state):
        pass # Override if we need specific initial conditions
        
    def verify(self, input, result):
        raise Exception("Verify must be overwritten")
        
    #############################
    ## Formatting for debugging #
    #############################
    def name(self):
        return "x"
        
    def op_str(self):
        return " _ "
        
    def signature(self):
        if len(self.args) == 0:
            return self.op_str()
        if len(self.args) == 1:
            return "{r}{o}".format(r = str(self.args[0]), o = self.op_str())
        if len(self.args) == 2:
            return "{r} {o} {a}".format(r = str(self.args[0]), o = self.op_str(), a = str(self.args[1]))
        
    def print_info(self, tab = 1):
        t = "\t"*tab
        print(t, "Arg length {}".format(self.arg_length()))
        print(t, self.signature())
        requirements = list()
        for a in self.args:
            requirements += a.requirements
        
    def __str__(self):
        return "{}: {}".format(self.name(), self.signature())
        
###################################
## Data types #####################
###################################
class Register(OperandBase):
    def __init__(self, index):
        self.index = index
        super().__init__(arg_length = 0, size = DataSize.SHORT)
        
    def get(self, ctx):
        return ctx.register[self.index]
        
    def __str__(self):
        return "r{}|{}".format(self.index, Reg.to_str(self.index))
        
    def impact(self):
        return [("reg", self.index)]
        
    def source(self, ctx):
        return ctx.get_reg(self.index)
        
class RegisterWide(OperandBase):
    def __init__(self, index):
        self.index = index
        super().__init__(arg_length = 0, size = DataSize.WIDE)
    
    def get(self, ctx):
        # Get in hdl context
        return ctx.wide[self.index]
    
    def __str__(self):
        return "R{}|{}".format(self.index, WideReg.to_str(self.index))
        
    def impact(self):
        # Which registers are impacted by this argument
        if self.index == WideReg.SP:
            return [("sp", None)]
        else:
            return [("reg", self.index << 1), ("reg", (self.index << 1) + 1)]
        
    def source(self, ctx):
        # Get in verifier context
        if self.index == WideReg.SP:
            return ctx.sp
        else:
            return ctx.get_wide(self.index)
    
    @classmethod
    def HL(cls):
        return cls(WideReg.HL)
    
    @classmethod
    def AF(cls):
        return cls(WideReg.AF)
    
    @classmethod
    def BC(cls):
        return cls(WideReg.BC)
    
    @classmethod
    def DE(cls):
        return cls(WideReg.DE)
    
    @classmethod
    def SP(cls):
        return cls(WideReg.SP)
        
    @classmethod
    def PC(cls):
        return cls(WideReg.PC)
        
class ShortImm(OperandBase):
    def __init__(self, position = 1):
        self.position = position
        super().__init__(arg_length = 1, size = DataSize.SHORT)
        
    def get(self, ctx):
        return ctx.arg[self.position] # I think this is always position 1
    
    def __str__(self):
        return "n"
    
    def source(self, ctx):
        return ctx.get_arg(self.position)
        
class WideImm(OperandBase):
    def __init__(self, position = (1, 2)):
        self.position = position
        super().__init__(arg_length = 2, size = DataSize.WIDE)
    
    def get(self, ctx):
        return Cat(ctx.arg[self.position[0]], ctx.arg[self.position[1]])
    
    def __str__(self):
        return "nn"
        
    def source(self, ctx):
        return ctx.get_arg(1) + (ctx.get_arg(2) << 8)
        
class ReadFrom(OperandBase):
    def __init__(self, operand):
        self.op = operand
        super().__init__(arg_length = self.op.arg_length(), size = self.op.size)
    
    def get(self, ctx):
        return self.op.get(ctx)
        
    # Argument requires a read from memory
    def on_load(self):
        return "read"
        
    def impact(self):
        return [("mem", self.op.source)] + self.op.impact()
        
    def __str__(self):
        return "({})".format(str(self.op))
        
    def source(self, ctx):
        return ctx.get_mem(self.op.source(ctx))