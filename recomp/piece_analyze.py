#!/usr/bin/env python3
"""piece_analyze.py — decode bin/piece.bin (series table) structure."""
from __future__ import annotations

import re
import struct
import sys
from pathlib import Path

try:
    sys.stdout.reconfigure(encoding="utf-8")
except Exception:
    pass

d = Path("extract/files/bin/piece.bin").read_bytes()
print("size", len(d), "head:", d[:0x60].hex())

n = struct.unpack_from("<I", d, 0)[0]
print("count u32@0 =", n)
offs = [struct.unpack_from("<I", d, 4 + i * 4)[0] for i in range(n)]
print("u32 offsets:", [hex(o) for o in offs])

# entry regions (last one ends at EOF)
bounds = list(offs) + [len(d)]
sr = re.compile(rb"[\x81-\x9f\xe0-\xfc][\x40-\x7e\x80-\xfc]+")
for i, (s, e) in enumerate(zip(bounds[:-1], bounds[1:])):
    entry = d[s:e]
    strs = [m.decode("shift_jis") for m in sr.findall(entry)]
    print(f"--- entry {i:2d} @ 0x{s:04X}..0x{e:04X} ({e-s} B) "
          f"strings={strs[:2]}")
    if i >= 30:
        print("   tail hex:", entry[-32:].hex())
