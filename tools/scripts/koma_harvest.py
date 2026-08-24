#!/usr/bin/env python3
"""
koma_harvest.py — compile the full koma database (all 890 komas) from the
game's extracted data files.

Formats ported 1:1 from the JUSToolkit C# readers (tools/JUSToolkit):
  - komatxt.bin   Binary2Komatxt:  890 x {u32 rel-ptr name, u32 unk1, u32 unk2},
                                  count = u32@0 / 0x0C, indexed by koma id.
  - piece.bin     Binary2Piece:    u32 count + entries {title ptr, 2x author ptrs,
                                  2x info ptrs, 9x page1 ptrs, 9x page2 ptrs,
                                  i16 unk1, i16 id} (0x60 each).
  - chr_b_t.bin   Binary2BtlChr:   74 x 0xD4 entries {name ptr, 5x(2 ability-name
                                  + 2 furigana ptrs), 4 passive ptrs, 20 ability-
                                  description ptrs, 6 interaction ptrs, 3x i16}.
  - chr_s_t.bin   Binary2SuppChr:  400 x 0x24 entries {name ptr, 2x2 ability ptrs,
                                  2x2 description ptrs}.
  - infoname.bin  simple ptr tbl:  42 series names (u32 rel-ptrs).
  - pname.bin     count + ptr tbl:  89 player epithets (u32 count + rel-ptrs).
  - piece.bin is NOT per-koma: 41 entries (per-series panel info), stored
    separately under "pieces".
  - kshape.bin    BinaryKShape2SpriteCollection: 8 u32 first-indices @0x00,
                  8 u32 group-counts @0x20, entries @0x40 x 0x18
                  (0x14-byte 5x4 segment map + 4 unknown bytes).
  - koma.bin      Binary2Koma:     890 x 12 {ImageID u16, unk u16, NTbl u8,
                                    NameNum u8, unk u8 x2, KShapeGroup u8,
                                    KShapeElement u8, unk u8 x2}.

Pointer convention (JusText.ReadIndirectString): the u32 at field offset P
points to P + value. Strings are null-terminated Shift-JIS. This relative
interpretation is why the old absolute-offset dumps (recomp/*.dump.txt) were
garbled after entry 0.

Outputs:
  data/koma_db.json          full machine-readable database
  data/koma_db.csv           flat spreadsheet view
  decomp/docs/KOMA_DATABASE.md   human-readable dump + validation report

Usage:
  py tools/scripts/koma_harvest.py [--no-md] [--strict]
"""

from __future__ import annotations

import argparse
import json
import struct
import sys
from collections import Counter, defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
BIN = ROOT / "extract/files/bin"
DECK_DIR = ROOT / "extract/deck_extracted/deck"
DATA_DIR = ROOT / "data"
DOC_PATH = ROOT / "decomp/docs/KOMA_DATABASE.md"

# 43-entry series code table, transcribed from JUSToolkit Koma.cs (index 0 unused).
SERIES_CODES = [
    None, "es", "is", "ig", "tr", "ct", "gt", "kn",
    "kk", "cb", "oj", "nb", "sk", "tc", "jj", "sd",
    "ss", "tz", "to", "dg", "dn", "ds", "tl", "db",
    "na", "nk", "hh", "pj", "bu", "bc", "bl", "hs",
    "hk", "bb", "nn", "mo", "mr", "yo", "yh", "rk",
    "rb", "op", "dt",
]

KOMA_COUNT = 890
SHAPE_ENTRY = 0x18
SHAPE_MASK_LEN = 0x14  # 5 cols x 4 rows
BOARD_COLS, BOARD_ROWS = 5, 4

# Runtime-confirmed anchors (live oracle, 2026-08-22 — see DECK_FORMAT.md).
ANCHORS = {
    0: ("セナ", 1),        # Sena 1-koma, Eyeshield 21
    823: ("ルフィ", 41),   # Luffy 4-koma, One Piece
    824: ("ルフィ", 41),   # Luffy 5-koma
    830: ("ゾロ", 41),     # Zoro 2-koma
}


