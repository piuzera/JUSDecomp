#!/usr/bin/env python3
# probe_pcs.py — sample both cores' PCs/regs to find hot loops.
# Usage: py recomp/probe_pcs.py --port 19879 --samples 12
import argparse
import sys
import time
from collections import Counter
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from savebug_driver import Client  # noqa: E402

ap = argparse.ArgumentParser()
ap.add_argument("--port", type=int, required=True)
ap.add_argument("--samples", type=int, default=12)
args = ap.parse_args()

c = Client(port=args.port)
c.connect(timeout=30)
c.req({"cmd": "ping"})
pcs = {7: Counter(), 9: Counter()}
for i in range(args.samples):
    for cpu in (7, 9):
        r = c.req({"cmd": "regs", "cpu": cpu})
        pc = r.get("pc") or r.get("r15")
        pcs[cpu][pc] += 1
    time.sleep(0.05)
for cpu in (7, 9):
    print(f"cpu{cpu} top PCs:",
          pcs[cpu].most_common(6),
          "raw:", dict(pcs[cpu]))
# one detailed regs dump each
for cpu in (7, 9):
    print(f"cpu{cpu} regs:", c.req({"cmd": "regs", "cpu": cpu}))
