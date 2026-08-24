#!/usr/bin/env python3
"""probe_b8zero_state.py — dump live state of the B8=0 A/B run.
Reads (non-destructive) from the debug server:
  - framebuffer A/B screenshots
  - old ctx struct in main RAM (0x020AEC40)
  - header staging (0x020AEDC0)
  - validator input / save-mirror BSS base (0x020B02B8)
  - deck tables (0x020B0DFC)
  - probe cache (0x021DE700)
  - event counts + save info
"""
import json
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from savebug_driver import Client, png, ROOT  # noqa: E402

PORT = int(sys.argv[1]) if len(sys.argv) > 1 else 19886
c = Client(port=PORT)
c.connect(timeout=30)
c.req({"cmd": "ping"})

for engine in ("A", "B"):
    r = c.req({"cmd": "framebuffer", "engine": engine})
    if "rgb" in r:
        png(ROOT / f"savebug-shot-b8zero-{engine}.png", r["rgb"], r["w"], r["h"])

REGIONS = [
    ("ctx_old(0x020AEC40)", 0x020AEC40, 0x40),
    ("hdr_stage(0x020AEDC0)", 0x020AEDC0, 0x80),
    ("save_mirror(0x020B02B8)", 0x020B02B8, 0x80),
    ("deck1(0x020B0DFC)", 0x020B0DFC, 0x100),
    ("probecache(0x021DE700)", 0x021DE700, 0x300),
]

out = {}
for name, addr, size in REGIONS:
    r = c.req({"cmd": "read_mem", "cpu": 9, "addr": addr, "len": size})
    data = bytes.fromhex(r["hex"]) if "hex" in r else b""
    out[name] = data
    print(f"== {name} ==")
    for off in range(0, len(data), 16):
        print(f"{addr + off:08X}  {data[off:off + 16].hex(' ')}")
    nz = sum(1 for b in data if b)
    print(f"   ({nz}/{len(data)} non-zero)")

print("event_counts:", c.req({"cmd": "event_counts"}))
print("cart_save_info:", c.req({"cmd": "cart_save_info"}))
(ROOT / "probe-b8zero-state.json").write_text(json.dumps(
    {k: v.hex() for k, v in out.items()}, indent=1))
print("wrote recomp/probe-b8zero-state.json")
