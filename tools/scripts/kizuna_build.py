#!/usr/bin/env python3
"""
kizuna_build.py — extract the ally-boost (kizuna) relationship data.

Source: koma_db.json "battle_characters" (harvested from chr_b_t.bin).
Each battle character entry carries:
    "unk": [r1, r2, r3]   — up to 3 related characters, given as their 1-koma
                            (help) koma id (validated against the owner's
                            confirmed combos: Jotaro->[Josuke, Jolyne],
                            Goku->[Gohan, Arale], Naruto->[Sakura, Gaara,
                            Jiraiya]).
    "interactions": [6 lines] — 2 dialog lines per relation.

The game computes the boost at deck time: when any koma of a related
character (support or help) touches the battle character's koma, golden
sparkles appear and the battle character is boosted. No deck-record flag is
involved.

Entry -> battle-koma assignment (3 passes):
  1. majority vote over the entry's battle komas (koma_ids), fallback to a
     difflib name match among battle komas;
  2. series vote over the entry's relation ids (claims the only unassigned
     battle character of that series — e.g. 両津勘吉/坂田銀時);
  3. per-koma name clustering within the relation series (variant characters:
     超サイヤ人悟空, ルフィ（ギア２）, 卍解, ...).

Output: data/kizuna.json
    relations: per battle character -> related characters (koma-id groups +
               dialog lines)
    battle_koma_boost: flat battle-koma-id -> related support/help koma ids
"""
from __future__ import annotations

import difflib
import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
DB_PATH = ROOT / "data/koma_db.json"
OUT_PATH = ROOT / "data/kizuna.json"


