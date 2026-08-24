#!/usr/bin/env python3
"""vram_hash.py — hash VRAM regions over time to detect whether the battle
scene streams BG map columns (camera scrolling via map rewrites) instead of
using BG scroll registers.

Usage: py recomp/vram_hash.py <port> [samples] [gap_seconds] [base] [len]
"""
import hashlib
import sys
import time
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from savebug_driver import Client  # noqa: E402

RAM_BLOCK = 0x10000


def read_blob(c: Client, addr: int, length: int) -> bytes:
    blob = bytearray()
    for off in range(0, length, RAM_BLOCK):
        r = c.req({"cmd": "read_mem", "cpu": 9, "addr": addr + off,
                   "len": min(RAM_BLOCK, length - off)})
        blob += bytes.fromhex(r["hex"]) if "hex" in r else b"\x00" * RAM_BLOCK
    return bytes(blob)


def main():
    port = int(sys.argv[1]) if len(sys.argv) > 1 else 19888
    samples = int(sys.argv[2]) if len(sys.argv) > 2 else 8
    gap = float(sys.argv[3]) if len(sys.argv) > 3 else 1.5
    base = int(sys.argv[4], 0) if len(sys.argv) > 4 else 0x06000000
    length = int(sys.argv[5], 0) if len(sys.argv) > 5 else 0x20000

    c = Client(port=port)
    c.connect(timeout=60)
    prev = None
    for i in range(samples):
        blob = read_blob(c, base, length)
        h = hashlib.sha1(blob).hexdigest()[:12]
        changed = ""
        if prev is not None:
            diff = sum(1 for a, b in zip(prev, blob) if a != b)
            changed = f" diff={diff}"
        print(f"t{i}: sha1={h} len={len(blob)}{changed}")
        prev = blob
        if i + 1 < samples:
            time.sleep(gap)
    return 0


if __name__ == "__main__":
    sys.exit(main())
