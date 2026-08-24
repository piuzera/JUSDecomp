#!/usr/bin/env python3
"""preset_series.py - map NameTableIdx -> series via pure-single-series preset decks."""
from __future__ import annotations

import struct
from pathlib import Path
from collections import defaultdict

DECK_DIR = Path("extract/deck_extracted/deck")
KOMA = Path("extract/files/bin/koma.bin")

kd = KOMA.read_bytes()
n = len(kd) // 12


def ntbl(kid):
    if kid >= n:
        return None
    return kd[kid * 12 + 4]


def deck_name(rec):
    raw = rec[0x40:]
    end = raw.find(b"\x00")
    if end < 0:
        end = len(raw)
    try:
        return raw[:end].decode("shift_jis")
    except Exception:
        return "HEX:" + raw[:end].hex()


# For each preset: list of (slot, kid, flags), series set.
pure = defaultdict(list)   # ntbl -> [deck names]
mixed_examples = []
for path in sorted(DECK_DIR.rglob("*.bin")):
    rec = path.read_bytes()
    if len(rec) != 0x5C:
        continue
    series = set()
    komas = []
    for i in range(16):
        off = i * 4
        kid, fl = struct.unpack_from("<HH", rec, off)
        if kid != 0xFFFF:
            komas.append(kid)
            t = ntbl(kid)
            if t is not None:
                series.add(t)
    if len(series) == 1:
        pure[next(iter(series))].append(
            f"{path.parent.name}/{path.name}:{deck_name(rec)} komas={komas[:8]}")
    else:
        mixed_examples.append(
            f"{path.parent.name}/{path.name}:{deck_name(rec)} series={sorted(series)}")

out = ["== pure single-series preset decks =="]
for t in sorted(pure):
    out.append(f"NTbl {t}: {len(pure[t])} decks")
    for s in pure[t][:6]:
        out.append(f"   {s}")
out.append("\n== mixed-series examples (first 25) ==")
out.extend(mixed_examples[:25])
Path("recomp/preset_series.txt").write_text("\n".join(out), encoding="utf-8")
print("wrote recomp/preset_series.txt")
