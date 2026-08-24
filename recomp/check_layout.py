#!/usr/bin/env python3
"""check_layout.py — brute-force the true tile/pixel ordering for koma DTX4
sprites: candidate decodings of a DETAILED koma dtx vs JUSToolkit's export.

Usage: py recomp/check_layout.py <dtx> <exported_png>
"""
from __future__ import annotations

import sys
from pathlib import Path

from PIL import Image

sys.path.insert(0, "tools/scripts")
from dtx4_mod import Dtx4, unpack555  # noqa: E402


def decode(dtx: Dtx4, tile_offset: int, tile_order: str,
           nibble_swap: bool) -> Image.Image:
    img = Image.new("RGB", (48, 48))
    px = img.load()
    for i in range(36):
        if tile_order == "row":
            tx, ty = i % 6, i // 6
        else:  # col
            tx, ty = i // 6, i % 6
        src = tile_offset + i
        base = dtx.pixels_start + src * 32
        for y in range(8):
            for x in range(0, 8, 2):
                b = dtx.data[base + y * 4 + x // 2]
                left, right = b >> 4, b & 0x0F
                if nibble_swap:
                    left, right = right, left
                gx, gy = tx * 8 + x, ty * 8 + y
                px[gx, gy] = unpack555(dtx.palettes[0][left])
                px[gx + 1, gy] = unpack555(dtx.palettes[0][right])
    return img


def main() -> int:
    ref = Image.open(sys.argv[2]).convert("RGBA").crop((0, 0, 48, 48))
    dtx = Dtx4(Path(sys.argv[1]).read_bytes())
    for offset in (0, 1):
        for order in ("row", "col"):
            for swap in (False, True):
                got = decode(dtx, offset, order, swap)
                opaque_diff = 0
                for y in range(48):
                    for x in range(48):
                        ra = ref.getpixel((x, y))[3]
                        if ra >= 128 and got.getpixel((x, y)) != ref.getpixel((x, y))[:3]:
                            opaque_diff += 1
                print(f"tile_offset={offset} order={order} nibble_swap={swap}: "
                      f"opaque_mismatches={opaque_diff}/2304")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
