#!/usr/bin/env python3
"""corpus_flags.py - dump all observed (flags) per koma id from the preset corpus."""
from __future__ import annotations

import struct
from collections import defaultdict
from pathlib import Path

DECK_DIR = Path("extract/deck_extracted/deck")
KOMA = Path("extract/files/bin/koma.bin")
kd = KOMA.read_bytes()
n = len(kd) // 12

wanted = {0, 2, 823, 824, 828, 829, 830, 820, 821, 822, 825, 826, 827}
per_kid = defaultdict(lambda: defaultdict(int))

for path in sorted(DECK_DIR.rglob("*.bin")):
    rec = path.read_bytes()
    if len(rec) != 0x5C:
        continue
    for i in range(16):
        off = i * 4
        kid, fl = struct.unpack_from("<HH", rec, off)
        if kid in wanted:
            per_kid[kid][fl] += 1

out = []
out.append("kid: NTbl NNum KGrp KElem  (flags observed in presets)")
for kid in sorted(wanted):
    if kid >= n:
        continue
    nt, nn = kd[kid * 12 + 4], kd[kid * 12 + 5]
    kg, ke = kd[kid * 12 + 8], kd[kid * 12 + 9]
    flags = ", ".join(f"{fl:#06x}x{c}" for fl, c in sorted(per_kid[kid].items()))
    out.append(f"{kid:4d}: NTbl={nt:2d} NNum={nn:2d} KGrp={kg} KElem={ke}  [{flags}]")
Path("recomp/corpus_flags.txt").write_text("\n".join(out), encoding="utf-8")
print("wrote recomp/corpus_flags.txt")