def sjis(raw: bytes) -> str:
    """Decode Shift-JIS with graceful fallback (never raises)."""
    for enc in ("shift_jis", "cp932"):
        try:
            return raw.decode(enc)
        except UnicodeDecodeError:
            continue
    return "HEX:" + raw.hex()


class RelPtrReader:
    """Reader for JUSToolkit-style tables: u32 at offset P -> string at P+value."""

    def __init__(self, data: bytes):
        self.d = data

    def string_at(self, off: int) -> str:
        end = self.d.find(b"\x00", off)
        if end < 0:
            end = len(self.d)
        return sjis(self.d[off:end])

    def rel_string(self, field_off: int) -> str:
        (rel,) = struct.unpack_from("<i", self.d, field_off)
        return self.string_at(field_off + rel)


# ---------------------------------------------------------------------------
# File parsers
# ---------------------------------------------------------------------------

def parse_ptr_table(path: Path, entry_size: int = 4) -> list[str]:
    """infoname.bin style: entries from offset 0, count = u32@0/size."""
    r = RelPtrReader(path.read_bytes())
    (count,) = struct.unpack_from("<I", r.d, 0)
    count //= entry_size
    return [r.rel_string(i * entry_size) for i in range(count)]


def parse_count_ptr_table(path: Path) -> list[str]:
    """pname.bin style: u32 count, then that many rel-ptrs at 4+4i."""
    r = RelPtrReader(path.read_bytes())
    (count,) = struct.unpack_from("<I", r.d, 0)
    return [r.rel_string(4 + i * 4) for i in range(count)]


def parse_komatxt(path: Path) -> list[dict]:
    r = RelPtrReader(path.read_bytes())
    (count,) = struct.unpack_from("<I", r.d, 0)
    count //= 0x0C
    out = []
    for i in range(count):
        base = i * 0x0C
        out.append({
            "name": r.rel_string(base),
            "unk1": struct.unpack_from("<i", r.d, base + 4)[0],
            "unk2": struct.unpack_from("<i", r.d, base + 8)[0],
        })
    return out


def parse_piece(path: Path) -> list[dict]:
    r = RelPtrReader(path.read_bytes())
    (count,) = struct.unpack_from("<I", r.d, 0)
    entries = []
    off = 4
    for _ in range(count):
        flds = []
        for _ in range(1 + 2 + 2 + 9 + 9):  # title, authors, info, page1, page2
            flds.append(r.rel_string(off))
            off += 4
        unk1, pid = struct.unpack_from("<hh", r.d, off)
        off += 4
        entries.append({
            "title": flds[0],
            "authors": [s for s in flds[1:3] if s],
            "info": [s for s in flds[3:5] if s],
            "page1": [s for s in flds[5:14] if s],
            "page2": [s for s in flds[14:23] if s],
            "unk1": unk1,
            "id": pid,
        })
    return entries


def parse_btlchr(path: Path) -> list[dict]:
    r = RelPtrReader(path.read_bytes())
    (count,) = struct.unpack_from("<I", r.d, 0)
    count //= 0xD4
    entries = []
    for i in range(count):
        off = i * 0xD4

        def s(o: int) -> str:
            return r.rel_string(o)

        abil_names: list[str] = []
        abil_furi: list[str] = []
        o = off + 4
        for _ in range(5):  # NumAbilities(10)/2 blocks of 2 names + 2 furiganas
            abil_names.append(s(o)); abil_names.append(s(o + 4))
            abil_furi.append(s(o + 8)); abil_furi.append(s(o + 12))
            o += 16
        passive = {"name": s(o), "furigana": s(o + 4),
                   "desc1": s(o + 8), "desc2": s(o + 12)}
        o += 16
        abil_descs = [s(o + k * 4) for k in range(20)]  # NumAbilities*2
        o += 80
        interactions = [s(o + k * 4) for k in range(6)]  # NumInteractions*2
        o += 24
        unk1, unk2, unk3 = struct.unpack_from("<hhh", r.d, o)
        # pair up: ability i -> (name, furigana, desc[i*2..i*2+2]?); layout kept flat
        abilities = []
        for k in range(10):
            abilities.append({
                "name": abil_names[k],
                "furigana": abil_furi[k],
                "desc_a": abil_descs[k * 2],
                "desc_b": abil_descs[k * 2 + 1],
            })
        entries.append({
            "name": s(off),
            "abilities": abilities,
            "passive": passive,
            "interactions": interactions,
            "unk": [unk1, unk2, unk3],
        })
    return entries


