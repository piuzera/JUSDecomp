#!/usr/bin/env python3
# probe_state.py — read the JUS ARM7 card-backup driver state:
#   ctx = *0x03809C80 ; state = *ctx ; id = ctx[8>>2] (B8 response)
# Also dumps the ctx struct head for context.
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from savebug_driver import Client  # noqa: E402

PORT = int(sys.argv[1]) if len(sys.argv) > 1 else 19883
c = Client(port=PORT)
c.connect(timeout=30)
print(c.req({"cmd": "ping"}))


def r32(addr):
    r = c.req({"cmd": "read_mem", "cpu": 7, "addr": addr, "len": 4})
    return int.from_bytes(bytes.fromhex(r["hex"]), "little") if "hex" in r else None


ctx = r32(0x03809C80)
print(f"*0x03809C80 = ctx = {ctx and hex(ctx)}")
if ctx:
    words = [r32(ctx + 4 * i) for i in range(16)]
    print("ctx[0..15] =", [hex(w) if w is not None else "?" for w in words])
    print(f"  state (ctx[0]) = {words[0]}")
    print(f"  B8 id (ctx[2]) = {hex(words[2]) if words[2] is not None else '?'}")
    # dump a bit of the struct raw
    r = c.req({"cmd": "read_mem", "cpu": 7, "addr": ctx, "len": 0x60})
    if "hex" in r:
        d = bytes.fromhex(r["hex"])
        for off in range(0, 0x60, 16):
            print(f"  {ctx + off:#x}: {d[off:off + 16].hex(' ')}")
# also the 0x0380A2A0 block (mode vars)
for a in (0x0380A2A0, 0x0380A2A4, 0x0380A2B4, 0x0380A2C0, 0x03809CC8):
    print(f"[{a:#x}] = {hex(r32(a)) if r32(a) is not None else '?'}")
