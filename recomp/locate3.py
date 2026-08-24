#!/usr/bin/env python3
"""locate3.py - pin save alignment + hunt for the Luffy koma ids."""
from __future__ import annotations

import argparse
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent.parent / "tools" / "scripts"))
from jus_debug_client import DebugClient  # noqa: E402

LOW, HIGH = 0x29, 0x38  # candidate Luffy koma.bin ids 41..55


def koma_windows(buf: bytes, step: int = 4):
    """Find windows where slots look like koma records."""
    hits = []
    for i in range(0, len(buf) - 4, step):
        kid = int.from_bytes(buf[i:i + 2], "little")
        if LOW <= kid <= HIGH:
            hits.append((i, kid, int.from_bytes(buf[i + 2:i + 4], "little")))
    return hits


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--port", type=int, default=19888)
    ap.add_argument("--save", default="recomp/jus-play.sav")
    args = ap.parse_args()

    sav = Path(args.save).read_bytes()

    with DebugClient("127.0.0.1", args.port) as c:
        print("ping:", c.ping())
        ram_t1 = c.read_mem(0x020B0DBC, 0x11F8)

        # 1. Best alignment of RAM table1 against .sav
        print("\n== RAM t1 vs .sav alignment search (first record) ==")
        first = ram_t1[:0x5C]
        for off in range(0xA80, 0xC80):
            if sav[off:off + 0x5C] == first:
                print(f"  RAM t1[0] == .sav[{off:#x}]")
        # second record alignment
        second = ram_t1[0x5C:0x5C * 2]
        for off in range(0xA80, 0xC80):
            if sav[off:off + 0x5C] == second:
                print(f"  RAM t1[1] == .sav[{off:#x}]")

        # 2. counts + 0xAB4 area
        print("\n== .sav 0xAA0..0xC40 hex ==")
        print("  ", sav[0xAA0:0xC40].hex(" "))

        # 3. RAM dumps around fullwidth DEBUG hits
        print("\n== RAM around FULLW-DEBUG hits ==")
        for addr in (0x020AEE50, 0x020AFF8C, 0x0227EF62):
            print(f"  @0x{addr:08X}:", c.read_mem(addr - 0x60, 0x120).hex(" "))

        # 4. AR deck-builder buffer
        print("\n== AR builder buffer @0x0228AAB0 (0x40) ==")
        print("  ", c.read_mem(0x0228AAB0, 0x40).hex(" "))

        # 5. .sav scan for koma id range
        print("\n== .sav koma-id-range windows ==")
        print("  ", koma_windows(sav, 4)[:60])

        # 6. RAM scan for koma id range
        print("\n== RAM koma-id-range windows (4MB) ==")
        found = []
        for base in range(0x02000000, 0x02400000, 0x10000):
            buf = c.read_mem(base, 0x10000)
            for (i, kid, unk) in koma_windows(buf, 4):
                found.append((base + i, kid, unk))
        print(f"  {len(found)} hits; first 80:")
        for h in found[:80]:
            print(f"    0x{h[0]:08X}: kid={h[1]:#06x} unk={h[2]:#06x}")

        # 7. dump default template @0x02092454
        print("\n== default template @0x02092454 (0x5C) ==")
        print("  ", c.read_mem(0x02092454, 0x5C).hex(" "))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