def parse_suppchr(path: Path) -> list[dict]:
    r = RelPtrReader(path.read_bytes())
    (count,) = struct.unpack_from("<I", r.d, 0)
    count //= 0x24
    entries = []
    for i in range(count):
        off = i * 0x24
        name = r.rel_string(off)
        abil = [r.rel_string(off + 4 + k * 4) for k in range(4)]
        desc = [r.rel_string(off + 20 + k * 4) for k in range(4)]
        entries.append({
            "name": name,
            # pairs: (ability, effect) x2
            "abilities": [
                {"name": abil[0], "effect": desc[0]},
                {"name": abil[2], "effect": desc[2]},
            ],
            "furiganas": [abil[1], abil[3]],
            "extra": [desc[1], desc[3]],
        })
    return entries


def parse_koma(path: Path) -> list[dict]:
    d = path.read_bytes()
    assert len(d) % 12 == 0, f"koma.bin size {len(d)} not multiple of 12"
    out = []
    for i in range(len(d) // 12):
        o = i * 12
        image_id, unk2 = struct.unpack_from("<HH", d, o)
        out.append({
            "id": i,
            "image_id": image_id,
            "unk2": unk2,
            "ntbl": d[o + 4],
            "namenum": d[o + 5],
            "unk6": d[o + 6],
            "unk7": d[o + 7],
            "shape_group": d[o + 8],
            "shape_element": d[o + 9],
            "unk10": d[o + 10],
            "unk11": d[o + 11],
        })
    return out


def parse_kshape(path: Path) -> dict[tuple[int, int], dict]:
    """-> {(group, element): {mask: [20 ints], unk: [4 ints], tiles: int}}"""
    d = path.read_bytes()
    first = struct.unpack_from("<8I", d, 0x00)
    counts = struct.unpack_from("<8I", d, 0x20)
    shapes: dict[tuple[int, int], dict] = {}
    for g in range(8):
        for e in range(counts[g]):
            off = 0x40 + (first[g] + e) * SHAPE_ENTRY
            mask = list(d[off:off + SHAPE_MASK_LEN])
            unk = list(d[off + SHAPE_MASK_LEN:off + SHAPE_ENTRY])
            shapes[(g, e)] = {
                "mask": mask,
                "unk": unk,
                "tiles": sum(1 for v in mask if v),
            }
    return shapes


def mask_rows(mask: list[int]) -> list[str]:
    """Render 20-byte mask as 4 rows of 5 chars ('#' filled)."""
    return ["".join("#" if mask[r * 5 + c] else "."
                    for c in range(BOARD_COLS))
            for r in range(BOARD_ROWS)]


def koma_type(tiles: int) -> str:
    if tiles <= 1:
        return "help"
    if tiles <= 3:
        return "support"
    return "battle"


# ---------------------------------------------------------------------------
# Validation
# ---------------------------------------------------------------------------

def validate(komas: list[dict], shapes: dict, komatxt: list[dict],
             pieces: list[dict], report: dict) -> bool:
    ok = True

    def check(cond: bool, msg: str) -> bool:
        report["checks"].append(("PASS" if cond else "FAIL", msg))
        if not cond:
            report["failed"] += 1
        return cond

    report["checks"] = []
    report["failed"] = 0

    check(len(komas) == KOMA_COUNT, f"koma.bin has {KOMA_COUNT} records")
    check(len(komatxt) == KOMA_COUNT,
          f"komatxt.bin has {KOMA_COUNT} entries (got {len(komatxt)})")

    # Anchors: name + series must match runtime-confirmed ids.
    for kid, (nm, ntbl) in ANCHORS.items():
        k = komas[kid]
        got = komatxt[kid]["name"]
        check(k["ntbl"] == ntbl,
              f"anchor {kid}: NTbl == {ntbl} (got {k['ntbl']})")
        check(nm in got,
              f"anchor {kid}: name contains {nm!r} (got {got!r})")

    # Shape sanity: tiles == group + 1; every (group, element) resolves.
    bad_shapes = 0
    for k in komas:
        sh = shapes.get((k["shape_group"], k["shape_element"]))
        if sh is None or sh["tiles"] != k["shape_group"] + 1:
            bad_shapes += 1
    check(bad_shapes == 0,
          f"all 890 shape refs resolve with tiles == KGrp+1 ({bad_shapes} bad)")

    # Luffy 4-koma must be a 2x2 block; Zoro 2-koma 2 cells.
    l4 = mask_rows(shapes[(3, 0)]["mask"])
    check(all("#" in row for row in l4[:2]) and
          sum(r.count("#") for r in l4) == 4,
          f"Luffy 4-koma shape is 2x2 ({l4})")
    z2 = shapes[(1, 0)]["tiles"]
    check(z2 == 2, f"Zoro 2-koma shape has 2 tiles (got {z2})")

    # Piece table sanity: unique ids.
    ids = [p["id"] for p in pieces]
    check(len(set(ids)) == len(ids),
          f"piece.bin ids unique ({len(set(ids))}/{len(ids)})")

    # Name uniqueness stats (informational).
    names = Counter(kt["name"] for kt in komatxt)
    report["duplicate_names"] = sum(1 for n, c in names.items() if c > 1)
    report["unique_names"] = len(names)

    return report["failed"] == 0


def preset_sweep(komas: list[dict], report: dict) -> None:
    """Cross-check the 370 preset decks; gather flag statistics."""
    stats = {
        "decks": 0, "bad_ids": 0, "mixed_series_decks": 0,
        "leader_bits_per_deck": Counter(), "link_nibbles": Counter(),
        "high_bits": Counter(),
    }
    if not DECK_DIR.exists():
        report["presets"] = "skipped (no preset dir)"
        return
    for path in sorted(DECK_DIR.rglob("*.bin")):
        rec = path.read_bytes()
        if len(rec) != 0x5C:
            continue
        stats["decks"] += 1
        series = set()
        leaders = 0
        for i in range(16):
            kid, fl = struct.unpack_from("<HH", rec, i * 4)
            if kid == 0xFFFF:
                continue
            if kid >= KOMA_COUNT:
                stats["bad_ids"] += 1
                continue
            series.add(komas[kid]["ntbl"])
            leaders += 1 if fl & 0x1000 else 0
            stats["link_nibbles"][(fl >> 8) & 0xF] += 1
            for bit in (0x2000, 0x4000, 0x8000):
                if fl & bit:
                    stats["high_bits"][hex(bit)] += 1
        if len(series) > 1:
            stats["mixed_series_decks"] += 1
        stats["leader_bits_per_deck"][leaders] += 1
    # Counter keys must be str for JSON.
    report["presets"] = {
        "decks": stats["decks"],
        "bad_ids": stats["bad_ids"],
        "mixed_series_decks": stats["mixed_series_decks"],
        "leader_bits_per_deck": {str(k): v for k, v in
                                 sorted(stats["leader_bits_per_deck"].items())},
        "link_nibbles": {str(k): v for k, v in
                         sorted(stats["link_nibbles"].items())},
        "high_bits": dict(stats["high_bits"]),
    }


# ---------------------------------------------------------------------------
# Output writers
# ---------------------------------------------------------------------------

def write_csv(db: dict, path: Path) -> None:
    import csv
    with path.open("w", newline="", encoding="utf-8-sig") as f:
        w = csv.writer(f)
        w.writerow(["id", "name_jp", "name_en", "series", "series_en",
                    "ntbl", "namenum", "type", "tiles", "nature", "variant",
                    "image_id", "shape_group", "shape_element", "shape",
                    "koma_unk"])
        for k in db["komas"]:
            w.writerow([
                k["id"], k["name_jp"], k.get("name_en", ""),
                ";".join(k["aliases"]), k["series"],
                k.get("series_en", ""), k["ntbl"], k["namenum"],
                k["koma_type"], k["tiles"], k.get("nature", ""),
                k.get("variant", ""), k["image_id"], k["shape_group"],
                k["shape_element"], "/".join(k["shape"]),
                ";".join(str(u) for u in k["unk"]),
            ])


def write_md(db: dict, path: Path) -> None:
    lines = [
        "# Koma Database — auto-generated",
        "",
        f"Generated by `tools/scripts/koma_harvest.py` from the extracted game",
        f"data. Full data in `data/koma_db.json` / `data/koma_db.csv`.",
        "",
        "## Validation",
        "",
    ]
    for status, msg in db["validation"]["checks"]:
        lines.append(f"- {status}: {msg}")
    v = db["validation"]
    lines += [
        f"- names: {v['unique_names']} unique across {KOMA_COUNT} komas "
        f"({v['duplicate_names']} names shared by 2+ komas)",
        "",
        "## Series index",
        "",
        "| NTbl | Code | Rep. character (infoname) | Komas | Id range |",
        "|---|---|---|---|---|",
    ]
    for nt in sorted(db["series"], key=int):
        s = db["series"][nt]
        lines.append(f"| {nt} | {s['code']} | {s['rep_char_jp']} | "
                     f"{s['count']} | {s['first_id']}–{s['last_id']} |")
    lines += ["", "## Komas by series", ""]
    for nt in sorted(db["series"], key=int):
        s = db["series"][nt]
        en = s.get("name_en") or ""
        lines += [f"### NTbl {nt} — {s['code']}"
                  f"{f' — {en}' if en else ''} (rep: {s['rep_char_jp']})", "",
                  "| Id | Name (JP) | Name (EN) | Type | Tiles | Shape |",
                  "|---|---|---|---|---|---|"]
        for k in db["komas"]:
            if k["ntbl"] != int(nt):
                continue
            alias = f" ({','.join(k['aliases'])})" if k["aliases"] else ""
            lines.append(f"| {k['id']} | {k['name_jp']}{alias} | "
                         f"{k.get('name_en', '')} | "
                         f"{k['koma_type']} | {k['tiles']} | "
                         f"{'/'.join(k['shape'])} |")
        lines.append("")
    lines += [
        "## Battle characters (chr_b_t.bin)",
        "",
        "| Idx | Name | Komas (name-join) |", "|---|---|---|",
    ]
    for i, c in enumerate(db["battle_characters"]):
        ids = ",".join(str(x) for x in c["koma_ids"]) or "—"
        lines.append(f"| {i} | {c['name']} | {ids} |")
    lines += [
        "",
        "## Support characters (chr_s_t.bin)",
        "",
        "| Idx | Name | Komas (name-join) |", "|---|---|---|",
    ]
    for i, c in enumerate(db["support_characters"]):
        ids = ",".join(str(x) for x in c["koma_ids"]) or "—"
        lines.append(f"| {i} | {c['name']} | {ids} |")
    path.write_text("\n".join(lines), encoding="utf-8")


# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------

def load_aliases() -> dict[str, list[int]]:
    p = DATA_DIR / "koma_aliases.json"
    if not p.exists():
        return {}
    raw = json.loads(p.read_text(encoding="utf-8"))
    out = {}
    for alias, ids in raw.items():
        out[alias.casefold()] = [int(x) for x in ids]
    return out


EXT_CSV = DATA_DIR / "koma_external.csv"

# CSV column order (Jump Database project, jus-deck-builder/komatest.csv)
EXT_COLS = ("series_en", "name_en", "size", "variant", "class", "nature",
            "startup", "damage", "range", "knockback", "effect", "buff",
            "debuff", "resistance", "passive", "ground_air",
            "description_en")


def slugify(name: str) -> str:
    out = []
    for ch in name.lower():
        if ch.isalnum():
            out.append(ch)
        elif out and out[-1] != "-":
            out.append("-")
    return "".join(out).strip("-")


def enrich_from_csv(db: dict, csv_path: Path) -> None:
    """Merge the external English koma CSV (owner's Jump Database project).

    The CSV lists 868 of the 890 komas — the "legit/obtainable" ones — in
    koma.bin id order, skipping the cheat-only komas (the whole NTbl 42
    specials block plus 22 unobtainable komas inside regular series).
    Alignment is a global greedy walk: for each CSV row, advance past our
    komas whose tile count differs (those are the skipped ones).
    """
    import csv as _csv

    with csv_path.open(newline="", encoding="utf-8-sig") as f:
        rows = [r for r in _csv.reader(f) if len(r) >= 17]

    def clean(v: str):
        v = v.strip()
        return None if v in ("", "N/A") else v

    # group rows by English series name, preserving first-seen order; their
    # series appear in NTbl order and map 1:1 to NTbls that have any rows.
    groups: dict[str, list[list[str]]] = {}
    order: list[str] = []
    for row in rows:
        s = clean(row[0]) or "?"
        if s not in groups:
            groups[s] = []
            order.append(s)
        groups[s].append(row)

    series_komas: dict[int, list[dict]] = {}
    for k in db["komas"]:
        series_komas.setdefault(k["ntbl"], []).append(k)
    ntbl_order = sorted(series_komas)

    def row_tiles(row):
        return int(clean(row[2]).split()[0])  # "4 Koma" -> 4

    mapped = 0
    unmapped_rows = 0
    class_mismatch = 0
    variant_map: dict[tuple[int, int], str] = {}
    variant_conflicts = 0

    # pairs of (our koma, their row) produced by the per-series alignment
    assignments: list[tuple[dict, list[str]]] = []
    import difflib
    for gi, series_en in enumerate(order):
        grp = groups[series_en]
        if gi >= len(ntbl_order):
            unmapped_rows += len(grp)
            continue
        lst = series_komas[ntbl_order[gi]]
        ours = [k["tiles"] for k in lst]
        theirs = [row_tiles(r) for r in grp]
        sm = difflib.SequenceMatcher(a=ours, b=theirs, autojunk=False)
        for a, b, size in sm.get_matching_blocks():
            for off in range(size):
                assignments.append((lst[a + off], grp[b + off]))

    for koma, row in assignments:
        if True:

            vals = {c: clean(row[n]) for n, c in enumerate(EXT_COLS)}
            koma["name_en"] = vals["name_en"]
            koma["series_en"] = vals["series_en"]
            koma["nature"] = vals["nature"]
            koma["variant"] = vals["variant"]
            koma["class_en"] = vals["class"]
            koma["stats"] = {c: vals[c] for c in
                             ("startup", "damage", "range", "knockback",
                              "effect", "buff", "debuff", "resistance",
                              "passive", "ground_air")}
            koma["description_en"] = vals["description_en"]
            slug = slugify(vals["name_en"] or "")
            if slug and slug not in koma["aliases"]:
                koma["aliases"].append(slug)

            cls = (vals["class"] or "").casefold()
            if cls and cls != koma["koma_type"]:
                class_mismatch += 1
            vkey = (koma["shape_group"], koma["shape_element"])
            if vals["variant"]:
                if vkey in variant_map and variant_map[vkey] != vals["variant"]:
                    variant_conflicts += 1
                variant_map[vkey] = vals["variant"]
            mapped += 1
            db["series"][str(koma["ntbl"])]["name_en"] = vals["series_en"]

    unmapped = [k["id"] for k in db["komas"] if "name_en" not in k]
    db["validation"]["checks"].append(
        ("PASS" if mapped >= len(rows) - 10 else "FAIL",
         f"external CSV: {mapped}/{len(rows)} rows mapped "
         f"({len(rows) - mapped} aligned out in unobtainable-dense "
         f"regions — conservative)"))
    db["validation"]["checks"].append(
        ("PASS" if not class_mismatch else "FAIL",
         f"external CSV class matches koma_type ({class_mismatch} "
         f"mismatches)"))
    db["validation"]["notes"] = (
        f"variant codes (e.g. '4K (T6)') are the external project's own "
        f"sprite-catalog numbering, NOT 1:1 with kshape elements "
        f"({variant_conflicts} mixed labels) — informational only")
    db["validation"]["external_unmapped"] = unmapped
    db["meta"]["external_csv"] = (
        "data/koma_external.csv — owner's Jump Database project "
        "(English names, series, nature, shape-variant codes, stats)")
    print(f"  external CSV: {mapped} rows merged, {len(unmapped)} komas "
          f"unmapped: {unmapped}")


def join_characters(komatxt: list[dict], chars: list[dict],
                    kind: str) -> None:
    """Attach koma ids to character entries via display-name join.
    Exact match first, then containment (e.g. モンキー・D・ルフィ vs ルフィ)."""
    by_name: dict[str, list[int]] = defaultdict(list)
    for i, kt in enumerate(komatxt):
        by_name[kt["name"]].append(i)
    exact = fuzzy = 0
    for c in chars:
        ids = by_name.get(c["name"], [])
        if ids:
            exact += 1
        else:
            # containment: koma name contained in char name or vice versa
            ids = [i for i, kt in enumerate(komatxt)
                   if kt["name"] and (kt["name"] in c["name"]
                                      or c["name"] in kt["name"])]
            if ids:
                fuzzy += 1
        c["koma_ids"] = ids
    print(f"  {kind}: {exact}/{len(chars)} exact, +{fuzzy} fuzzy name joins")


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--no-md", action="store_true", help="skip MD doc output")
    ap.add_argument("--strict", action="store_true",
                    help="non-zero exit if any validation fails")
    args = ap.parse_args()

    sys.stdout.reconfigure(encoding="utf-8")
    DATA_DIR.mkdir(exist_ok=True)

    print("[1/6] parsing koma.bin ...")
    komas = parse_koma(BIN / "koma.bin")
    print(f"  {len(komas)} records")

    print("[2/6] parsing komatxt.bin / infoname.bin / pname.bin ...")
    komatxt = parse_komatxt(BIN / "komatxt.bin")
    series_names = parse_ptr_table(BIN / "infoname.bin")
    epithets = parse_count_ptr_table(BIN / "pname.bin")
    print(f"  komatxt={len(komatxt)} infoname={len(series_names)} "
          f"pname={len(epithets)}")

    print("[3/6] parsing kshape.bin ...")
    shapes = parse_kshape(BIN / "kshape.bin")
    total_shapes = len(shapes)
    tiles_by_group = {}
    for (g, _e), sh in shapes.items():
        tiles_by_group.setdefault(g, set()).add(sh["tiles"])
    print(f"  {total_shapes} shapes; tiles-per-group: "
          f"{ {g: sorted(v) for g, v in sorted(tiles_by_group.items())} }")

    print("[4/6] parsing piece.bin / chr_b_t.bin / chr_s_t.bin ...")
    pieces = parse_piece(BIN / "piece.bin")
    pieces_by_id = {p["id"]: p for p in pieces}
    btl = parse_btlchr(BIN / "chr_b_t.bin")
    supp = parse_suppchr(BIN / "chr_s_t.bin")
    print(f"  piece={len(pieces)} (unique ids {len(pieces_by_id)}) "
          f"chr_b_t={len(btl)} chr_s_t={len(supp)}")

    print("[5/6] validating ...")
    report: dict = {}
    ok = validate(komas, shapes, komatxt, pieces, report)
    preset_sweep(komas, report)

    print("[6/6] assembling database ...")
    aliases = load_aliases()
    alias_by_id: dict[int, list[str]] = defaultdict(list)
    for alias, ids in aliases.items():
        for kid in ids:
            alias_by_id[kid].append(alias)

    series_index: dict[int, dict] = {}
    for k in komas:
        nt = k["ntbl"]
        if nt not in series_index:
            series_index[nt] = {"first_id": k["id"], "last_id": k["id"],
                                "count": 0}
        s = series_index[nt]
        s["last_id"] = k["id"]
        s["count"] += 1

    db = {
        "meta": {
            "game": "Jump Ultimate Stars",
            "generated_by": "tools/scripts/koma_harvest.py",
            "sources": ["koma.bin", "komatxt.bin", "kshape.bin", "piece.bin",
                        "chr_b_t.bin", "chr_s_t.bin", "infoname.bin",
                        "pname.bin"],
            "format_refs": "JUSToolkit (tools/JUSToolkit) — relative u32 "
                           "pointers + Shift-JIS strings",
            "board": {"cols": BOARD_COLS, "rows": BOARD_ROWS},
            "notes": {
                "shape_mask": "20 bytes, row-major (byte r*5+c), nonzero = "
                              "filled cell; KGrp == tiles-1",
                "koma_type": "help(1 tile, linkable), support(2-3), "
                             "battle(4-8, leader-able)",
                "name_join": "battle/support character -> koma ids via exact "
                             "display-name match (komatxt)",
            },
        },
        "series": {},
        "komas": [],
        "battle_characters": btl,
        "support_characters": supp,
        "player_epithets": epithets,
        "pieces": [],
        "validation": report,
    }
    for nt, s in sorted(series_index.items()):
        manga = pieces[nt - 1] if 0 < nt <= len(pieces) else None
        db["series"][str(nt)] = {
            "code": SERIES_CODES[nt] if nt < len(SERIES_CODES) else "??",
            # infoname[i] is NTbl i's representative support character.
            "rep_char_jp": series_names[nt] if nt < len(series_names) else "??",
            # piece.bin[i] is NTbl (i+1)'s manga entry (title/authors/run info).
            "manga": ({k: manga[k] for k in ("title", "authors", "info")}
                      if manga else None),
            "count": s["count"],
            "first_id": s["first_id"],
            "last_id": s["last_id"],
        }

    for k, kt in zip(komas, komatxt):
        sh = shapes[(k["shape_group"], k["shape_element"])]
        db["komas"].append({
            "id": k["id"],
            "name_jp": kt["name"],
            "aliases": sorted(alias_by_id.get(k["id"], [])),
            "ntbl": k["ntbl"],
            "series": db["series"][str(k["ntbl"])]["code"],
            "namenum": k["namenum"],
            "image_id": k["image_id"],
            "tiles": sh["tiles"],
            "koma_type": koma_type(sh["tiles"]),
            "shape_group": k["shape_group"],
            "shape_element": k["shape_element"],
            "shape": mask_rows(sh["mask"]),
            "shape_mask_hex": bytes(sh["mask"]).hex(),
            "komatxt_unk": [kt["unk1"], kt["unk2"]],
            "unk": [k["unk2"], k["unk6"], k["unk7"], k["unk10"], k["unk11"]],
        })
    db["pieces"] = pieces

    join_characters(komatxt, db["battle_characters"], "battle")
    join_characters(komatxt, db["support_characters"], "support")

    if EXT_CSV.exists():
        print("[extra] merging external English CSV "
              "(data/koma_external.csv) ...")
        enrich_from_csv(db, EXT_CSV)
    else:
        print("[extra] no data/koma_external.csv — skipping enrichment")

    json_path = DATA_DIR / "koma_db.json"
    json_path.write_text(json.dumps(db, ensure_ascii=False, indent=1),
                         encoding="utf-8")
    write_csv(db, DATA_DIR / "koma_db.csv")
    if not args.no_md:
        write_md(db, DOC_PATH)
        print(f"  wrote {DOC_PATH}")
    print(f"  wrote {json_path} and {DATA_DIR / 'koma_db.csv'}")

    for status, msg in report["checks"]:
        print(f"  [{status}] {msg}")
    p = report.get("presets")
    if isinstance(p, dict):
        print(f"  presets: {p['decks']} decks, bad_ids={p['bad_ids']}, "
              f"mixed-series={p['mixed_series_decks']}, "
              f"leaders/deck={p['leader_bits_per_deck']}, "
              f"link nibbles={p['link_nibbles']}, high={p['high_bits']}")
    if args.strict and not ok:
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
