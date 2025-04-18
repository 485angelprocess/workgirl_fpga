from test.cpu_formal import *
from cpu.iset import LoadInstructionSet, ReportIset

import argparse

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description = "Verify operation of opcodes of processor")
    parser.add_argument("-o", "--op_code", help = "Check specific opcode (hex)")
    parser.add_argument("-r", "--report", action = "store_true", help = "Report iset info")

    args = parser.parse_args()
    
    iset = LoadInstructionSet()
    
    v = CpuVerifier()
    
    if args.report:
        ReportIset(iset)
    elif args.op_code is None:
        for op in iset:
            v.verify(op, iset[op])
    else:
        op = int(args.op_code, 16)
        v.verify(op, iset[op], verbose = 3)