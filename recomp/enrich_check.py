#!/usr/bin/env python3
"""enrich_check.py — verify external-CSV enrichment correctness."""
from __future__ import annotations

import json
import sys
from collections import defaultdict

sys.stdout.reconfigure(encoding="utf-8")
db = json.load(open("data/koma_db.json", encoding="utf-8"))

print("== anchor spot checks ==")
for kid in (0, 1, 2, 3, 823, 824, 830, 497, 506, 604, 607, 450, 453, 722):
    k = db["komas"][kid]
    print(f"{kid:3d} {k['name_jp']:<12} -> {k.get('name_en', '??'):<20} "
          f"{k.get('series_en', '??'):<22} {k.get('variant', '??')} "
          f"nature={k.get('nature')}")

print("\n== variant conflicts ((group,elem) -> set of variant codes) ==")
by_shape = defaultdict(set)
for k in db["komas"]:
    if k.get("variant"):
        by_shape[(k["shape_group"], k["shape_element"])].add(k["variant"])
conf = {s: v for s, v in by_shape.items() if len(v) > 1}
for s, v in sorted(conf.items()):
    kids = [k["id"] for k in db["komas"]
            if (k["shape_group"], k["shape_element"]) == s]
    print(f"{s}: {sorted(v)}  komas={kids}")

print("\n== reverse check: same variant code -> multiple shapes? ==")
by_var = defaultdict(set)
for k in db["komas"]:
    if k.get("variant"):
        by_var[k["variant"]].add((k["shape_group"], k["shape_element"]))
for v, s in sorted(by_var.items()):
    if len(s) > 1:
        print(f"{v}: {sorted(s)}")
