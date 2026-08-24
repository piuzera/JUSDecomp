#!/usr/bin/env python3
"""
koma_analyze.py — inspect koma.bin and relate AR koma IDs to koma.bin indices.

koma.bin is an array of 890 12-byte KomaElement records:
    ImageID(u16), Unknown(u16), NameTableIdx(u8), NameNum(u8),
    Unknown(u8)x2, KShapeGroupIdx(u8), KShapeElementIdx(u8), Unknown(u8)x2

The Action Replay "fill deck-builder buffer" code writes 16-bit koma IDs
(0x021EXXXX) where XXXX is a per-character koma id. Luffy 4-koma = 0x28B4.
This script helps determine how those AR IDs map to koma.bin indices (the
value stored in a deck record's koma_id field).

Usage:
    python tools/scripts/koma_analyze.py [--dump-range A B]
"""

from __future__ import annotations

import argparse
import struct
from pathlib import Path

KOMA_BIN = Path("extract/files/bin/koma.bin")
RECORD_SIZE = 12


def load_records() -> list[tuple]:
    data = KOMA_BIN.read_bytes()
    n = len(data) // RECORD_SIZE
    recs = []
    for i in range(n):
        off = i * RECORD_SIZE
        image_id, unk = struct.unpack_from("<HH", data, off)
        name_tbl = data[off + 4]
        name_num = data[off + 5]
        u6, u7 = data[off + 6], data[off + 7]
        kshape_grp = data[off + 8]
        kshape_elem = data[off + 9]
        u10, u11 = data[off + 10], data[off + 11]
        recs.append((image_id, unk, name_tbl, name_num, u6, u7,
                     kshape_grp, kshape_elem, u10, u11))
    return recs


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--dump-range", nargs=2, type=int, metavar=("A", "B"),
                    help="dump records in index range [A, B)")
    args = ap.parse_args()

    recs = load_records()
    print(f"koma.bin: {len(recs)} records")

    if args.dump_range:
        a, b = args.dump_range
        print(f"{'idx':>4} {'ImageID':>8} {'unk':>6} {'NTbl':>4} {'NNum':>4} "
              f"{'u6':>3} {'u7':>3} {'KGrp':>4} {'KElem':>5} {'u10':>3} {'u11':>3}")
        for i in range(a, min(b, len(recs))):
            r = recs[i]
            print(f"{i:4d} {r[0]:8d} {r[1]:6d} {r[2]:4d} {r[3]:4d} "
                  f"{r[4]:3d} {r[5]:3d} {r[6]:4d} {r[7]:5d} {r[8]:3d} {r[9]:3d}")
        return 0

    # Summary: distribution of NameTableIdx (series code index).
    from collections import Counter
    tbl = Counter(r[2] for r in recs)
    print("\nNameTableIdx distribution (series code index -> count):")
    for k in sorted(tbl):
        print(f"  {k:3d}: {tbl[k]}")

    # Find records whose ImageID matches the AR "op" (One Piece) range.
    # Luffy AR ids: 1koma 0x2890 .. 8koma 0x28f0 (stride 0x0C).
    print("\nRecords with ImageID in Luffy AR range (0x2890..0x28F0):")
    for i, r in enumerate(recs):
        if 0x2890 <= r[0] <= 0x28F0:
            print(f"  idx {i:4d}: ImageID=0x{r[0]:04X} NameTbl={r[2]} NameNum={r[3]} "
                  f"KShapeGrp={r[6]} KShapeElem={r[7]}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
