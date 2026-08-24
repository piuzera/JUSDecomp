#!/usr/bin/env python3
"""preset_headers.py - dump first 0x18 bytes of key preset decks + NTbl41 koma details."""
from __future__ import annotations

import struct
from pathlib import Path

DECK_DIR = Path("extract/deck_extracted/deck")
KOMA = Path("extract/files/bin/koma.bin")

kd = KOMA.read_bytes()
n = len(kd) // 12

names = {
    "jadv/003.bin": "OP1",
    "jadv/075.bin": "SD1",
    "jadv/120.bin": "JJ2",
    "jadv/182.bin": "HANYOU37",
    "jard/027.bin": "ORAA",
    "play/000.bin": "GOHAN",
    "smpl/000.bin": "STARTER",
}
out = []
for rel, label in names.items():
    rec = (DECK_DIR / rel).read_bytes()
    hdr = rec[:0x18].hex(" ")
    u32s = [struct.unpack_from("<I", rec, i)[0] for i in (0, 4, 8, 12, 16, 20)]
    slots = []
    for i in range(15):
        off = 0x04 + i * 4
        kid, fl = struct.unpack_from("<HH", rec, off)
        if kid != 0xFFFF:
            slots.append(f"{i}:{kid}/{fl:#06x}")
    out.append(f"{label} ({rel}): u32s={[hex(u) for u in u32s]}")
    out.append(f"   komas: {slots}")

out.append("\nNTbl 41 koma details (idx NNum KGrp KElem u10 u11):")
for i in range(820, 870):
    nt = kd[i * 12 + 4]
    if nt != 41:
        continue
    nn = kd[i * 12 + 5]
    kg = kd[i * 12 + 8]
    ke = kd[i * 12 + 9]
    u10 = kd[i * 12 + 10]
    u11 = kd[i * 12 + 11]
    mark = " <-- 823" if i == 823 else (" <-- 830" if i == 830 else "")
    out.append(f"  {i}: NNum={nn} KGrp={kg} KElem={ke} u10={u10} u11={u11}{mark}")

Path("recomp/preset_headers.txt").write_text("\n".join(out), encoding="utf-8")
print("wrote recomp/preset_headers.txt")
