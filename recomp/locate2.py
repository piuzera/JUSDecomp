#!/usr/bin/env python3
"""locate2.py - deeper hunt: full-width DEBUG name, aux array, all save regions."""
from __future__ import annotations

import argparse
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent.parent / "tools" / "scripts"))
from jus_debug_client import DebugClient  # noqa: E402

# Shift-JIS full-width: 0x8263='D' 0x8264='E' 0x8261='B' 0x8274='U' 0x8266='G'
FULLW_DEBUG = bytes([0x82, 0x63, 0x82, 0x64, 0x82, 0x61, 0x82, 0x74, 0x82, 0x66])


def find_all(buf: bytes, needle: bytes):
    hits, start = [], 0
    while True:
        i = buf.find(needle, start)
        if i < 0:
            return hits
        hits.append(i)
        start = i + 1


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--port", type=int, default=19888)
    ap.add_argument("--save", default="recomp/jus-play.sav")
    args = ap.parse_args()

    sav = Path(args.save).read_bytes()
    print(f"== .sav scan (size {len(sav)}) ==")
    for label, off, size in (
        ("deck1 region", 0x0B04, 0x1200),
        ("aux region", 0x1CFC, 0xED8 + 0x100),
        ("deck2 region", 0x2BD4, 0x1200),
    ):
        buf = sav[off:off + size]
        print(f"{label} @0x{off:04X}:")
        print("  head:", buf[:0x20].hex(" "))
        print(f"  FULLW_DEBUG hits: {[hex(off + h) for h in find_all(buf, FULLW_DEBUG)]}")
    # every FULLW_DEBUG hit in whole file
    print("whole-file FULLW_DEBUG hits:", [hex(h) for h in find_all(sav, FULLW_DEBUG)])
    # find non-FF koma-ish data: scan for any u16 in 0x28..0x38 range followed by nonzero
    # inside deck1 region
    region = sav[0x0B04:0x0B04 + 0x11F8]
    hits = []
    for i in range(0, len(region) - 4, 4):
        kid = int.from_bytes(region[i:i + 2], "little")
        unk = int.from_bytes(region[i + 2:i + 4], "little")
        if 0x20 <= kid < 0x400:
            hits.append((i, kid, unk))
    print("deck1-region koma-ish slots (off, kid, unk):", hits[:40])

    with DebugClient("127.0.0.1", args.port) as c:
        print("ping:", c.ping())
        print("\n== RAM aux[0..2] @0x020B1FB4 ==")
        for i in range(3):
            print(f" aux[{i}]:", c.read_mem(0x020B1FB4 + i * 0x4C, 0x4C).hex(" "))
        print("\n== RAM table1 slots 0..3 raw (0x5C each) ==")
        for i in range(4):
            rec = c.read_mem(0x020B0DBC + i * 0x5C, 0x5C)
            print(f" t1[{i}]:", rec.hex(" "))
        print("\n== RAM table2 slots 0..2 raw ==")
        for i in range(3):
            rec = c.read_mem(0x020B2E8C + i * 0x5C, 0x5C)
            print(f" t2[{i}]:", rec.hex(" "))
        print("\n== RAM selected region @0x020AFEB0 (0x20) ==")
        print("  ", c.read_mem(0x020AFEB0, 0x20).hex(" "))
        print("\n== RAM full-width-DEBUG hunt (main RAM) ==")
        for base in range(0x02000000, 0x02400000, 0x10000):
            buf = c.read_mem(base, 0x10000)
            hits = find_all(buf, FULLW_DEBUG)
            if hits:
                print(f"  0x{base:08X}: {[hex(base + h) for h in hits]}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
