#!/usr/bin/env python3
"""kizuna_debug.py - inspect the 3 unmatched kizuna entries."""
from __future__ import annotations

import difflib
import json
import sys
from pathlib import Path

sys.stdout.reconfigure(encoding="utf-8")
db = json.loads(Path("data/koma_db.json").read_text(encoding="utf-8"))
by = {k["id"]: k for k in db["komas"]}

for name in ("両津勘吉", "超サイヤ人２孫悟飯", "Ｄｒ．マシリト（ボス）"):
    for e in db["battle_characters"]:
        if e["name"] == name:
            print("==", e["name"], "unk=", e["unk"], "koma_ids=", e["koma_ids"])
            rel = [u for u in e["unk"] if u > 0]
            series = {by[r]["series"] for r in rel}
            print("   rel komas:", [(r, by[r]["name_jp"], by[r]["series"]) for r in rel])
            print("   series:", series)
            cands = [k for k in db["komas"]
                     if k["koma_type"] == "battle" and k["series"] in series]
            print("   series battle komas:",
                  [(k["id"], k["name_jp"], k["unk"][0]) for k in cands])
            scored = sorted(((difflib.SequenceMatcher(a=e["name"], b=k["name_jp"]).ratio(), k)
                             for k in db["komas"] if k["koma_type"] == "battle"),
                            key=lambda t: -t[0])[:6]
            print("   global best battle matches:",
                  [(r, k["id"], k["name_jp"], k["series"]) for r, k in scored])
            break
