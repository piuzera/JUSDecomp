#!/usr/bin/env python3
# probe19878.py — connect to the manual 128K ladder runner, step frames, report.
import sys, time
sys.path.insert(0, "recomp")
from savebug_driver import Client

c = Client(port=19878)
c.connect(timeout=30)
print("connected", c.req({"cmd": "ping"}))
for i in range(1, 61):
    r = c.req({"cmd": "run_to_event", "event": "vblank9", "count": i})
    if i % 10 == 0 or not r.get("reached"):
        print(i, r.get("reached"), r.get("rounds"), r.get("stalled"),
              r.get("reason9", ""), r.get("reason7", ""))
        if not r.get("reached"):
            break
info = c.req({"cmd": "cart_save_info"})
print("save:", info)
