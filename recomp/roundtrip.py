#!/usr/bin/env python3
"""roundtrip.py — verify the fixed dtx4_mod write path: paint a known pattern
onto es_00.dtx, then decode it with the verified layout (strip tiles 1..36,
row-major, left pixel = low nibble) and compare against the expected image."""
from __future__ import annotations

import sys
from pathlib import Path

from PIL import Image, ImageDraw

sys.path.insert(0, "tools/scripts")
from dtx4_mod import Dtx4, unpack555  # noqa: E402

DTX = Path("recomp/koma_aar/koma/es_00.dtx")
OUT = Path("recomp/roundtrip.dtx")


def expected() -> Image.Image:
    img = Image.new("RGBA", (48, 48), (0, 0, 0, 0))
    d = ImageDraw.Draw(img)
    d.rectangle((4, 4, 43, 43), fill=(255, 0, 0, 255))
    d.rectangle((20, 0, 27, 47), fill=(0, 255, 0, 255))
    return img


def main() -> int:
    exp = expected()
    exp.save("recomp/roundtrip_expected.png")

    dtx = Dtx4(DTX.read_bytes())
    # replicate paint-png write path (46x44 center at (1,2) not needed here;
    # use the full 48x48 canvas path with alpha -> 0)
    px_in = exp.load()
    alpha = [[px_in[x, y][3] >= 128 for x in range(48)] for y in range(48)]
    # simple palette: idx1 = red, idx2 = green
    idx = [[0] * 48 for _ in range(48)]
    for y in range(48):
        for x in range(48):
            if alpha[y][x]:
                idx[y][x] = 1 if px_in[x, y][:3] == (255, 0, 0) else 2
    wt, ht, ti = dtx.segments[0]
    for ty in range(ht):
        for tx in range(wt):
            tile = ti + 1 + ty * wt + tx
            px: list[int] = [0] * 64
            for by in range(8):
                for bx in range(8):
                    gx, gy = tx * 8 + bx, ty * 8 + by
                    if gx < 48 and gy < 48:
                        px[by * 8 + bx] = idx[gy][gx]
            dtx.set_tile_pixels(tile, px)
    dtx.set_palette_color(0, 1, (255, 0, 0))
    dtx.set_palette_color(0, 2, (0, 255, 0))
    OUT.write_bytes(bytes(dtx.data))

    # decode with the verified layout
    dtx2 = Dtx4(OUT.read_bytes())
    got = Image.new("RGB", (48, 48))
    gp = got.load()
    for i in range(36):
        tx, ty = i % 6, i // 6
        base = dtx2.pixels_start + (1 + i) * 32
        for y in range(8):
            for x in range(0, 8, 2):
                b = dtx2.data[base + y * 4 + x // 2]
                left, right = b & 0x0F, b >> 4
                gp[tx * 8 + x, ty * 8 + y] = unpack555(dtx2.palettes[0][left])
                gp[tx * 8 + x + 1, ty * 8 + y] = unpack555(dtx2.palettes[0][right])
    got.save("recomp/roundtrip_got.png")

    mismatches = 0
    for y in range(48):
        for x in range(48):
            e = exp.getpixel((x, y))
            if e[3] >= 128:
                # BGR555 quantization of the expected color
                q = tuple((v >> 3) << 3 for v in e[:3])
                if got.getpixel((x, y)) != q:
                    mismatches += 1
    print(f"roundtrip mismatches: {mismatches}/2304 "
          f"{'PASS' if mismatches == 0 else 'FAIL'}")
    return 0 if mismatches == 0 else 1


if __name__ == "__main__":
    raise SystemExit(main())