def main() -> int:
    db = json.loads(DB_PATH.read_text(encoding="utf-8"))
    by_id = {k["id"]: k for k in db["komas"]}

    def char_id(kid: int) -> int:
        return by_id[kid]["unk"][0]

    groups: dict[int, list[int]] = {}
    for k in db["komas"]:
        groups.setdefault(char_id(k["id"]), []).append(k["id"])
    for cid in groups:
        groups[cid].sort()

    entries = db["battle_characters"]
    assigned: set[int] = set()
    resolved: dict[int, int] = {}

    def name_cluster(entry_name: str, series: set[str] | None) -> list[int]:
        """Battle komas whose name best-matches the entry, same name cluster."""
        cands = [k for k in db["komas"] if k["koma_type"] == "battle"
                 and (series is None or k["series"] in series)]
        if not cands:
            return []
        bestr = max(difflib.SequenceMatcher(a=entry_name,
                                            b=k["name_jp"]).ratio()
                    for k in cands)
        if bestr < 0.35:
            return []
        matched = [k for k in cands
                   if difflib.SequenceMatcher(a=entry_name,
                                              b=k["name_jp"]).ratio()
                   >= bestr - 0.05]
        return sorted(k["id"] for k in matched)

    def entry_resolve(entry: dict) -> tuple[int | None, list[int]]:
        """-> (char_id or None, own battle koma ids)."""
        kids = [i for i in entry.get("koma_ids", [])
                if i in by_id and by_id[i]["koma_type"] == "battle"]
        if kids:
            votes: dict[int, int] = {}
            for i in kids:
                c = char_id(i)
                votes[c] = votes.get(c, 0) + 1
            cid = max(votes, key=lambda c: (votes[c], -c))
            return cid, sorted(i for i in groups[cid]
                               if by_id[i]["koma_type"] == "battle")
        cluster = name_cluster(entry["name"], None)
        if cluster:
            return char_id(cluster[0]), cluster
        return None, []

    own_map: dict[int, list[int]] = {}
    excluded: list[str] = []

    # Manual overrides: variant/enhanced forms whose battle komas are known
    # (their koma_ids in the harvest are polluted by name-join overreach and
    # they share the char id with the base form). Empty list = no deck komas
    # (encyclopedia/cheat-only entries, per owner).
    MANUAL: dict[str, list[int]] = {
        "超サイヤ人孫悟空": [456, 457],
        "超サイヤ人ベジータ": [463, 464, 465],
        "超サイヤ人孫悟飯": [469],
        "超サイヤ人２孫悟飯": [470],
        "超サイヤ人ゴテンクス": [475, 476],
        "ベジット": [458],
        "ルフィ（ギア２）": [827, 828],
        "うずまきナルト（九尾）": [504, 505],
        "麻倉葉（ＯＳ白鵠）": [251],
        "黒崎一護（卍解）": [610, 611],
        "真説ボーボボ": [696],
        "怒んパッチ": [703],
        "ペガサス星矢（射手座の黄金聖衣）": [330],
        "両津勘吉": [168, 169, 170, 171, 172],
        "ナミ（完璧天候棒）": [842],
        "Ｄｒ．マシリト（ボス）": [],
    }

    # pass 0: manual overrides
    for idx, entry in enumerate(entries):
        if entry["name"] not in MANUAL:
            continue
        kids = MANUAL[entry["name"]]
        if not kids:
            excluded.append(entry["name"])
            resolved[idx] = -2
            continue
        cid = char_id(kids[0])
        assigned.add(cid)
        resolved[idx] = cid
        own_map[idx] = kids

    # pass 1: koma_ids vote, else global name cluster
    for idx, entry in enumerate(entries):
        if idx in resolved:
            continue
        cid, own = entry_resolve(entry)
        if cid is not None and cid not in assigned:
            assigned.add(cid)
            resolved[idx] = cid
            own_map[idx] = own

    # pass 2 (was 3): name clustering restricted to the relation series
    covered_own = {b for e in own_map.values() for b in e}
    for idx, entry in enumerate(entries):
        if idx in resolved:
            continue
        rel_ids = [u for u in entry.get("unk", []) if u > 0 and u in by_id]
        if not rel_ids:
            continue
        series = {by_id[r]["series"] for r in rel_ids}
        kids = [i for i in name_cluster(entry["name"], series)
                if i not in covered_own]
        if kids:
            own_map[idx] = sorted(kids)
            resolved[idx] = -1  # marker: use own_map
            covered_own.update(kids)

    # pass 3 (was 2): series vote among remaining unassigned chars
    for idx, entry in enumerate(entries):
        if idx in resolved:
            continue
        rel_ids = [u for u in entry.get("unk", []) if u > 0 and u in by_id]
        if not rel_ids:
            continue
        series = {by_id[r]["series"] for r in rel_ids}
        cands = {char_id(k["id"]) for k in db["komas"]
                 if k["series"] in series
                 and k["koma_type"] == "battle"} - assigned
        if len(cands) == 1:
            cid = cands.pop()
            assigned.add(cid)
            resolved[idx] = cid
            own_map[idx] = [i for i in groups[cid]
                            if by_id[i]["koma_type"] == "battle"]

    def build_rels(entry: dict) -> list[dict]:
        rel_ids = [u for u in entry.get("unk", []) if u > 0 and u in by_id]
        rels = []
        for j, r in enumerate(rel_ids):
            rc = char_id(r)
            rels.append({
                "anchor_id": r,
                "char_id": rc,
                "name_jp": by_id[r]["name_jp"],
                "koma_ids": groups[rc],
                "boost_koma_ids": [i for i in groups[rc]
                                   if by_id[i]["koma_type"] in
                                   ("help", "support")],
                "lines": entry.get("interactions", [])[j * 2:j * 2 + 2],
            })
        return rels

    relations = []
    battle_koma_boost: dict[str, list[int]] = {}
    unmatched: list[str] = []

    for idx, entry in enumerate(entries):
        rels = build_rels(entry)
        if not rels:
            continue
        if resolved.get(idx) == -2:
            continue  # no deck komas (already in excluded)
        if idx in own_map:
            own_battles = own_map[idx]
            cid = resolved[idx] if resolved.get(idx, -1) >= 0 else None
        else:
            unmatched.append(entry["name"])
            continue
        relations.append({
            "name_jp": entry["name"],
            "char_id": cid,
            "battle_koma_ids": own_battles,
            "related": rels,
        })
        for b in own_battles:
            flat = sorted({i for rel in rels for i in rel["boost_koma_ids"]})
            battle_koma_boost[str(b)] = flat

    total_battles = sum(1 for k in db["komas"]
                        if k["koma_type"] == "battle")

    def rel_names(name_sub: str) -> list[list[str]]:
        out = []
        for r in relations:
            if name_sub in r["name_jp"]:
                out.append([x["name_jp"] for x in r["related"]])
        return out

    out = {
        "game": "Jump Ultimate Stars",
        "generated_by": "tools/scripts/kizuna_build.py",
        "source": "koma_db.json battle_characters (chr_b_t.bin)",
        "rule": ("ally boost: a related character's support/help koma placed "
                 "orthogonally adjacent to the battle character's koma gives "
                 "a boost (golden sparkles in the deck builder). Computed "
                 "from adjacency; no deck-record flag."),
        "validated": {
            "jotaro": rel_names("空条承太郎"),
            "goku": rel_names("孫悟空"),
            "naruto": rel_names("うずまきナルト"),
        },
        "relations": relations,
        "battle_koma_boost": battle_koma_boost,
        "unmatched_entries": unmatched,
        "excluded_entries": excluded,
    }
    OUT_PATH.write_text(json.dumps(out, ensure_ascii=False, indent=1),
                        encoding="utf-8")
    print(f"wrote {OUT_PATH.relative_to(ROOT)}: "
          f"{len(relations)} battle characters, "
          f"{len(battle_koma_boost)}/{total_battles} battle komas covered, "
          f"unmatched={unmatched}")
    print("validation:")
    print("  jotaro ->", rel_names("空条承太郎"))
    print("  goku   ->", rel_names("孫悟空"))
    print("  naruto ->", rel_names("うずまきナルト"))
    return 0


if __name__ == "__main__":
    sys.stdout.reconfigure(encoding="utf-8")
    raise SystemExit(main())
