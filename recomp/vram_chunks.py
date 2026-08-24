#!/usr/bin/env python3
"""vram_chunks.py — hash 8KB chunks of a VRAM region over time to localize
which areas the battle scene rewrites every frame (fighters etc.) vs static
art. Default target is VRAM bank E (0x06880000), which the battle maps for
LCD/BG use.

Usage: py recomp/vram_chunks.py --port 19888 --base 0x06880000 --len 0x10000
"""
from __future__ import annotations

import argparse
import hashlib
import sys
import time
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from savebug_driver import Client  # noqa: E402

CHUNK = 0x2000


def read_blob(c: Client, addr: int, length: int) -> bytes:
    blob = bytearray()
    for off in range(0, length, 0x1000):
        r = c.req({"cmd": "read_mem", "cpu": 9, "addr": addr + off,
                   "len": min(0x1000, length - off)})
        blob += bytes.fromhex(r["hex"]) if "hex" in r else b"\x00" * 0x1000
    return bytes(blob)


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--port", type=int, default=19888)
    ap.add_argument("--samples", type=int, default=8)
    ap.add_argument("--gap", type=float, default=1.2)
    ap.add_argument("--base", type=lambda v: int(v, 0), default=0x06880000)
    ap.add_argument("--len", dest="length",
                    type=lambda v: int(v, 0), default=0x10000)
    args = ap.parse_args()

    c = Client(port=args.port)
    c.connect(timeout=30)
    c.req({"cmd": "ping"})

    nchunks = args.length // CHUNK
    prev = [None] * nchunks
    for i in range(args.samples):
        blob = read_blob(c, args.base, args.length)
        changed = []
        for k in range(nchunks):
            chunk = blob[k * CHUNK:(k + 1) * CHUNK]
            h = hashlib.sha1(chunk).hexdigest()[:8]
            if prev[k] is not None and h != prev[k]:
                changed.append(k)
            prev[k] = h
        print(f"[{i}] base={args.base:#x} changed_chunks={changed}")
        if i + 1 < args.samples:
            time.sleep(args.gap)
    return 0


if __name__ == "__main__":
    sys.exit(main())
