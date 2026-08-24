#!/usr/bin/env python3
"""infoname_check.py — determine what infoname.bin indexes (vs koma NTbls)."""
from __future__ import annotations

import json
import struct
import sys
from pathlib import Path

sys.stdout.reconfigure(encoding="utf-8")

db = json.load(open("data/koma_db.json", encoding="utf-8"))
d = Path("extract/files/bin/infoname.bin").read_bytes()

names = []
(cnt,) = struct.unpack_from("<I", d, 0)
cnt //= 4
for i in range(cnt):
    p = i * 4
    (rel,) = struct.unpack_from("<i", d, p)
    off = p + rel
    e = d.index(b"\x00", off)
    names.append(d[off:e].decode("shift_jis"))

by_name: dict[str, set[int]] = {}
for k in db["komas"]:
    by_name.setdefault(k["name_jp"], set()).add(k["ntbl"])

supp_by_name: dict[str, set[int]] = {}
for i, c in enumerate(db["support_characters"]):
    supp_by_name.setdefault(c["name"], set()).add(i)

print(f"infoname entries: {len(names)}")
for i, nm in enumerate(names):
    print(i, nm, "koma_ntbl:", sorted(by_name.get(nm, ["-"])),
          "supp_idx:", sorted(supp_by_name.get(nm, ["-"])))
