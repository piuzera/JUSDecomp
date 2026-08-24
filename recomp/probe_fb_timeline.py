#!/usr/bin/env python3
"""probe_fb_timeline.py — sample framebuffer means at chosen vblanks after
reset, to map when the white boot screen gives way to the intro video."""
import sys
import time
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from savebug_driver import Client  # noqa: E402

PORT = int(sys.argv[1]) if len(sys.argv) > 1 else 19889
FRAMES = [5, 10, 15, 20, 25, 30, 40, 50, 60, 80, 100, 120, 150, 200, 250, 300]

c = Client(port=PORT)
c.connect(timeout=30)
print("ping:", c.req({"cmd": "ping"}))
print("reset:", c.req({"cmd": "reset"}))
time.sleep(1)

prev = 0
for n in FRAMES:
    r = c.req({"cmd": "run_to_event", "event": "vblank9", "count": n,
               "max_rounds": 30000000, "stall": 300000})
    ok = r.get("reached")
    means = {}
    for engine in ("A", "B"):
        f = c.req({"cmd": "framebuffer", "engine": engine})
        if "rgb" in f:
            raw = bytes.fromhex(f["rgb"])
            means[engine] = round(sum(raw) / len(raw), 1)
    print(f"vblank {n:3d}: reached={ok} fb={means} "
          f"rounds={r.get('rounds')}")
    if not ok:
        print("  reason9:", r.get("reason9"), "reason7:", r.get("reason7"))
        break
    prev = n
