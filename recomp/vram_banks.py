#!/usr/bin/env python3
"""vram_banks.py — hash every VRAM bank (raw, via read_region) plus OAM and
palettes over time, to find which storage the battle scene rewrites live."""
from __future__ import annotations

import argparse
import hashlib
import sys
import time
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from savebug_driver import Client  # noqa: E402

BANKS = [f"vram{chr(65 + i)}" for i in range(9)]
BANKS += ["palA", "palB", "oam"]


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--port", type=int, default=19888)
    ap.add_argument("--samples", type=int, default=8)
    ap.add_argument("--gap", type=float, default=1.2)
    args = ap.parse_args()

    c = Client(port=args.port)
    c.connect(timeout=30)
    c.req({"cmd": "ping"})

    prev = {}
    for i in range(args.samples):
        changed = []
        for name in BANKS:
            r = c.req({"cmd": "read_region", "region": name})
            blob = bytes.fromhex(r["hex"]) if "hex" in r else b""
            h = hashlib.sha1(blob).hexdigest()[:8]
            if name in prev and h != prev[name]:
                changed.append(name)
            prev[name] = h
        print(f"[{i}] changed_banks={changed}")
        if i + 1 < args.samples:
            time.sleep(args.gap)
    return 0


if __name__ == "__main__":
    sys.exit(main())
