#!/usr/bin/env python3
# probe_validator.py — reset, then run_to_pc on the ARM9 save-validator
# candidates around the JSSGXu constant (0x02072A50):
#   func_02072a60 (Thumb, 0x54) and func_02072ab4 (ARM, 0x660).
# If reached, dump registers + nearby RAM to identify inputs.
import json
import sys
import time
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from savebug_driver import Client  # noqa: E402

PORT = int(sys.argv[1]) if len(sys.argv) > 1 else 19882
LOG = Path("recomp/probe-validator.log")


def note(msg):
    line = f"[{time.strftime('%H:%M:%S')}] {msg}"
    print(line, flush=True)
    with LOG.open("a") as f:
        f.write(line + "\n")


c = Client(port=PORT)
c.connect(timeout=30)
note(f"ping {c.req({'cmd': 'ping'})}")
note(f"reset {c.req({'cmd': 'reset'})}")
time.sleep(2)

for pc in (0x02072A60, 0x02072AB4):
    r = c.req({"cmd": "run_to_pc", "pc": pc, "max_rounds": 20000000})
    note(f"run_to_pc {pc:#x}: reached={r.get('reached')} "
         f"rounds={r.get('rounds')} reason9={r.get('reason9')} "
         f"reason7={r.get('reason7')}")
    if r.get("reached"):
        regs = c.req({"cmd": "regs", "cpu": 9})
        note(f"ARM9 regs: {regs}")
        rr = regs.get("r", [])
        # dump memory pointed to by r0..r3 (likely args)
        for idx in range(min(4, len(rr))):
            p = rr[idx]
            if 0x02000000 <= p < 0x04000000:
                m = c.req({"cmd": "read_mem", "cpu": 9, "addr": p & ~1,
                           "len": 0x40})
                if "hex" in m:
                    d = bytes.fromhex(m["hex"])
                    note(f"r{idx} -> {p:#x}: {d[:0x40].hex(' ')}")
        # continue a bit to see return value flow? stop here for now.
        break
