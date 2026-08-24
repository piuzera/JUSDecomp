#!/usr/bin/env python3
"""
battle_dupe.py - Route 4 watchdog: auto-splice cloned battle-koma nodes into
every newly-built battle list.

Dedup (disasm, func_02076e38): the game rejects a koma if its koma-record
ImageID already appears in the battle linked list (node[0x34] -> u16). We
bypass it data-only: once a battle's list is built, splice N clones of the
Luffy node right after it. Node layout: next@+0x0, koma_id u16@+0xC,
position byte@+0xE (row<<4|col), koma-record ptr@+0x34, size 0x50.

Modes:
    --once    poll up to --timeout for a Luffy node, splice, exit (manual sync)
    --watch   run forever; whenever a NEW Luffy node appears (battle rebuilt),
              splice clones into it automatically
"""
from __future__ import annotations

import argparse
import sys
import time
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent.parent / "tools" / "scripts"))
from jus_debug_client import DebugClient  # noqa: E402

CTX_PTR = 0x0214BD80
KOMA_TABLE_OFF = 0x30
SCRATCH = 0x020B2E8C
NODE_SIZE = 0x50
NODE_NEXT = 0x00
NODE_KID = 0x0C
NODE_POS = 0x0E
NODE_REC = 0x34

# scan window first (nodes observed at 0x021DE99C / 0x021DF19C), then full RAM
FAST_WINDOWS = [(0x021D8000, 0x20000)]  # 128KB
FULL_SCAN = [(0x02000000 + i * 0x10000, 0x10000) for i in range(64)]

POSITIONS = [(0x03, "r0c3"), (0x20, "r2c0"), (0x23, "r2c3")]


def find_nodes(c: DebugClient, luffy_rec: int, koma_id: int,
               windows) -> list[int]:
    hits = []
    for base, size in windows:
        buf = c.read_mem(base, size)
        start = 0
        while True:
            i = buf.find(luffy_rec.to_bytes(4, "little"), start)
            if i < 0:
                break
            start = i + 1
            if i % 4 == 0 and i >= NODE_REC:
                node = base + i - NODE_REC
                kid = int.from_bytes(buf[i - NODE_REC + NODE_KID:
                                      i - NODE_REC + NODE_KID + 2], "little")
                if kid == koma_id:
                    hits.append(node)
    return hits


def splice(c: DebugClient, node: int, copies: int) -> int:
    node_bytes = c.read_mem(node, NODE_SIZE)
    next_ptr = int.from_bytes(node_bytes[0:4], "little")
    n = 0
    for i in range(min(copies, len(POSITIONS))):
        clone = SCRATCH + i * NODE_SIZE
        pos_byte, label = POSITIONS[i]
        data = bytearray(node_bytes)
        data[NODE_NEXT:NODE_NEXT + 4] = next_ptr.to_bytes(4, "little")
        data[NODE_POS] = pos_byte
        c.write_mem(clone, bytes(data))
        c.write_mem(node + NODE_NEXT, clone.to_bytes(4, "little"))
        next_ptr = clone
        n += 1
        print(f"  cloned @0x{clone:08X} pos=0x{pos_byte:02X} ({label})")
    return n


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--port", type=int, default=19888)
    ap.add_argument("--koma", type=int, default=823)
    ap.add_argument("--copies", type=int, default=3)
    ap.add_argument("--timeout", type=float, default=120.0)
    ap.add_argument("--once", action="store_true")
    ap.add_argument("--watch", action="store_true")
    args = ap.parse_args()

    with DebugClient("127.0.0.1", args.port) as c:
        print("ping:", c.ping())
        seen = set()
        deadline = time.time() + args.timeout
        while True:
            if args.once and time.time() > deadline:
                print("[!] timeout: no Luffy node found")
                return 1
            ctx = c.read_u32(CTX_PTR)
            node = None
            if ctx:
                table = c.read_u32(ctx + KOMA_TABLE_OFF)
                if table:
                    rec = table + args.koma * 0xC
                    hits = find_nodes(c, rec, args.koma, FAST_WINDOWS)
                    if not hits:
                        hits = find_nodes(c, rec, args.koma, FULL_SCAN)
                    if hits:
                        node = hits[0]
            if node is not None and node not in seen:
                seen.add(node)
                print(f"new Luffy node @0x{node:08X} - splicing {args.copies} clones")
                splice(c, node, args.copies)
                print("done. watch the battle.")
                if args.once:
                    return 0
            time.sleep(0.05)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
