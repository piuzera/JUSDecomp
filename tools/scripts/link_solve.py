#!/usr/bin/env python3
"""
link_solve.py — crack the 1-koma link nibble (flags bits 8-11) semantics.

Known anchors:
  - flags = (leader << 12) | (link_nibble << 8) | (row << 4) | col
  - link nibble values observed in the preset corpus: {1, 2, 3, 4} only
    (see koma_db.json stats.link_nibbles: 1x68, 2x107, 3x116, 4x174)
  - Live anchor (2026-08-22): Sena 1K at (0,0), Luffy 4K leader at (0,1);
    Sena's flags = 0x0400 -> nibble 4 = "arrow points right toward the battle
    koma". Hypothesis: nibble is a direction enum {1:up, 2:down, 3:left, 4:right}.

Strategy:
  1. Reconstruct every preset deck's board from koma_db shape masks.
  2. For every 1-tile (help) koma with nibble 1-4, compute the set of
     directions in which a battle koma (4-8 tiles) is orthogonally adjacent
     (and separately, the set toward ANY koma).
  3. Score all 24 nibble->direction permutations against those observations;
     the correct mapping should explain ~100% of them.
  4. Cross-tab koma.bin / komatxt.bin unknown fields against "ever linked"
     to classify linkability for all 890 komas.
  5. Emit data/koma_linkable.json (for tooling + the web deck builder) and a
     text report recomp/link_solve.txt.
"""
from __future__ import annotations

import itertools
import json
import struct
import sys
from collections import Counter, defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
DB_PATH = ROOT / "data/koma_db.json"
DECK_DIR = ROOT / "extract/deck_extracted/deck"
OUT_TXT = ROOT / "recomp/link_solve.txt"
OUT_JSON = ROOT / "data/koma_linkable.json"

BOARD_COLS, BOARD_ROWS = 5, 4
# nibble -> direction name (dRow, dCol) candidates
DIRS = {
    "up": (-1, 0),
    "down": (1, 0),
    "left": (0, -1),
    "right": (0, 1),
}


def load_db() -> dict:
    db = json.loads(DB_PATH.read_text(encoding="utf-8"))
    by_id = {k["id"]: k for k in db["komas"]}
    return db, by_id


def shape_cells(koma: dict) -> list[tuple[int, int]]:
    """Offsets (r, c) of each filled cell from the koma's shape mask."""
    return [(r, c) for r in range(BOARD_ROWS) for c in range(BOARD_COLS)
            if koma["shape"][r][c] == "#"]


def load_decks(by_id: dict) -> list[tuple[str, list[tuple[int, int]]]]:
    """-> list of (deck_file, [(kid, flags), ...])"""
    decks = []
    for path in sorted(DECK_DIR.rglob("*.bin")):
        rec = path.read_bytes()
        if len(rec) != 0x5C:
            continue
        pieces = []
        for i in range(16):
            off = i * 4
            kid, fl = struct.unpack_from("<HH", rec, off)
            if kid != 0xFFFF and kid in by_id:
                pieces.append((kid, fl))
        if pieces:
            decks.append((str(path.relative_to(ROOT)), pieces))
    return decks


def analyze(decks: list[tuple[str, list[tuple[int, int]]]], by_id: dict):
    """Board reconstruction + link observations."""
    # observation = (nibble, battle_dir_set, any_dir_set, kid_owner_of_cell)
    obs: list[dict] = []
    overlap_decks = 0
    bad_rows = Counter()
    # unlinked (nibble==0) 1-tile komas: adjacency stats
    unlinked_adj: Counter = Counter()          # kid -> battle-adjacent count
    unlinked_notadj: Counter = Counter()       # kid -> not adjacent count

    for dfile, pieces in decks:
        board: dict[tuple[int, int], int] = {}
        ok = True
        for kid, fl in pieces:
            koma = by_id[kid]
            row, col = (fl >> 4) & 0xF, fl & 0xF
            for r, c in shape_cells(koma):
                rr, cc = row + r, col + c
                if rr >= BOARD_ROWS or cc >= BOARD_COLS:
                    bad_rows[(kid, fl)] += 1
                    ok = False
                    continue
                if (rr, cc) in board:
                    overlap_decks += 1
                    ok = False
                    continue
                board[(rr, cc)] = kid
        if not ok:
            continue  # skip corrupt/unexpected decks for adjacency stats

        for kid, fl in pieces:
            koma = by_id[kid]
            if koma.get("koma_type") != "help":
                continue
            nibble = (fl >> 8) & 0xF
            row, col = (fl >> 4) & 0xF, fl & 0xF
            battle_dir = set()
            any_dir = set()
            cell_owner: dict[str, int] = {}
            for dname, (dr, dc) in DIRS.items():
                nbr = board.get((row + dr, col + dc))
                if nbr is None:
                    continue
                cell_owner[dname] = nbr
                any_dir.add(dname)
                if by_id[nbr].get("koma_type") == "battle":
                    battle_dir.add(dname)
            if nibble in (1, 2, 3, 4):
                obs.append({
                    "deck": dfile, "kid": kid, "nibble": nibble,
                    "battle_dir": frozenset(battle_dir),
                    "any_dir": frozenset(any_dir),
                    "owner": cell_owner,
                })
            else:
                (unlinked_adj if battle_dir else unlinked_notadj)[kid] += 1
    return obs, overlap_decks, bad_rows, unlinked_adj, unlinked_notadj


