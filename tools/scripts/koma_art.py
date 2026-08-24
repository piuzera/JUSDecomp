#!/usr/bin/env python3
"""
koma_art.py — author a custom koma sprite PNG for the JUSToolkit import-komas
pipeline (offline custom-pixel route, see decomp/docs/NEW_KOMA.md).

Pipeline:
  1. python koma_art.py <exported_dtx4_png> <out_png>
     -> samples the palette colors used by the original koma art and draws a
        custom design into the 48x48 cell at (0,0) of a 240x192 canvas
        (5x4 board x 48 px, matching JUSToolkit's Dtx4ToBitmap export layout).
  2. JUS.CLI jus graphics import-komas --png <out_png> --dtx dt_00.dtx
     --koma koma.bin --kshape kshape.bin --output <dir>
     -> produces the replacement .dtx (fixed-palette quantization to the
        original sprite palette).

The default design is a rounded card with a blocky "Z" (koma 870 = ＺＯＯ).
"""

from __future__ import annotations

import argparse
import sys
from pathlib import Path

from PIL import Image, ImageDraw

try:
    sys.stdout.reconfigure(encoding="utf-8")
except Exception:
    pass

CANVAS_W, CANVAS_H = 240, 192  # 5 cols x 4 rows of 48 px
CELL = 48

# 5x7 bitmap font for the glyph (rows of 5 bits).
FONT_Z = [
    0b11111,
    0b00001,
    0b00010,
    0b00100,
    0b01000,
    0b10000,
    0b11111,
]
FONT_O = [
    0b01110,
    0b10001,
    0b10001,
    0b10001,
    0b10001,
    0b10001,
    0b01110,
]


def palette_colors(img: Image.Image) -> list[tuple[int, int, int]]:
    """Distinct opaque colors used in the 48x48 cell at (0,0), by frequency."""
    cell = img.convert("RGBA").crop((0, 0, CELL, CELL))
    hist: dict[tuple[int, int, int], int] = {}
    for px in cell.getdata():
        r, g, b, a = px
        if a < 128:
            continue
        hist[(r, g, b)] = hist.get((r, g, b), 0) + 1
    return [c for c, _ in sorted(hist.items(), key=lambda kv: -kv[1])]


def luminance(c: tuple[int, int, int]) -> int:
    return c[0] * 2 + c[1] * 5 + c[2]


def draw_glyph(canvas: Image.Image, glyph_rows: list[int], scale: int,
               ox: int, oy: int, color: tuple[int, int, int, int]) -> None:
    draw = ImageDraw.Draw(canvas)
    for y, row in enumerate(glyph_rows):
        for x in range(5):
            if row & (1 << (4 - x)):
                draw.rectangle(
                    (ox + x * scale, oy + y * scale,
                     ox + (x + 1) * scale - 1, oy + (y + 1) * scale - 1),
                    fill=color)


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("src", help="exported DTX4 PNG (240x192) to sample palette from")
    ap.add_argument("out", help="output custom-art PNG (240x192)")
    args = ap.parse_args()

    src = Image.open(args.src).convert("RGBA")
    if src.size != (CANVAS_W, CANVAS_H):
        print(f"[!] source PNG is {src.size}, expected {CANVAS_W}x{CANVAS_H}",
              file=sys.stderr)
        return 1

    colors = palette_colors(src)
    print(f"palette candidates (opaque, by frequency): "
          f"{['#%02X%02X%02X' % c for c in colors[:8]]}")
    if len(colors) >= 2:
        bg = colors[0]
        ink = min(colors, key=luminance)
        ink = ink if ink != bg else max(colors, key=luminance)
    else:
        bg = colors[0] if colors else (255, 255, 255)
        ink = (0, 0, 0)
    print(f"card bg={bg} ink={ink}")

    canvas = Image.new("RGBA", (CANVAS_W, CANVAS_H), (0, 0, 0, 0))
    draw = ImageDraw.Draw(canvas)
    # rounded card inside the 48x48 cell
    draw.rounded_rectangle((3, 3, CELL - 3, CELL - 3), radius=6, fill=bg + (255,))
    # blocky Z, scale 5 -> 25x35, centered at (11,6)
    draw_glyph(canvas, FONT_Z, 5, 11, 6, ink + (255,))
    canvas.save(args.out)
    print(f"wrote {args.out}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
