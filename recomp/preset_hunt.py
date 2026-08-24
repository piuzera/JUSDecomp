#!/usr/bin/env python3
"""preset_hunt.py - find preset decks containing koma ids 823/830 (and NTbl 41)."""
from __future__ import annotations

import struct
from pathlib import Path

DECK_DIR = Path("extract/deck_extracted")
KOMA = Path("extract/files/bin/koma.bin")

kd = KOMA.read_bytes()
n = len(kd) // 12


def ntbl(kid):
    if kid >= n:
        return None
    return kd[kid * 12 + 4], kd[kid * 12 + 5]


def deck_name(rec):
    raw = rec[0x40:]
    end = raw.find(b"\x00")
    if end < 0:
        end = len(raw)
    try:
        return raw[:end].decode("shift_jis")
    except Exception:
        return "HEX:" + raw[:end].hex()


out = []
targets = {823, 830}
for path in sorted(DECK_DIR.rglob("*.bin")):
    rec = path.read_bytes()
    if len(rec) != 0x5C:
        continue
    kids = set()
    for i in range(15):
        off = 0x04 + i * 4
        kid, fl = struct.unpack_from("<HH", rec, off)
        if kid != 0xFFFF:
            kids.add(kid)
    if targets & kids:
        name = deck_name(rec)
        det = []
        for i in range(15):
            off = 0x04 + i * 4
            kid, fl = struct.unpack_from("<HH", rec, off)
            if kid in targets or kid != 0xFFFF:
                det.append(f"{i}:{kid}/{fl:#06x}")
        out.append(f"{path.parent.name}/{path.name}: name={name!r} komas={det}")
Path("recomp/preset_hunt.txt").write_text("\n".join(out), encoding="utf-8")
print(f"{len(out)} preset decks contain 823/830")
print("wrote recomp/preset_hunt.txt")
