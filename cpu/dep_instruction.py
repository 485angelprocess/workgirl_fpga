from amaranth import Cat

class Reg(object):
    A = 1
    B = 3
    C = 2
    D = 5
    E = 4
    F = 0
    H = 7
    L = 6
    SP = 8
    PC = 9

class WideReg(object):
    AF = 0
    BC = 1
    DE = 2
    HL = 3
    SP = 4
    
class InstructionContext(object):
    def __init__(self, bus, reg, wide, arg, cycle_counter, bus_counter):
        self.bus = bus
        self.reg = reg
        self.wide = wide
        self.arg = arg
        self.cycle_counter = cycle_counter
        self.bus_counter = bus_counter

class Macro(object):
    @staticmethod
    def increment_wide(reg, amount = 1):
        return lambda ctx: ctx.wide[reg].eq(ctx.wide[reg] + amount)
        
    @staticmethod
    def decrement_wide(reg, amount = 1):
        return lambda ctx: ctx.wide[reg].eq(ctx.wide[reg] - amount)

class InstructionBase(object):
    def __init__(self, length, read_length = 0, write_length = 0, addtl_length = 0):
        self._length = length
        self._read_length = read_length
        self._write_length = write_length
        self._addtl_length = addtl_length
        self._macro = None
        
    def on_write(self, ctx):
        return None
        
    def on_read(self, ctx):
        return None
        
    def set_macro(self, macro):
        self._macro = macro
        return self
    
    def read_length(self):
        return self._read_length
    
    def write_length(self):
        return self._write_length
        
    def addtl_length(self):
        return self._addtl_length
    
    def address(self, *args):
        return 0
        
    def write_data(self, *args):
        return 0
    
    def length(self):
        return self._length
        
    def num_cycles(self):
        return self.length() + self.read_length() + self.write_length() + self.addtl_length()
    
    def done(self, ctx):
        return 1
        #return ctx.cycle_counter == self.num_cycles() - 1
    
    def operate_inst(self, m, ctx):
        pass
    
    def operate(self, m, ctx):
        self.operate_inst(m, ctx)
        if self._macro is not None:
            with m.If(self.done(ctx)):
                m.d.sync += self._macro(ctx)

class Collection(InstructionBase):
    def __init__(self, *insts):
        self.insts = insts
    
    def on_write(self, ctx):
        ow = [is.on_write(ctx) for is in self.insts]
        return [w for w in ow if w is not None]
    
    def on_read(self, ctx):
        or = [is.on_read(ctx) for is in self.insts]
        return [r for r in or if r is not None]
    
    def read_length(self):
        return sum([is.read_length() for is in self.insts])
    
    def write_length(self):
        return sum([is.write_length() for is in self.insts])
    
    def length(self):
        return sum([is.length() for is in self.insts])
    
    def done(self, ctx):
        return Cat([is.done(ctx) for is in self.insts]).all()
    
    def operate_inst(self, m, ctx):
        [is.operate_inst(m, ctx) for is in self.insts]

class Noop(InstructionBase):
    def __init__(self):
        super().__init__(1)
        
class LoadImmediate(InstructionBase):
    def __init__(self, register, long = False):
        self.register = register
        self.long = long
        if long:
            super().__init__(3)
        else:
            super().__init__(2)
    
    def operate_inst(self, m, ctx):
        if self.long:
            # LSB first, wide register set
            m.d.sync += ctx.wide[self.register].eq(Cat(ctx.arg[1], ctx.arg[2]))
        else:
            m.d.sync += ctx.reg[self.register].eq(ctx.arg[1])

class LoadRegister(InstructionBase):
    def __init__(self, dest, source, long = False):
        self.source = source
        self.dest = dest
        self.long = long
        
        if long:
            super().__init__(1, addtl_length = 1)
        else:
            super().__init__(1)
    
    def operate_inst(self, m, ctx):
        if self.long:
            # TODO! long register requires two clock cycles
            m.d.sync += ctx.wide[self.dest].eq(ctx.wide[self.source])
        else:
            m.d.sync += ctx.reg[self.dest].eq(ctx.reg[self.source])
            
class LoadWideRegisterWithImm(InstructionBase):
    def __init__(self, dest, source):
        self.dest = dest
        self.source = source
        super().__init__(2, addtl_length = 1)
    
    def operate_inst(self, m, ctx):
        m.d.sync += ctx.wide[self.dest].eq(ctx.wide[self.source] + ctx.arg[1])

class LoadRead(InstructionBase):
    def __init__(self, dest, source = (Reg.H, Reg.L), offset = None):
        self.dest = dest
        self.source = source
        self.offset = offset
        super().__init__(1, 1)
        
    @classmethod
    def Offset(cls, dest, source = 2, offset = 0xFF00):
        """
        Load read offset by a constant value
        """
        return cls(dest, source, offset = offset)
        
    def offset_address(self, ctx):
        return self.offset + ctx.reg[self.source]
        
    def address(self, ctx):
        if self.offset is not None:
            return self.offset_address(ctx)
        else:
            return Cat(ctx.reg[self.source[1]], ctx.reg[self.source[0]])
    
    def done(self, ctx):
        return ctx.bus.stb & ctx.bus.ack & ctx.bus.cycle
        
    def operate_inst(self, m, ctx):
        with m.If(self.done(ctx)):
            m.d.sync += ctx.reg[self.dest].eq(ctx.bus.r.data)
            
class LoadWriteWideImm(InstructionBase):
    def __init__(self, source):
        self.source = source
        super().__init__(3, write_length = 2)
        
    def address(self, ctx):
        return Cat(ctx.arg[1], ctx.arg[2])
    
    def done(self, ctx):
        return ctx.bus_counter == 2
    
    def write_data(self, ctx):
        return ctx.wide[self.source]

