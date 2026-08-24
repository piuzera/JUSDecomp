#!/usr/bin/env python3
"""view_cells.py — ASCII-render the 48x48 cell of a JUSToolkit export PNG and
of my row-major decode, side by side, to eyeball the real pixel mapping."""
from __future__ import annotations

import sys
from pathlib import Path

from PIL import Image

sys.path.insert(0, "tools/scripts")
from dtx4_mod import Dtx4, unpack555  # noqa: E402

RAMP = " .:-=+*#%@"


def lum(rgb: tuple[int, int, int]) -> int:
    r, g, b = rgb
    return (r * 2 + g * 5 + b) // 8


def cell_art(img: Image.Image, alpha_aware: bool = True) -> list[str]:
    lines = []
    for y in range(48):
        line = []
        for x in range(48):
            if alpha_aware:
                px = img.getpixel((x, y))
                if len(px) == 4 and px[3] < 128:
                    line.append(" ")
                    continue
                rgb = px[:3]
            else:
                rgb = img.getpixel((x, y))
            line.append(RAMP[min(9, lum(rgb) * 10 // 256)])
        lines.append("".join(line))
    return lines


def main() -> int:
    ref = Image.open(sys.argv[1]).convert("RGBA")
    cell = ref.crop((0, 0, 48, 48))
    ref_art = cell_art(cell)

    dtx = Dtx4(Path(sys.argv[2]).read_bytes())
    got = Image.new("RGB", (48, 48))
    px = got.load()
    for i in range(36):
        tx, ty = i % 6, i // 6
        base = dtx.pixels_start + i * 32
        for y in range(8):
            for x in range(0, 8, 2):
                b = dtx.data[base + y * 4 + x // 2]
                left, right = b >> 4, b & 0x0F
                if left == 0:
                    px[tx * 8 + x, ty * 8 + y] = (0, 248, 0)
                else:
                    px[tx * 8 + x, ty * 8 + y] = unpack555(dtx.palettes[0][left])
                if right == 0:
                    px[tx * 8 + x + 1, ty * 8 + y] = (0, 248, 0)
                else:
                    px[tx * 8 + x + 1, ty * 8 + y] = unpack555(dtx.palettes[0][right])
    got_art = cell_art(got, alpha_aware=False)

    for i in range(48):
        print(f"{ref_art[i]}  |  {got_art[i]}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
