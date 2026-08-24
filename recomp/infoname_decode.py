#!/usr/bin/env python3
"""infoname_decode.py - dump infoname.bin strings in file order + koma NTbl stats."""
from __future__ import annotations

import struct
from pathlib import Path

out = []

d = Path("extract/files/bin/infoname.bin").read_bytes()
# strings appear in the blob after the pointer table; extract null-terminated runs
i = 0
ptr_count = 0
while i < len(d):
    p = struct.unpack_from("<I", d, i)[0]
    if p >= len(d):
        break
    ptr_count += 1
    i += 4
out.append(f"infoname.bin: {ptr_count} pointers, size {len(d)}")
# print each pointer and its string
for idx in range(ptr_count):
    p = struct.unpack_from("<I", d, idx * 4)[0]
    end = d.index(b"\x00", p)
    raw = d[p:end]
    try:
        s = raw.decode("shift_jis")
    except Exception:
        s = "HEX:" + raw.hex()
    out.append(f"  [{idx:3d}] 0x{p:04X}: {s}")

# koma.bin NameTableIdx stats
kd = Path("extract/files/bin/koma.bin").read_bytes()
n = len(kd) // 12
from collections import defaultdict
ranges = defaultdict(list)
for i in range(n):
    nt = kd[i * 12 + 4]
    ranges[nt].append(i)
out.append("\nkoma.bin NameTableIdx -> index ranges:")
for nt in sorted(ranges):
    idxs = ranges[nt]
    out.append(f"  NTbl {nt:2d}: {idxs[0]}..{idxs[-1]} ({len(idxs)} entries)")

Path("recomp/infoname_full.txt").write_text("\n".join(out), encoding="utf-8")
print("wrote recomp/infoname_full.txt")