def score_permutation(obs, mapping: dict[int, str], mode: str):
    """mode: 'battle' (target must be a battle koma) or 'any' (any koma)."""
    hits = 0
    misses = []
    for o in obs:
        d = mapping[o["nibble"]]
        dirset = o["battle_dir"] if mode == "battle" else o["any_dir"]
        if d in dirset:
            hits += 1
        else:
            misses.append(o)
    return hits, misses


def main() -> int:
    db, by_id = load_db()
    decks = load_decks(by_id)
    obs, overlap_decks, bad_rows, unlinked_adj, unlinked_notadj = \
        analyze(decks, by_id)

    lines: list[str] = []
    say = lines.append
    say(f"decks parsed: {len(decks)} (overlap-violating skipped: {overlap_decks})")
    say(f"linked 1-tile observations: {len(obs)}")
    if bad_rows:
        say(f"out-of-grid pieces: {dict(bad_rows)}")

    # --- 1. permutation search -------------------------------------------------
    say("\n== nibble->direction permutation search ==")
    ranked = []
    mode_results: dict[str, tuple] = {}
    for mode in ("battle", "any"):
        results = []
        for perm in itertools.permutations(["up", "down", "left", "right"]):
            mapping = {i + 1: d for i, d in enumerate(perm)}
            hits, misses = score_permutation(obs, mapping, mode)
            results.append((hits, mapping, misses))
        results.sort(key=lambda t: -t[0])
        best_hits, best_map, best_misses = results[0]
        mode_results[mode] = (best_hits, best_map, best_misses)
        say(f"[mode={mode}] best: {best_hits}/{len(obs)} hits  "
            f"mapping={best_map}")
        for hits, mapping, _ in results[1:4]:
            say(f"           {hits}/{len(obs)} hits  mapping={mapping}")
        ranked.append((mode, best_hits, best_map, best_misses))

    # --- 2. pick best mapping (any-adjacency wins if battle mode has misses) ---
    mode, best_hits, best_map, best_misses = max(
        ranked, key=lambda t: t[1])
    battle_hits, _, battle_misses = mode_results["battle"]
    say(f"\nbest mapping: {best_map} ({mode}-adjacency, "
        f"{best_hits}/{len(obs)} strict hits)")
    if mode != "battle" and battle_misses:
        say(f"NOTE: battle-only adjacency leaves {len(obs) - battle_hits} "
            f"unexplained - links whose target cell holds a NON-battle koma:")
        for o in battle_misses:
            own = {d: (k, by_id[k]["koma_type"], by_id[k]["tiles"])
                   for d, k in o["owner"].items()}
            say(f"  {o['deck']}: kid={o['kid']} nibble={o['nibble']} "
                f"pointed_dir={best_map[o['nibble']]} "
                f"any_adj={set(o['any_dir'])} owners={own}")
    say("counterexamples under best mapping:")
    for o in best_misses[:40]:
        say(f"  {o['deck']}: kid={o['kid']} nibble={o['nibble']} "
            f"battle_adj={set(o['battle_dir'])} any_adj={set(o['any_dir'])} "
            f"owners={o['owner']}")

    # --- 3. per-id aggregation -------------------------------------------------
    per_id: dict[int, dict] = defaultdict(
        lambda: {"linked": Counter(), "unlinked": 0, "never": True})
    for o in obs:
        pid = per_id[o["kid"]]
        pid["never"] = False
        pid["linked"][o["nibble"]] += 1
        pid.setdefault("dirs", Counter())[best_map[o["nibble"]]] += 1
    # mark 1-tile komas observed with nibble 0 (unlinked)
    for dfile, pieces in decks:
        for kid, fl in pieces:
            if by_id[kid].get("koma_type") != "help":
                continue
            if ((fl >> 8) & 0xF) == 0:
                per_id[kid]["unlinked"] += 1
                per_id[kid]["never"] = False

    linked_ids = sorted(k for k, v in per_id.items() if v["linked"])
    say(f"\n== unlinked 1-tile adjacency ==")
    say(f"unlinked komas battle-adjacent: {dict(sorted(unlinked_adj.items()))}")
    say(f"unlinked komas NOT battle-adjacent: "
        f"{dict(sorted(unlinked_notadj.items()))}")
    say(f"\n== per-id link stats ==")
    say(f"komas ever observed LINKED ({len(linked_ids)}):")
    for kid in linked_ids:
        k = by_id[kid]
        say(f"  {kid:3d} {k['name_jp']:<12} {k.get('name_en',''):<20} "
            f"nibbles={dict(per_id[kid]['linked'])} "
            f"unlinked_obs={per_id[kid]['unlinked']}")

    # --- 4. linkability via koma.bin / komatxt.bin unknown fields ---------------
    say("\n== unknown-field correlation (1-tile komas: linked vs unlinked-observed)")
    candidates = []
    for fname in ("unk", "komatxt_unk"):
        fmax = 5 if fname == "unk" else 2
        for fi in range(fmax):
            val_linked: dict[int, Counter] = defaultdict(Counter)
            for kid, k in by_id.items():
                if k.get("koma_type") != "help":
                    continue
                f = k[fname][fi]
                if kid in linked_ids:
                    val_linked[f]["linked"] += 1
                elif per_id[kid]["unlinked"]:
                    val_linked[f]["unlinked"] += 1
            # split quality: count values that are pure
            pure_vals = {v for v, c in val_linked.items()
                         if c["linked"] == 0 or c["unlinked"] == 0}
            n_vals = len(val_linked)
            candidates.append((fname, fi, pure_vals, val_linked, n_vals))
            say(f"  {fname}[{fi}]: {n_vals} distinct values, "
                f"{len(pure_vals)} pure; "
                f"dist={ {v: dict(c) for v, c in list(val_linked.items())[:12]} }")

    # pick the best discriminator: value present in >=2 distinct + pure + high coverage
    best_disc = None
    for fname, fi, pure_vals, val_linked, n_vals in candidates:
        for v in pure_vals:
            c = val_linked[v]
            if c["linked"] + c["unlinked"] < 3:
                continue
            is_link = c["linked"] > 0
            score = c["linked"] + c["unlinked"]
            if best_disc is None or score > best_disc[0]:
                best_disc = (score, fname, fi, v, is_link, dict(c))

    say(f"\nbest discriminator: {best_disc}")

    # --- 5. classification ------------------------------------------------------
    linkable_corpus = set(linked_ids)
    predicted_linkable: list[int] = []
    predicted_standalone: list[int] = []
    unknown_1k: list[int] = []
    for kid, k in by_id.items():
        if k.get("koma_type") != "help":
            continue
        if kid in linkable_corpus:
            continue
        if best_disc is not None:
            _, fname, fi, v, is_link, _ = best_disc
            if k[fname][fi] == v:
                (predicted_linkable if is_link else predicted_standalone).append(kid)
                continue
        unknown_1k.append(kid)

    say(f"\n== full 1-tile koma dump (id, unk, linked/unlinked obs) ==")
    say("id  name_jp  unk[0..4]  komatxt_unk  linked_nibbles  unlinked_obs")
    for kid in sorted(k for k, v in by_id.items()
                      if v.get("koma_type") == "help"):
        k = by_id[kid]
        pid = per_id[kid]
        say(f"{kid:3d} {k['name_jp']:<12} {k['unk']} {k['komatxt_unk']} "
            f"{dict(pid['linked'])} {pid['unlinked']}")

    say(f"\n== classification (1-tile komas) ==")
    say(f"linked in corpus:            {len(linkable_corpus)}")
    say(f"predicted linkable:          {len(predicted_linkable)}")
    say(f"predicted standalone:        {len(predicted_standalone)}")
    say(f"unknown:                     {len(unknown_1k)}")
    say(f"predicted linkable: {predicted_linkable}")
    say(f"predicted standalone: {predicted_standalone}")
    say(f"unknown: {unknown_1k}")
    say("\nclass B (linked-only observed): "
        f"{sorted(k for k in linkable_corpus if per_id[k]['unlinked'] == 0)}")
    say("class C (unlinked-only observed): "
        f"{sorted(k for k, v in per_id.items() if not v['linked'] and v['unlinked'])}")

    # --- 6. outputs --------------------------------------------------------------
    direction_enum = {str(n): d for n, d in best_map.items()}
    class_c = sorted(k for k, v in per_id.items()
                     if not v["linked"] and v["unlinked"])
    class_b = sorted(k for k in linkable_corpus
                     if per_id[k]["unlinked"] == 0)
    class_a = sorted(k for k in linkable_corpus
                     if per_id[k]["unlinked"] > 0)
    class_d = sorted(k for k, koma in by_id.items()
                     if koma.get("koma_type") == "help"
                     and per_id[k]["never"])
    class_c_names = {kid: by_id[kid]["name_jp"] for kid in class_c}
    class_c_adj = {kid: (unlinked_adj[kid], unlinked_notadj[kid])
                   for kid in class_c}
    say("\nclass C detail (never linked): "
        f"{class_c_names}")
    say("class C adjacency (adjacent, not-adjacent) counts: "
        f"{class_c_adj}")
    out_json = {
        "game": "Jump Ultimate Stars",
        "generated_by": "tools/scripts/link_solve.py",
        "direction_enum": direction_enum,
        "confidence": {
            "mode": mode,
            "strict_hits": best_hits,
            "total": len(obs),
            "anchor": "Sena@(0,0) nibble4 -> right toward Luffy@(0,1) (2026-08-22 live)",
        },
        "stats": {
            "decks": len(decks),
            "overlap_decks": overlap_decks,
            "linked_obs": len(obs),
        },
        "linkable_corpus": sorted(linkable_corpus),
        "linkable": sorted(set(linkable_corpus) | set(predicted_linkable)),
        "standalone_1k": class_c,
        "unknown_1k": class_d,
        "classes": {
            "A_link_optional": class_a,
            "B_linked_only_observed": class_b,
            "C_unlinked_only_observed": class_c,
            "D_never_in_corpus": class_d,
        },
        "discriminator": (list(best_disc) if best_disc else None),
        "per_id_linked": {str(kid): {
            "nibbles": dict(per_id[kid]["linked"]),
            "unlinked_obs": per_id[kid]["unlinked"],
            "name_jp": by_id[kid]["name_jp"],
            "name_en": by_id[kid].get("name_en"),
        } for kid in linked_ids},
        "per_id_standalone": {str(kid): {
            "name_jp": by_id[kid]["name_jp"],
            "name_en": by_id[kid].get("name_en"),
            "battle_adjacent_obs": unlinked_adj[kid],
            "not_adjacent_obs": unlinked_notadj[kid],
        } for kid in class_c},
        "notes": [
            "nibble values 1-4 = link direction enum; see direction_enum.",
            "linkable = observed linked in presets OR matching the discriminator "
            "pattern; standalone = matches the non-link discriminator pattern; "
            "unknown = no evidence either way.",
            "Adjacency rule: the cell in the direction the arrow points must be "
            "occupied by the linked battle koma.",
        ],
    }
    OUT_JSON.write_text(json.dumps(out_json, ensure_ascii=False, indent=1),
                        encoding="utf-8")
    OUT_TXT.write_text("\n".join(lines), encoding="utf-8")
    print(f"wrote {OUT_TXT.relative_to(ROOT)}")
    print(f"wrote {OUT_JSON.relative_to(ROOT)}")
    for line in lines:
        if (line.startswith("==") or line.startswith("class ")
                or line.startswith("best discriminator")
                or line.startswith("NOTE:")
                or line.startswith("decks parsed")
                or line.startswith("linked 1-tile")
                or line.startswith("[mode=")
                or line.startswith("best mapping")
                or line.startswith("komas ever")):
            print(line)
    return 0


if __name__ == "__main__":
    sys.stdout.reconfigure(encoding="utf-8")
    raise SystemExit(main())
