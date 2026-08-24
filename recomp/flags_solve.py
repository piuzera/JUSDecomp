#!/usr/bin/env python3
"""flags_solve.py - crack the slot flags placement encoding.

Each deck slot = {koma_id u16, flags u16}. koma size = KGrp+1 cells.
Hypothesis space: flags = (A << 8) | (B << 4) | C with A,B,C nibbles, where
two of the nibbles are grid coordinates (grid 4x5 or 5x4) and the remaining
nibble is rotation/misc. Valid decks have non-overlapping pieces.

Strategy: for each candidate interpretation of (coordinate nibbles), compute each
piece's occupied cells (rectangle w*h with rotations ignored for squares,
domino rotations vertical/horizontal by rot parity) and count decks with NO
overlap. The correct interpretation should have ~zero overlap violations while
wrong ones have many.
"""
from __future__ import annotations

import struct
from pathlib import Path

DECK_DIR = Path("extract/deck_extracted/deck")
KOMA = Path("extract/files/bin/koma.bin")
kd = KOMA.read_bytes()
n = len(kd) // 12

# Load kshape shapes to know piece bounding boxes.
# kshape.bin: 8 groups; we only need size in cells = KGrp+1 and its rectangle.
# Common shapes: 1->1x1, 2->1x2 or 2x1 (rot), 3->1x3? / L, 4->2x2, 5->?, 6->2x3, 8->2x4.
# We'll use bounding box by group and handle rot parity where shape is symmetric
# (domino 2: rot 0/2 horizontal 2x1, 1/3 vertical 1x2).

# For the experiment we care about 4-komas (2x2). But validate broadly with
# bounding boxes per (KGrp, rot parity).

def bbox(kgrp: int, rot: int):
    """Return (w, h) cells occupied by a piece of group kgrp, rotation rot."""
    if kgrp == 0:  # 1-koma
        return 1, 1
    if kgrp == 1:  # 2-koma domino
        return (2, 1) if rot % 2 == 0 else (1, 2)
    if kgrp == 2:  # 3-koma
        return (3, 1) if rot % 2 == 0 else (1, 3)
    if kgrp == 3:  # 4-koma 2x2
        return 2, 2
    if kgrp == 4:  # 5-koma?
        return (3, 2) if rot % 2 == 0 else (2, 3)
    if kgrp == 5:  # 6-koma 2x3
        return (3, 2) if rot % 2 == 0 else (2, 3)
    if kgrp == 6:  # 7-koma?
        return (4, 2) if rot % 2 == 0 else (2, 4)
    if kgrp == 7:  # 8-koma 2x4
        return (4, 2) if rot % 2 == 0 else (2, 4)
    return 1, 1


def try_layout(deck_count, decks, gw, gh, axis_mode, rot_nibble):
    """axis_mode: which nibble is which. Returns #overlap-violating decks."""
    bad = 0
    for pieces in decks:
        cells = set()
        ok = True
        for kid, fl in pieces:
            if kid >= n:
                continue
            kgrp = kd[kid * 12 + 8]
            hi = (fl >> 8) & 0xF
            mid = (fl >> 4) & 0xF
            lo = fl & 0xF
            if axis_mode == "hi-col":
                col, row = hi, mid
            elif axis_mode == "hi-row":
                row, col = hi, mid
            elif axis_mode == "mid-col":
                col, row = mid, lo
            else:  # mid-row
                row, col = mid, lo
            rot = {"hi": hi, "mid": mid, "lo": lo}[rot_nibble]
            w, h = bbox(kgrp, rot)
            if col + w > gw or row + h > gh:
                ok = False
                break
            for cy in range(row, row + h):
                for cx in range(col, col + w):
                    cell = cy * gw + cx
                    if cell in cells:
                        ok = False
                        break
                    cells.add(cell)
                if not ok:
                    break
            if not ok:
                break
        if not ok:
            bad += 1
    return bad


def main() -> None:
    decks = []
    for path in sorted(DECK_DIR.rglob("*.bin")):
        rec = path.read_bytes()
        if len(rec) != 0x5C:
            continue
        pieces = []
        for i in range(16):
            off = i * 4
            kid, fl = struct.unpack_from("<HH", rec, off)
            if kid != 0xFFFF and kid < n:
                pieces.append((kid, fl))
        if pieces:
            decks.append(pieces)

    out = [f"{len(decks)} preset decks with pieces"]
    for gw, gh in ((4, 5), (5, 4)):
        for axis in ("hi-col", "hi-row", "mid-col", "mid-row"):
            for rot_nib in ("hi", "mid", "lo"):
                bad = try_layout(len(decks), decks, gw, gh, axis, rot_nib)
                out.append(f"grid {gw}x{gh} axis={axis} rot={rot_nib}: "
                           f"{bad}/{len(decks)} decks overlap-violating")
    Path("recomp/flags_solve.txt").write_text("\n".join(out), encoding="utf-8")
    print("wrote recomp/flags_solve.txt")


if __name__ == "__main__":
    main()
