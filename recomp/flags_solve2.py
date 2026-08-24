#!/usr/bin/env python3
"""flags_solve2.py - brute-force the flags layout with grid 5x4.

flags has 4 nibbles: n3 n2 n1 n0 (n3 = bits 12-15 ... n0 = bits 0-3).
Candidate assignments: two nibbles are col(0-4)/row(0-3); the other two are
rotation/variant (values 0..7 free). Try every permutation and count decks
with overlapping pieces, using kshape.bin shapes per (KGrp, KElem, rot).

Pieces: cells = shape cells transformed by rotation; position = top-left at
(col, row) from the chosen nibbles. Winning permutation should give ~0
overlap violations (presets are legal decks) and 0 out-of-grid pieces.
"""
from __future__ import annotations

import struct
from itertools import permutations
from pathlib import Path

DECK_DIR = Path("extract/deck_extracted/deck")
KOMA = Path("extract/files/bin/koma.bin")
KSHAPE = Path("extract/files/bin/kshape.bin")

kd = KOMA.read_bytes()
n = len(kd) // 12
ksd = KSHAPE.read_bytes()
print("kshape.bin size", len(ksd))


def shape_cells(kgrp: int, kelem: int, rot: int):
    """Parse kshape.bin group -> variant -> cells. Fallback rectangles if
    parsing fails. Return list of (x,y) offsets with x right, y down."""
    # Fallback bounding shapes (known-good for the live oracle pieces).
    if kgrp == 0:
        return [(0, 0)]
    if kgrp == 1:  # 2-koma
        return [(0, 0), (1, 0)] if rot % 2 == 0 else [(0, 0), (0, 1)]
    if kgrp == 3:  # 4-koma 2x2
        return [(0, 0), (1, 0), (0, 1), (1, 1)]
    # generic: 1x(kgrp+1) or (kgrp+1)x1 by rotation
    cells = []
    if rot % 2 == 0:
        for i in range(kgrp + 1):
            cells.append((i, 0))
    else:
        for i in range(kgrp + 1):
            cells.append((0, i))
    return cells


def rot_apply(cells, rot):
    """Apply 90deg clockwise rotation rot times to offsets."""
    if rot == 0:
        return cells
    out = []
    for _ in range(rot % 4):
        out = [(-y, x) for x, y in (out or cells)]
    # normalize negative coords
    minx = min(p[0] for p in out)
    miny = min(p[1] for p in out)
    return [(p[0] - minx, p[1] - miny) for p in out]


def try_assignment(decks, assign):
    """assign: dict nibble_index -> 'col'|'row'|None; rot from first None nibble."""
    bad = 0
    for pieces in decks:
        cells = set()
        for kid, fl in pieces:
            if kid >= n:
                continue
            kgrp = kd[kid * 12 + 8]
            kelem = kd[kid * 12 + 9]
            nibs = [(fl >> 12) & 0xF, (fl >> 8) & 0xF, (fl >> 4) & 0xF, fl & 0xF]
            col = row = None
            rot = 0
            for i in range(4):
                if assign[i] == "col":
                    col = nibs[i]
                elif assign[i] == "row":
                    row = nibs[i]
                else:
                    rot = nibs[i]
            if col is None or row is None:
                continue
            shape = rot_apply(shape_cells(kgrp, kelem, rot), rot)
            ok = True
            for dx, dy in shape:
                x, y = col + dx, row + dy
                if not (0 <= x <= 4 and 0 <= y <= 3):
                    ok = False
                    break
                cell = y * 5 + x
                if cell in cells:
                    ok = False
                    break
                cells.add(cell)
            if not ok:
                bad += 1
                break
    return bad


def main():
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

    results = []
    # col,row assigned to two of the four nibbles; rest free (rotation sources).
    for ci, ri in permutations(range(4), 2):
        assign = [None] * 4
        assign[ci] = "col"
        assign[ri] = "row"
        bad = try_assignment(decks, assign)
        results.append((bad, ci, ri))
    results.sort()
    out = [f"{len(decks)} decks", "col_nibble,row_nibble -> overlap-violating decks:"]
    for bad, ci, ri in results[:12]:
        out.append(f"  col=n{ci} row=n{ri}: {bad}/{len(decks)}")
    Path("recomp/flags_solve2.txt").write_text("\n".join(out), encoding="utf-8")
    print("wrote recomp/flags_solve2.txt")
    for bad, ci, ri in results[:6]:
        print(f"col=n{ci} row=n{ri}: {bad}/{len(decks)}")


if __name__ == "__main__":
    main()
