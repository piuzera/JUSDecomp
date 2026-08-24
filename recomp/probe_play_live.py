#!/usr/bin/env python3
"""probe_play_live.py — query the manual-play runner on port 19888 (play mode).
Play mode blocks run_* but allows queries. Prints framebuffer means, event
counts, ARM9 PC, CARD ctx / mirror / probe-cache heads, and save info."""
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from savebug_driver import Client  # noqa: E402

PORT = int(sys.argv[1]) if len(sys.argv) > 1 else 19888
c = Client(port=PORT)
c.connect(timeout=30)
print("ping:", c.req({"cmd": "ping"}))
print("counts:", c.req({"cmd": "event_counts"}))
print("save_info:", c.req({"cmd": "cart_save_info"}))
try:
    print("regs9:", c.req({"cmd": "regs", "cpu": 9}))
    print("regs7:", c.req({"cmd": "regs", "cpu": 7}))
except Exception as e:  # noqa: BLE001
    print("regs error:", e)
for engine in ("A", "B"):
    r = c.req({"cmd": "framebuffer", "engine": engine})
    if "rgb" in r:
        raw = bytes.fromhex(r["rgb"])
        print(f"fb{engine}: {r['w']}x{r['h']} mean={sum(raw) / len(raw):.1f}")
    else:
        print(f"fb{engine}: {r}")
for name, addr, size in [
    ("ctx_arm7", 0x020AEC40, 0x40),
    ("ctx_arm9", 0x020AECA0, 0x80),
    ("staging", 0x020AEDC0, 0x40),
    ("mirror", 0x020B02B8, 0x60),
    ("probecache", 0x021DE700, 0x220),
]:
    r = c.req({"cmd": "read_mem", "cpu": 9, "addr": addr, "len": size})
    data = bytes.fromhex(r["hex"]) if "hex" in r else b""
    nz = sum(1 for b in data if b)
    print(f"{name}@{addr:#x}: nz={nz}/{len(data)} {data[:0x30].hex(' ')}")
