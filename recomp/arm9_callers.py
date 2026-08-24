#!/usr/bin/env python3
"""arm9_callers.py — find callers (bl/b/blx) of given target addresses in
extract/arm9/arm9.bin. Usage: py recomp/arm9_callers.py 0x2062040 0x2062260 ...
"""
import sys
from pathlib import Path

import capstone

data = Path("extract/arm9/arm9.bin").read_bytes()
BASE = 0x02000000
targets = {int(a, 0): a for a in sys.argv[1:]}
md = capstone.Cs(capstone.CS_ARCH_ARM, capstone.CS_MODE_THUMB)
md.skipdata = True
hits = []
for insn in md.disasm(data, BASE):
    if not insn.op_str.startswith("#"):
        continue
    try:
        t = int(insn.op_str[1:], 0)
    except ValueError:
        continue
    if t in targets:
        hits.append((insn.address, insn.mnemonic, t))
print(f"{len(hits)} call site(s):")
for a, m, t in hits:
    print(f"  {a:#010x}  {m:<5} -> {targets[t]}")
