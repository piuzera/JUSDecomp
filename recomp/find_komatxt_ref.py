#!/usr/bin/env python3
"""find_komatxt_ref.py — locate PC-relative references to the 'bin/komatxt.bin'
string in arm9 and dump the surrounding code, to find the hardcoded read size."""
from __future__ import annotations

import capstone

BASE = 0x02000000
data = open("extract/arm9/arm9.bin", "rb").read()
TARGETS = {0x0209F5A4, 0x0209F5A8}

md = capstone.Cs(capstone.CS_ARCH_ARM, capstone.CS_MODE_ARM)
md.detail = True

hits = []
for insn in md.disasm(data, BASE):
    if insn.id not in (capstone.arm.ARM_INS_ADD, capstone.arm.ARM_INS_SUB):
        continue
    ops = insn.operands
    for op in ops:
        if op.type == capstone.arm.ARM_OP_REG and md.reg_name(op.reg) == "pc":
            # last operand is the immediate
            imm_op = ops[-1]
            if imm_op.type != capstone.arm.ARM_OP_IMM:
                continue
            sign = 1 if insn.id == capstone.arm.ARM_INS_ADD else -1
            tgt = insn.address + 8 + sign * imm_op.imm
            if tgt in TARGETS:
                hits.append((insn.address, tgt))

print(f"pc-relative hits: {hits}")
for addr, tgt in hits:
    lo, hi = addr - 0x40, addr + 0x100
    print(f"--- code around 0x{addr:X} (targets 0x{tgt:X}) ---")
    for insn in md.disasm(data[lo - BASE:hi - BASE], lo):
        print(f"  0x{insn.address:08X}  {insn.mnemonic:8s} {insn.op_str}")
print(f"total insns scanned: done, hits={len(hits)}")
