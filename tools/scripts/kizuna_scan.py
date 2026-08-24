#!/usr/bin/env python3
"""
kizuna_scan.py — scan live game RAM for the ally-boost relationship table.

The per-character id (koma.bin unk[0]) for the owner-confirmed combos:
    Jotaro=111  {Josuke=115, Jolyne=117}
    Goku  =171  {Arale=161, Gohan=173}
    Naruto=184  {Sakura=186, Gaara=188, Jiraiya=189}
The deck viewer (currently showing sparkles) must hold the table in main RAM.
Scan 0x02000000..0x02400000 for those id sequences (u8 and u16 layouts) and
dump surrounding context to reveal the table format.
"""
from __future__ import annotations

import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from jus_debug_client import DebugClient  # noqa: E402

BASE, SIZE, CHUNK = 0x02000000, 0x00400000, 0x80000
PORT = 19888

# distinctive sequences (u8 form)
PATTERNS = {
    "naruto_trio_u8": bytes([186, 188, 189]),
    "naruto_trio_u16": bytes([186, 0, 188, 0, 189, 0]),
    "jotaro_pair_u8": bytes([115, 117]),
    "goku_pair_u8": bytes([161, 173]),
    "goku_pair_u16": bytes([161, 0, 173, 0]),
    "josuke_jolyne_u16": bytes([115, 0, 117, 0]),
}


def find_all(buf: bytes, pat: bytes):
    offs = []
    start = 0
    while True:
        i = buf.find(pat, start)
        if i < 0:
            break
        offs.append(i)
        start = i + 1
    return offs


def main() -> int:
    out = []
    with DebugClient("127.0.0.1", PORT, timeout=30) as c:
        c.ping()
        for base in range(BASE, BASE + SIZE, CHUNK):
            chunk = c.read_mem(base, CHUNK)
            for name, pat in PATTERNS.items():
                for off in find_all(chunk, pat):
                    addr = base + off
                    lo = max(0, off - 48)
                    hi = min(len(chunk), off + 96)
                    ctx = chunk[lo:hi].hex(" ")
                    out.append(f"0x{addr:08X}  {name:20s}  ctx: {ctx}")
    Path("recomp/kizuna_scan.txt").write_text("\n".join(out), encoding="utf-8")
    print(f"{len(out)} hits -> recomp/kizuna_scan.txt")
    for line in out[:80]:
        print(line)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
