#!/usr/bin/env python3
"""
assist_solve.py — crack the L/R assist bits in deck slot flags.

Owner: L/R assist shortcuts attach to 2- and 3-tile SUPPORT komas; at most one
L and one R per deck. Corpus stats show flags bits 13/14 (0x2000/0x4000)
~100 occurrences each (0x8000 never). Which bit is L vs R needs a semantic
signal (disassembly or live oracle); this script establishes the structural
facts and per-id usage.
"""
from __future__ import annotations

import json
import struct
import sys
from collections import Counter, defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
DB_PATH = ROOT / "data/koma_db.json"
DECK_DIR = ROOT / "extract/deck_extracted/deck"

BIT_L, BIT_R = 0x2000, 0x4000


def main() -> int:
    db = json.loads(DB_PATH.read_text(encoding="utf-8"))
    by_id = {k["id"]: k for k in db["komas"]}

    per_tiles = defaultdict(Counter)          # tiles -> bit -> count
    per_id = defaultdict(Counter)             # kid -> bit -> count
    per_deck = []                             # (file, {bit: count})
    both_slots = []                           # slots with 0x2000|0x4000
    deck_violations = []                      # decks with >1 of a bit
    n_decks = 0

    for path in sorted(DECK_DIR.rglob("*.bin")):
        rec = path.read_bytes()
        if len(rec) != 0x5C:
            continue
        n_decks += 1
        cnt = Counter()
        for i in range(16):
            off = i * 4
            kid, fl = struct.unpack_from("<HH", rec, off)
            if kid == 0xFFFF or kid not in by_id:
                continue
            tiles = by_id[kid]["tiles"]
            for bit, name in ((BIT_L, "L"), (BIT_R, "R")):
                if fl & bit:
                    per_tiles[tiles][name] += 1
                    per_id[kid][name] += 1
                    cnt[name] += 1
            if (fl & (BIT_L | BIT_R)) == (BIT_L | BIT_R):
                both_slots.append((str(path.relative_to(ROOT)), kid, tiles, fl))
        per_deck.append((str(path.relative_to(ROOT)), dict(cnt)))
        if cnt["L"] > 1 or cnt["R"] > 1:
            deck_violations.append((str(path.relative_to(ROOT)), dict(cnt)))

    print(f"decks parsed: {n_decks}")
    print("\nbit occurrences by koma tiles (L=0x2000, R=0x4000):")
    for tiles in sorted(per_tiles):
        print(f"  tiles={tiles}: {dict(per_tiles[tiles])}")
    print(f"\nslots with BOTH bits set: {len(both_slots)}")
    for s in both_slots[:20]:
        print("  ", s)
    print(f"\ndecks with >1 of the same bit: {len(deck_violations)}")
    for f, c in deck_violations[:20]:
        print("  ", f, c)
    print(f"\ndecks with both L and R: "
          f"{sum(1 for _, c in per_deck if c.get('L') and c.get('R'))}")

    print("\nper-id usage (kid, tiles, type, L-count, R-count):")
    for kid in sorted(per_id):
        k = by_id[kid]
        print(f"  {kid:3d} tiles={k['tiles']} {k['koma_type']:<7} "
              f"{k['name_jp']:<14} L={per_id[kid]['L']} R={per_id[kid]['R']}")

    # what types ever carry the bits
    types = defaultdict(set)
    for kid in per_id:
        types[by_id[kid]["koma_type"]].add(kid)
    print("\nkoma types carrying assist bits:", {t: len(s) for t, s in types.items()})
    return 0


if __name__ == "__main__":
    sys.stdout.reconfigure(encoding="utf-8")
    raise SystemExit(main())
