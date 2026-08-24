#!/usr/bin/env python3
"""locate_debug_deck.py - find the "DEBUG" deck record in RAM and in the .sav."""
from __future__ import annotations

import argparse
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent.parent / "tools" / "scripts"))
from jus_debug_client import DebugClient  # noqa: E402

NAME = b"DEBUG"
SAV_OFF = 0x0B04
REC = 0x5C


def find_all(buf: bytes, needle: bytes):
    hits = []
    start = 0
    while True:
        i = buf.find(needle, start)
        if i < 0:
            break
        hits.append(i)
        start = i + 1
    return hits


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--port", type=int, default=19888)
    ap.add_argument("--save", default="recomp/jus-play.sav")
    args = ap.parse_args()

    # 1. Save file scan.
    sav = Path(args.save).read_bytes()
    print(f".sav size={len(sav)}")
    print(f".sav counts @0xAB4: c1={sav[0x0AB4]} c2={sav[0x0AB5]}")
    print(f".sav [0xB04..0xB04+0x5C]: {sav[SAV_OFF:SAV_OFF+REC].hex(' ')}")
    print(f".sav hits for {NAME!r}: {find_all(sav, NAME)}")

    # 2. RAM scan for the name.
    with DebugClient("127.0.0.1", args.port) as c:
        print("ping:", c.ping())
        for base in (0x020B0000, 0x020C0000, 0x020D0000, 0x020E0000,
                     0x020F0000, 0x02100000, 0x02110000, 0x02120000,
                     0x02130000, 0x02140000, 0x02150000, 0x02160000,
                     0x02170000, 0x02180000, 0x02190000, 0x021A0000,
                     0x021B0000, 0x021C0000, 0x021D0000, 0x021E0000,
                     0x021F0000, 0x02200000, 0x02210000, 0x02220000,
                     0x02230000, 0x02240000, 0x02250000, 0x02260000,
                     0x02270000, 0x02280000, 0x02290000, 0x022A0000,
                     0x02060000, 0x02070000, 0x02080000, 0x02090000,
                     0x020A0000):
            buf = c.read_mem(base, 0x10000)
            hits = find_all(buf, NAME)
            if hits:
                print(f"RAM hit(s) at 0x{base:08X}: {[hex(base + h) for h in hits]}")
        # Dump table1 slot0 raw and counts block.
        print("t1_count:", c.read_u8(0x020B0D6C), "t2_count:", c.read_u8(0x020B0D6D))
        rec = c.read_mem(0x020B0DBC, REC)
        print("RAM t1[0] raw:", rec.hex(" "))
        print("RAM t1[1] raw:", c.read_mem(0x020B0DBC + REC, REC).hex(" "))
        # Counts neighborhood.
        print("counts block:", c.read_mem(0x020B0D60, 0x20).hex(" "))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
