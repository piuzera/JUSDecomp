#!/usr/bin/env python3
"""
deck_scan.py — scan extracted Deck.aar presets and cross-reference koma_ids
against koma.bin to identify character decks and the Luffy 4-koma.

Each preset deck is 92 bytes: 0x18 header + 10 slots of {koma_id(u16), unk(u16)}
+ null-terminated name. koma_id is a direct koma.bin index (0-889).

Usage:
    python tools/scripts/deck_scan.py [--series NTBL] [--luffy]
"""

from __future__ import annotations

import argparse
import struct
from pathlib import Path

DECK_DIR = Path("extract/deck_extracted")
KOMA_BIN = Path("extract/files/bin/koma.bin")
RECORD_SIZE = 12


def load_koma() -> list[tuple]:
    data = KOMA_BIN.read_bytes()
    n = len(data) // RECORD_SIZE
    recs = []
    for i in range(n):
        off = i * RECORD_SIZE
        image_id, unk = struct.unpack_from("<HH", data, off)
        name_tbl = data[off + 4]
        name_num = data[off + 5]
        kshape_grp = data[off + 8]
        kshape_elem = data[off + 9]
        recs.append((image_id, unk, name_tbl, name_num, kshape_grp, kshape_elem))
    return recs


def deck_slots(record: bytes) -> list[tuple[int, int]]:
    slots = []
    for i in range(10):
        off = 0x18 + i * 4
        koma_id = struct.unpack_from("<H", record, off)[0]
        unk = struct.unpack_from("<H", record, off + 2)[0]
        slots.append((koma_id, unk))
    return slots


def deck_name(record: bytes) -> str:
    # Name is null-terminated Shift-JIS starting at 0x40.
    raw = record[0x40:]
    end = raw.find(b"\x00")
    if end < 0:
        end = len(raw)
    try:
        return raw[:end].decode("shift_jis", errors="replace")
    except Exception:
        return raw[:end].hex()


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--series", type=int, default=None,
                    help="filter decks whose koma belong to NameTableIdx SERIES")
    ap.add_argument("--luffy", action="store_true",
                    help="find decks containing Luffy (op) koma")
    args = ap.parse_args()

    koma = load_koma()
    decks = sorted(DECK_DIR.rglob("*.bin"))

    print(f"{len(decks)} preset decks, {len(koma)} koma records")

    for path in decks:
        rec = path.read_bytes()
        if len(rec) != 0x5C:
            continue
        slots = deck_slots(rec)
        # Map each koma_id to its series (NameTableIdx).
        series = set()
        for koma_id, unk in slots:
            if koma_id == 0xFFFF:
                continue
            if koma_id < len(koma):
                series.add(koma[ koma_id ][2])
        name = deck_name(rec)
        # "op" = NameTableIdx 3 (from TODO.md: indices 41-55 are op).
        is_luffy = 3 in series
        if args.luffy and not is_luffy:
            continue
        if args.series is not None and args.series not in series:
            continue
        slot_str = " ".join(
            f"{kid:04x}" if kid != 0xFFFF else "--"
            for kid, unk in slots
        )
        # Print name as hex to avoid console encoding issues with Shift-JIS.
        name_hex = rec[0x40:0x40 + 32].split(b"\x00")[0].hex()
        print(f"{path.name}: series={sorted(series)} name_hex={name_hex}")
        print(f"    slots: {slot_str}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
