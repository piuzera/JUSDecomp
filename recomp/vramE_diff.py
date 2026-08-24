#!/usr/bin/env python3
"""vramE_diff.py — sample raw bank E (read_region) and report which 2KB
sub-chunks change between consecutive samples, localizing the live-rendered
regions of the battle scene."""
from __future__ import annotations

import argparse
import hashlib
import sys
import time
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from savebug_driver import Client  # noqa: E402

CHUNK = 0x800


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--port", type=int, default=19888)
    ap.add_argument("--samples", type=int, default=6)
    ap.add_argument("--gap", type=float, default=1.2)
    args = ap.parse_args()

    c = Client(port=args.port)
    c.connect(timeout=30)
    c.req({"cmd": "ping"})

    prev = None
    for i in range(args.samples):
        r = c.req({"cmd": "read_region", "region": "vramE"})
        blob = bytes.fromhex(r["hex"]) if "hex" in r else b""
        changed = []
        if prev is not None:
            changed = [k for k in range(len(blob) // CHUNK)
                       if blob[k * CHUNK:(k + 1) * CHUNK] !=
                       prev[k * CHUNK:(k + 1) * CHUNK]]
        print(f"[{i}] vramE changed 2KB chunks "
              f"(offset = chunk*0x800): {changed}")
        prev = blob
        if i + 1 < args.samples:
            time.sleep(args.gap)
    return 0


if __name__ == "__main__":
    sys.exit(main())
