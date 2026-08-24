#!/usr/bin/env python3
"""kizuna_appendix.py - append the full kizuna relation table to
plans/boost-ui-implementation.md (self-contained handoff)."""
from __future__ import annotations

import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
DOC = ROOT / "plans/boost-ui-implementation.md"

MARKER = "## 4. Acceptance checklist"
assert DOC.exists(), "handoff doc missing"

d = json.loads((ROOT / "data/kizuna.json").read_text(encoding="utf-8"))
lines = [
    "",
    "## Appendix — complete ally-boost relation table",
    "",
    "`battle_koma_ids` = the battle character's battle komas; `related` lists",
    "each related character with its **boost_koma_ids** (the help/support komas",
    "whose adjacency causes the sparkles).",
    "",
    "| Battle character | battle_koma_ids | related (name + boost_koma_ids) |",
    "|---|---|---|",
]
for r in d["relations"]:
    rels = ", ".join(f"{x['name_jp']} {x['boost_koma_ids']}"
                     for x in r["related"])
    lines.append(f"| {r['name_jp']} | {r['battle_koma_ids']} | {rels} |")
lines.append("")
lines.append(f"Excluded (no deck komas): {d.get('excluded_entries')}.")
lines.append("")

text = DOC.read_text(encoding="utf-8")
idx = text.find(MARKER)
assert idx >= 0, "marker missing in handoff doc"
head, tail = text[:idx], text[idx:]
DOC.write_text(head + "\n".join(lines) + tail, encoding="utf-8")
print(f"appended {len(d['relations'])} rows to {DOC.relative_to(ROOT)}")
