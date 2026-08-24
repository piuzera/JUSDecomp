#!/usr/bin/env python3
"""flags_decode.py - decode the deck slot flags u16 from the preset corpus."""
from __future__ import annotations

import struct
from pathlib import Path
from collections import defaultdict

DECK_DIR = Path("extract/deck_extracted/deck")
KOMA = Path("extract/files/bin/koma.bin")

kd = KOMA.read_bytes()
n = len(kd) // 12

# KGrp -> list of flags observed
by_kgrp = defaultdict(lambda: defaultdict(int))
# kid -> flags observed (for Luffy 823 specifically)
kid_flags = defaultdict(lambda: defaultdict(int))

for path in sorted(DECK_DIR.rglob("*.bin")):
    rec = path.read_bytes()
    if len(rec) != 0x5C:
        continue
    for i in range(16):
        off = i * 4
        kid, fl = struct.unpack_from("<HH", rec, off)
        if kid >= n:
            continue
        kg = kd[kid * 12 + 8]
        by_kgrp[kg][fl] += 1
        kid_flags[kid][fl] += 1

out = []
out.append("KGrp of known sizes (live oracle): Sena 1k (idx0), Luffy 4k (823), Zoro 2k (830)")
for kid in (0, 823, 830):
    out.append(f"  kid {kid}: NTbl={kd[kid*12+4]} NNum={kd[kid*12+5]} "
               f"KGrp={kd[kid*12+8]} KElem={kd[kid*12+9]}")

out.append("\nflags distribution per KGrp (KGrp: flag -> count):")
for kg in sorted(by_kgrp):
    dist = by_kgrp[kg]
    out.append(f"KGrp {kg}: " + ", ".join(f"{fl:#06x}x{n}" for fl, n in sorted(dist.items())))

out.append("\nLuffy 823 flags across corpus:")
for fl, cnt in sorted(kid_flags[823].items()):
    out.append(f"  {fl:#06x} x{cnt}")

Path("recomp/flags_decode.txt").write_text("\n".join(out), encoding="utf-8")
print("wrote recomp/flags_decode.txt")
