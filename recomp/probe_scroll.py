#!/usr/bin/env python3
"""probe_scroll.py — time-boxed sampler of the battle-scroll registers.

Runs for a fixed wall-clock duration, reading POWCNT1, DISPCNT_A, BGCNT and
the BG scroll registers each iteration, then writes JSON and prints a
summary. Purpose: catch scroll-register activity while the player moves the
camera during a battle.

Usage: py recomp/probe_scroll.py --port 19888 --duration 10 --out recomp/probe-scroll.json
"""
from __future__ import annotations

import argparse
import json
import sys
import time
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from savebug_driver import Client  # noqa: E402

REGS = [
    (0x04000304, "POWCNT1", 16),
    (0x04000000, "DISPCNT_A", 32),
    (0x04000008, "BG0CNT_A", 16), (0x0400000A, "BG1CNT_A", 16),
    (0x0400000C, "BG2CNT_A", 16), (0x0400000E, "BG3CNT_A", 16),
    (0x04000010, "BG0X_A", 16), (0x04000012, "BG0Y_A", 16),
    (0x04000014, "BG1X_A", 16), (0x04000016, "BG1Y_A", 16),
    (0x04000018, "BG2X_A", 16), (0x0400001A, "BG2Y_A", 16),
    (0x0400001C, "BG3X_A", 16), (0x0400001E, "BG3Y_A", 16),
    (0x04000050, "BLDCNT_A", 16),
]


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--port", type=int, default=19888)
    ap.add_argument("--duration", type=float, default=10.0)
    ap.add_argument("--out", default="recomp/probe-scroll.json")
    args = ap.parse_args()

    c = Client(port=args.port)
    c.connect(timeout=30)
    c.req({"cmd": "ping"})
    samples = []
    deadline = time.monotonic() + args.duration
    while time.monotonic() < deadline:
        t0 = time.monotonic()
        vals = {}
        for addr, name, width in REGS:
            r = c.req({"cmd": "read_io", "cpu": 9, "addr": addr,
                       "width": width})
            vals[name] = int(r.get("value", -1))
        vals["t"] = round(t0, 3)
        samples.append(vals)
        # Advance one vblank pair if the instance accepts it (headless),
        # otherwise just pace by wall clock (interactive play mode).
        c.req({"cmd": "run_to_event", "event": "vblank9", "count": 1})
        time.sleep(max(0.0, 0.1 - (time.monotonic() - t0)))

    Path(args.out).write_text(json.dumps(samples, indent=0) + "\n")
    print(f"samples: {len(samples)}")
    for _, name, _ in REGS:
        values = [s[name] for s in samples]
        uniq = sorted(set(values))
        print(f"{name}: uniq={len(uniq)} range={min(values)}..{max(values)}"
              + (f" values={uniq}" if len(uniq) <= 8 else ""))
    return 0


if __name__ == "__main__":
    sys.exit(main())
