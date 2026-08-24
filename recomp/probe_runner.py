#!/usr/bin/env python3
"""
probe_runner.py — connect to an already-running ladder runner, advance frames,
RAM-scan for acceptance signals, write a JSON result.

Usage:
  py recomp/probe_runner.py --port 19878 --frames 240 --out recomp/probe-20000.json
Acceptance: import data window (0x4000) in RAM + deck tables not default.
"""
from __future__ import annotations

import argparse
import json
import sys
import time
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from savebug_driver import Client  # noqa: E402

ROOT = Path(__file__).resolve().parent
RAM_BASE, RAM_LEN = 0x02000000, 0x400000
TEMPLATE_NAME = b"\x83\x66\x83\x62\x83\x4c"

imp = (ROOT / "jus-trace.sav").read_bytes()
WIN_4000 = imp[0x4000:0x4020]
WIN_4400 = imp[0x4400:0x4420]
WIN_B04 = imp[0x0B04:0x0B24]


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--port", type=int, required=True)
    ap.add_argument("--frames", type=int, default=240)
    ap.add_argument("--out", required=True)
    args = ap.parse_args()

    c = Client(port=args.port)
    c.connect(timeout=60)
    c.req({"cmd": "ping"})
    res = {"port": args.port, "frames": args.frames}
    stalled = None
    for i in range(1, args.frames + 1):
        r = c.req({"cmd": "run_to_event", "event": "vblank9", "count": i})
        if not r.get("reached"):
            stalled = r
            break
    res["stalled"] = stalled

    blob = bytearray()
    for off in range(0, RAM_LEN, 0x10000):
        r = c.req({"cmd": "read_mem", "cpu": 9, "addr": RAM_BASE + off,
                   "len": 0x10000})
        blob += (bytes.fromhex(r["hex"]) if "hex" in r
                 else b"\x00" * 0x10000)
    ram = bytes(blob)
    res["win4000_in_ram"] = ram.find(WIN_4000) >= 0
    res["win4400_in_ram"] = ram.find(WIN_4400) >= 0
    res["winb04_in_ram"] = ram.find(WIN_B04) >= 0
    deck = ram[0x020B0000 - RAM_BASE:0x020C0000 - RAM_BASE]
    res["deck_default_init"] = deck.find(TEMPLATE_NAME) >= 0
    res["jssgxu_hits"] = [RAM_BASE + i for i in range(len(ram) - 6)
                          if ram[i:i + 6] == b"JSSGXu"][:12]
    res["dirty"] = c.req({"cmd": "cart_save_info"}).get("dirty")
    res["accepted"] = (res["win4000_in_ram"] and not res["deck_default_init"])
    Path(args.out).write_text(json.dumps(res, indent=1) + "\n")
    print(json.dumps(res, indent=1))
    return 0


if __name__ == "__main__":
    sys.exit(main())