class LoadWrite(InstructionBase):
    def __init__(self, source, dest = (Reg.H, Reg.L), offset = None):
        self.dest = dest
        self.source = source
        self.offset = offset
        super().__init__(1, write_length = 1)
    
    @classmethod
    def Offset(cls, source, dest = 2, offset = 0xFF00):
        return cls(source, dest, offset = offset)
        
    def offset_address(self, ctx):
        return self.offset + ctx.reg[self.dest]
    
    def address(self, ctx):
        if self.offset is not None:
            return self.offset_address(ctx)
        else:
            return Cat(ctx.reg[self.dest[1]], ctx.reg[self.dest[0]])
    
    def write_data(self, ctx):
        return ctx.reg[self.source]
    
    def done(self, ctx):
        return ctx.bus.stb & ctx.bus.ack & ctx.bus.cycle
        
class LoadReadImm(InstructionBase):
    def __init__(self, dest, offset= None):
        self.dest = dest
        self.offset = offset
        if offset is None:
            super().__init__(3, read_length = 1)
        else:
            super().__init__(2, read_length = 1)
        
    @classmethod
    def Offset(cls, dest, offset = 0xFF00):
        """
        Load read offset by a constant value
        """
        return cls(dest, offset = offset)
        
    def address(self, ctx):
        if self.offset is not None:
            return ctx.arg[1] + self.offset
        else:
            return Cat(ctx.arg[1], ctx.arg[2])
    
    def done(self, ctx):
        return ctx.bus.stb & ctx.bus.ack & ctx.bus.cycle
        
    def operate_inst(self, m, ctx):
        with m.If(self.done(ctx)):
            m.d.sync += ctx.reg[self.dest].eq(ctx.bus.r.data)
            
class LoadWriteImm(InstructionBase):
    def __init__(self, source, offset = None):
        self.source = source
        self.offset = offset
        if offset is None:
            super().__init__(3, write_length = 1)
        else:
            super().__init__(2, write_length = 1)
        
    @classmethod
    def Offset(cls, source, offset = 0xFF00):
        return cls(source, offset = offset)
    
    def address(self, ctx):
        if self.offset is not None:
            return ctx.arg[1] + self.offset
        else:
            return Cat(ctx.arg[1], ctx.arg[2])
    
    def write_data(self, ctx):
        return ctx.reg[self.source]
    
    def done(self, ctx):
        return ctx.bus.stb & ctx.bus.ack & ctx.bus.cycle
        
class Push(InstructionBase):
    def __init__(self, source):
        self.source = source
        super().__init__(1, write_length = 2, addtl_length = 1)
    
    def on_write(self, ctx):
        return ctx.wide[WideReg.SP].eq(ctx.wide[WideReg.SP] - 1)
    
    def address(self, ctx):
        return ctx.wide[WideReg.SP]
    
    def done(self, ctx):
        return ctx.bus_counter == 2
    
    def write_data(self, ctx):
        return ctx.wide[self.source]

class Pop(InstructionBase):
    def __init__(self, dest):
        self.dest = dest
        super().__init__(1, read_length = 2, addtl_length = 1)
        
    def address(self, ctx):
        return Cat(ctx.wide[WideReg.SP])
    
    def on_read(self, ctx):
        return [
            ctx.wide[self.dest].word_select(ctx.bus_counter, 8).eq(ctx.bus.r.data),
            ctx.wide[WideReg.SP].eq(ctx.wide[WideReg.SP] + 1)
        ]
    
    def done(self, ctx):
        return ctx.bus_counter == 2

class DataSource(object):
    def __init__(self, getter, read_getter = None, arg_length = 0, read_length = 0):
        self._getter = getter
        self._addr_getter = read_getter
        self._arg_length = arg_length
        self._read_length = read_length
        
    def arg_length(self):
        return self._arg_length
    
    def read_length(self):
        return self._read_length
    
    def get(self, ctx):
        return self._getter(ctx)
    
    def get_address(self, ctx):
        return self._addr_getter(ctx)
        
    @classmethod
    def ShortRegister(cls, reg):
        return cls(getter = lambda ctx: ctx.reg[reg])
    
    @classmethod
    def WideRegister(cls, reg):
        return cls(getter = lambda ctx: ctx.wide[reg])
    
    @classmethod
    def Immediate(cls, value, width = 1):
        return cls(getter = lambda ctx: value, arg_length = width)
    
    @classmethod
    def Read(cls, pointer):
        return cls(
            getter = lambda ctx: ctx.bus.r.data,
            read_getter = lambda ctx: ctx.wide[pointer],
            read_length = 1
        )

class AluInstruction(InstructionBase):
    def __init__(self, dest, source, operation, flags):
        self.dest = dest
        self.source = source
        super().__init__(arg_length = self.source.arg_length(),
                        read_length = self.source.read_length())
    
    def address(self, ctx):
        return self.source.get_address(ctx)
    
    def _read_done(self, ctx):
        if self.read_length() > 0:
            return ctx.bus.ack & ctx.bus.stb
        else:
            return 1
            
    def _alu_done(self, ctx):
        return ctx.alu.ack & ctx.alu.stb
    
    def alu_valid(self, ctx):
        return self._read_done(ctx) & self.command_ready(ctx)
    
    def done(self, ctx):
        return self._read_done(ctx) & self._alu_done(ctx)
    
    def operate_inst(self, m, ctx):
        m.d.sync += self.dest.eq(ctx.alu.result)