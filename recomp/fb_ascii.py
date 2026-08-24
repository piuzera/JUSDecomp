#!/usr/bin/env python3
"""fb_ascii.py — grab the live framebuffers and print coarse ASCII art, plus
dump engine-A OAM entries verbatim. Used to understand scene composition
without a display."""
from __future__ import annotations

import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from savebug_driver import Client  # noqa: E402

RAMP = " .:-=+*#%@"


def art(w: int, rgb: bytes, cols: int = 96) -> list[str]:
    h = 192
    step_x = max(1, w // cols)
    rows = int(cols * (h / w))
    step_y = max(1, h // rows)
    lines = []
    for y in range(0, h, step_y):
        line = []
        for x in range(0, w, step_x):
            i = (y * w + x) * 3
            lum = (rgb[i] * 2 + rgb[i + 1] * 5 + rgb[i + 2]) // 8
            line.append(RAMP[min(9, lum * 10 // 256)])
        lines.append("".join(line))
    return lines


def main() -> int:
    port = int(sys.argv[1]) if len(sys.argv) > 1 else 19888
    c = Client(port=port)
    c.connect(timeout=30)
    c.req({"cmd": "ping"})
    for eng in ("A", "B"):
        r = c.req({"cmd": "framebuffer", "engine": eng})
        if "rgb" not in r:
            print(f"{eng}: {r}")
            continue
        w = int(r["w"])
        rgb = bytes.fromhex(r["rgb"])
        print(f"=== engine {eng} ({w}x192) ===")
        for line in art(w, rgb):
            print(line)
    print("=== engine A OAM ===")
    r = c.req({"cmd": "read_mem", "cpu": 9, "addr": 0x07000000,
               "len": 0x400})
    oam = bytes.fromhex(r["hex"]) if "hex" in r else b""
    for n in range(128):
        a0 = int.from_bytes(oam[n * 8:n * 8 + 2], "little")
        if a0 & 0x0200:
            continue
        a1 = int.from_bytes(oam[n * 8 + 2:n * 8 + 4], "little")
        a2 = int.from_bytes(oam[n * 8 + 4:n * 8 + 6], "little")
        sy = a0 & 0xFF
        sx = (a1 & 0x1FF)
        if sx >= 0x200:
            sx -= 0x400
        print(f"  [{n:3d}] y={sy:3d} x={sx:4d} attr0={a0:#06x} "
              f"attr1={a1:#06x} attr2={a2:#06x} shape={(a0>>14)&3} "
              f"size={(a1>>14)&3} prio={(a2>>10)&3} pal={(a2>>12)&0xF} "
              f"tile={a2&0x3FF:#x}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
