#!/usr/bin/env python3
"""
deck_build.py (v2) — author a 92-byte deck record by KOMA NAME, with
auto-placement. Supersedes the raw ID:FLAGS interface (still supported).

Record format (runtime-confirmed 2026-08-22, see decomp/docs/DECK_FORMAT.md):
    0x00..0x3F  16 koma slots { u16 koma_id, u16 flags }; 0xFFFF = empty
    0x40..      null-terminated deck name (Shift-JIS, full-width)

flags = (leader << 12) | (link_nibble << 8) | (row << 4) | col
    board is 5 cols x 4 rows; leader bit on exactly one battle koma
    (preset corpus: 292/295 decks have exactly one).
    link nibble (bits 8-11) = arrow direction from a 1-tile help koma
    toward the linked koma: 1=down 2=left 3=up 4=right (solved 2026-08-23,
    see decomp/docs/KOMA_LINKS.md). Auto-placement links corpus-linkable
    help komas placed adjacent to a battle koma; links are optional.

Koma addressing (uses data/koma_db.json from tools/scripts/koma_harvest.py):
    --koma 823                    raw koma id
    --koma 823:0x1001             raw id with explicit flags (v1 style)
    --koma luffy                  alias or Japanese-name substring
    --koma op:luffy               series code + alias/substring
    --koma op:ルフィ              series + Japanese substring
    --koma op:luffy#4             '#N' suffix selects the N-tile koma
    --koma nn:ネウロ#7            7-tile Neuro battle koma

Legality checks (runtime-confirmed rules):
    - unknown ids rejected; duplicates warned (game silently dedups)
    - battle start needs >= 1 help (1-tile) and >= 1 support koma (warn)
    - <= 16 slots (hard); all pieces must fit the 5x4 board (hard)

Usage:
    py tools/scripts/deck_build.py --name TEST --koma es:sena --koma op:luffy#4 \
        --koma op:zoro#2 -o recomp/poc2.bin
    py tools/scripts/deck_build.py --search op:luffy
"""

from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
DB_PATH = ROOT / "data/koma_db.json"
ALIAS_PATH = ROOT / "data/koma_aliases.json"
LINKS_PATH = ROOT / "data/koma_linkable.json"
KIZUNA_PATH = ROOT / "data/kizuna.json"

RECORD_SIZE = 0x5C
N_SLOTS = 16
NAME_OFF = 0x40
BOARD_COLS, BOARD_ROWS = 5, 4

# link nibble (flags bits 8-11) -> arrow direction (solved 2026-08-23,
# 464/464 corpus hits + live in-game arrow check). The arrow points from the
# help koma TOWARD the linked koma.
DIR_NIBBLE = {"up": 0x3, "down": 0x1, "left": 0x2, "right": 0x4}
DIR_GLYPH = {0x1: "v", 0x2: "<", 0x3: "^", 0x4: ">"}

# L/R assist shortcut bits (owner-confirmed in deck viewer 2026-08-23):
# 0x2000 = L shortcut, 0x4000 = R shortcut. Placeable on support (2-3T) or
# battle komas; at most one L and one R per deck.
ASSIST_L, ASSIST_R = 0x2000, 0x4000


def fullwidth_shift_jis(name: str) -> bytes:
    """ASCII -> JIS X 0208 full-width Shift-JIS (e.g. 'A' -> 0x8260)."""
    out = bytearray()
    for ch in name:
        o = ord(ch)
        if 0x20 <= o <= 0x7E:
            fw = o + 0xFEE0
            try:
                out += chr(fw).encode("shift_jis")
            except UnicodeEncodeError:
                out += bytes([o])
        else:
            try:
                out += ch.encode("shift_jis")
            except UnicodeEncodeError:
                out += b"?"
    return bytes(out)


class KomaDB:
    def __init__(self) -> None:
        if not DB_PATH.exists():
            raise SystemExit(
                f"[!] {DB_PATH} not found — run "
                "`py tools/scripts/koma_harvest.py` first")
        self.db = json.loads(DB_PATH.read_text(encoding="utf-8"))
        self.komas = self.db["komas"]
        self.by_id = {k["id"]: k for k in self.komas}
        self.by_series: dict[str, list[dict]] = {}
        for k in self.komas:
            self.by_series.setdefault(k["series"], []).append(k)
        self.aliases: dict[str, list[int]] = {}
        if ALIAS_PATH.exists():
            raw = json.loads(ALIAS_PATH.read_text(encoding="utf-8"))
            self.aliases = {a.casefold(): ids for a, ids in raw.items()}
        # linkable 1-koma ids (link_solve.py corpus analysis)
        self.linkable: set[int] = set()
        self.standalone: set[int] = set()
        if LINKS_PATH.exists():
            lk = json.loads(LINKS_PATH.read_text(encoding="utf-8"))
            self.linkable = set(lk.get("linkable", []))
            self.standalone = set(lk.get("standalone_1k", []))
        # ally-boost relations: battle koma id -> related support/help koma ids
        self.boost: dict[str, list[int]] = {}
        if KIZUNA_PATH.exists():
            kz = json.loads(KIZUNA_PATH.read_text(encoding="utf-8"))
            self.boost = kz.get("battle_koma_boost", {})

    # -- query ------------------------------------------------------------

    def resolve(self, spec: str) -> dict:
        """Resolve one --koma spec to a koma record (or exit with candidates)."""
        tiles = None
        if "#" in spec:
            spec, t = spec.rsplit("#", 1)
            tiles = int(t, 0)

        series = None
        query = spec
        if ":" in spec:
            series, query = spec.split(":", 1)

        pool = self.komas
        if series:
            pool = self.by_series.get(series.lower())
            if pool is None:
                sys.exit(f"[!] unknown series code {series!r} "
                         f"(valid: {sorted(self.by_series)})")

        q = query.casefold()
        pool_ids = {k["id"] for k in pool}
        alias_ids = {i for i in self.aliases.get(q, []) if i in pool_ids}
        cands: list[dict] = []
        for k in pool:
            if (q == str(k["id"])
                    or k["id"] in alias_ids
                    or q in k["name_jp"].casefold()
                    or q in (k.get("name_en") or "").casefold()
                    or any(q == a for a in k["aliases"])):
                cands.append(k)
        # dedup, keep order
        cands = list({k["id"]: k for k in cands}.values())

        if tiles is not None:
            pre = [f"{k['id']} {k['name_jp']} [{k['koma_type']}/{k['tiles']}T]"
                   for k in cands]
            cands = [k for k in cands if k["tiles"] == tiles]
            if cands == [] and pre:
                sys.exit(f"[!] {spec!r}: no {tiles}-tile koma among:\n    "
                         + "\n    ".join(pre))
        if not cands:
            sys.exit(f"[!] no koma matches {spec!r}")
        if len(cands) > 1:
            # unique only if they are the same koma id (dup names in a series)
            if len({k["id"] for k in cands}) > 1:
                lines = [f"[!] {spec!r} is ambiguous — candidates:"]
                for k in cands[:12]:
                    lines.append(f"    {k['id']:3d} {k['name_jp']} "
                                 f"{k.get('name_en', '')} "
                                 f"[{k['koma_type']}/{k['tiles']}T] "
                                 f"{k['series']}  (use #N to pick tile count)")
                sys.exit("\n".join(lines))
        return cands[0]

    def search(self, query: str) -> list[dict]:
        tiles = None
        if "#" in query:
            query, t = query.rsplit("#", 1)
            tiles = int(t, 0)
        series = None
        q = query
        if ":" in query:
            series, q = query.split(":", 1)
        pool = self.by_series.get(series.lower(), self.komas) if series \
            else self.komas
        q = q.casefold()
        out = []
        for k in pool:
            if (q in k["name_jp"].casefold()
                    or q in (k.get("name_en") or "").casefold()
                    or any(q in a for a in k["aliases"])
                    or q == str(k["id"])):
                if tiles is None or k["tiles"] == tiles:
                    out.append(k)
        return out


# -- auto-placement -------------------------------------------------------

def shape_cells(koma: dict) -> list[tuple[int, int]]:
    return [(r, c) for r in range(BOARD_ROWS) for c in range(BOARD_COLS)
            if koma["shape"][r][c] == "#"]


def fits(board: list[list[bool]], cells: list[tuple[int, int]],
         ar: int, ac: int) -> bool:
    for r, c in cells:
        rr, cc = r + ar, c + ac
        if not (0 <= rr < BOARD_ROWS and 0 <= cc < BOARD_COLS):
            return False
        if board[rr][cc]:
            return False
    return True


def place(board: list[list[bool]], cells: list[tuple[int, int]],
          ar: int, ac: int) -> None:
    for r, c in cells:
        board[r + ar][c + ac] = True


def auto_place(selection: list[tuple[dict, int | None]],
               linkable: set[int]) -> list[int]:
    """Greedy 5x4 pack. Returns flags per koma (aligned with selection).
    Manual flags (int) komas are stamped first at their stated anchors.
    Help komas placed adjacent to a battle koma get a link nibble pointing
    at it (solved direction enum: 1=down 2=left 3=up 4=right), only when the
    koma id is in the corpus-linkable set."""
    board = [[False] * BOARD_COLS for _ in range(BOARD_ROWS)]
    owners = [[""] * BOARD_COLS for _ in range(BOARD_ROWS)]
    results: list[int | None] = [None] * len(selection)
    manual: list[tuple[int, dict, int]] = []

    def stamp(koma: dict, row: int, col: int) -> None:
        for r, c in shape_cells(koma):
            board[row + r][col + c] = True
            owners[row + r][col + c] = koma["koma_type"]

    def help_link_nibble(kid: int, row: int, col: int) -> int:
        """0, or nibble (bits 8-11) = arrow direction toward an adjacent
        battle koma, only for corpus-linkable ids."""
        if kid not in linkable:
            return 0
        for dname, (dr, dc) in (("up", (-1, 0)), ("down", (1, 0)),
                                ("left", (0, -1)), ("right", (0, 1))):
            rr, cc = row + dr, col + dc
            if 0 <= rr < BOARD_ROWS and 0 <= cc < BOARD_COLS \
                    and owners[rr][cc] == "battle":
                return DIR_NIBBLE[dname] << 8
        return 0

    for i, (koma, flags) in enumerate(selection):
        if flags is not None:
            manual.append((i, koma, flags))
            row, col = (flags >> 4) & 0xF, flags & 0xF
            stamp(koma, row, col)

    pending = [(i, k) for i, (k, f) in enumerate(selection) if f is None]
    # battle first (largest), then supports, then helps
    order = sorted(pending, key=lambda p: (-p[1]["tiles"], p[1]["id"]))
    # helps want a cell directly right of a battle koma -> remember anchors
    battle_anchor: tuple[int, int] | None = None

    for i, koma in order:
        cells = shape_cells(koma)
        placed = False
        if koma["koma_type"] == "help" and battle_anchor is not None:
            # preference 1: free cells orthogonally adjacent to any battle
            # cell (row-major) -> the link nibble has a real target
            cands = []
            for br2 in range(BOARD_ROWS):
                for bc2 in range(BOARD_COLS):
                    if owners[br2][bc2] != "battle":
                        continue
                    for dr, dc in ((-1, 0), (1, 0), (0, -1), (0, 1)):
                        rr2, cc2 = br2 + dr, bc2 + dc
                        if (0 <= rr2 < BOARD_ROWS and 0 <= cc2 < BOARD_COLS
                                and not board[rr2][cc2]
                                and (rr2, cc2) not in cands):
                            cands.append((rr2, cc2))
            for rr, cc in cands:
                board[rr][cc] = True
                owners[rr][cc] = "help"
                results[i] = (help_link_nibble(koma["id"], rr, cc)
                              | (rr << 4) | cc) & 0xFFFF
                placed = True
                break
            if not placed:
                # preference 2: the row of the battle anchor, first free col
                # right of it
                br, bc = battle_anchor
                for cc in range(bc + 1, BOARD_COLS):
                    if not board[br][cc]:
                        board[br][cc] = True
                        owners[br][cc] = "help"
                        results[i] = (help_link_nibble(koma["id"], br, cc)
                                      | (br << 4) | cc) & 0xFFFF
                        placed = True
                        break
            if not placed:
                for rr in range(BOARD_ROWS):
                    for cc in range(BOARD_COLS):
                        if not board[rr][cc]:
                            board[rr][cc] = True
                            owners[rr][cc] = "help"
                            results[i] = (help_link_nibble(koma["id"], rr, cc)
                                          | (rr << 4) | cc) & 0xFFFF
                            placed = True
                            break
                    if placed:
                        break
        else:
            for ar in range(BOARD_ROWS):
                for ac in range(BOARD_COLS):
                    if fits(board, cells, ar, ac):
                        stamp(koma, ar, ac)
                        fl = (ar << 4) | ac
                        if koma["koma_type"] == "battle" and \
                                battle_anchor is None:
                            fl |= 0x1000  # leader: exactly one per deck
                            battle_anchor = (ar, ac)
                        results[i] = fl
                        placed = True
                        break
                if placed:
                    break
        if not placed:
            sys.exit(f"[!] board full: cannot place koma "
                     f"{koma['id']} {koma['name_jp']} "
                     f"({koma['koma_type']}/{koma['tiles']}T)")
        elif koma["koma_type"] == "help" and koma["id"] in linkable \
                and (results[i] >> 8) & 0xF == 0:
            print(f"[i] linkable koma {koma['id']} {koma['name_jp']} placed "
                  f"non-adjacent to any battle koma — no link set "
                  f"(links are optional; see decomp/docs/KOMA_LINKS.md)",
                  file=sys.stderr)

    for i, koma, flags in manual:
        results[i] = flags
    return [r for r in results if r is not None]  # type: ignore[return-value]


def report_boosts(selection: list[tuple[dict, int | None]],
                  flags: list[int], boost_map: dict[str, list[int]]) -> None:
    """Report ally-boost adjacencies (data/kizuna.json). The game computes
    the boost from adjacency itself — this is informational only; the record
    bytes are unchanged."""
    board: dict[tuple[int, int], int] = {}
    for (koma, _), fl in zip(selection, flags):
        row, col = (fl >> 4) & 0xF, fl & 0xF
        for r, c in shape_cells(koma):
            board[(row + r, col + c)] = koma["id"]
    boosts: list[tuple[dict, dict]] = []
    for (koma, _), fl in zip(selection, flags):
        if koma["koma_type"] != "battle":
            continue
        rel_ids = set(boost_map.get(str(koma["id"]), []))
        if not rel_ids:
            continue
        row, col = (fl >> 4) & 0xF, fl & 0xF
        battle_cells = {(row + r, col + c) for r, c in shape_cells(koma)}
        for (k2, _), fl2 in zip(selection, flags):
            if k2["id"] not in rel_ids or k2["koma_type"] not in ("help", "support"):
                continue
            row2, col2 = (fl2 >> 4) & 0xF, fl2 & 0xF
            hit = False
            for r, c in shape_cells(k2):
                rr, cc = row2 + r, col2 + c
                if any((rr + dr, cc + dc) in battle_cells
                       for dr, dc in ((-1, 0), (1, 0), (0, -1), (0, 1))):
                    hit = True
                    break
            if hit:
                boosts.append((koma, k2))
    if boosts:
        print("\nALLY BOOST (kizuna; computed by the game from adjacency):")
        for b, r in boosts:
            print(f"  {b['name_jp']} ({b['id']}) boosted by "
                  f"{r['name_jp']} ({r['id']})")
    else:
        print("\nally boost: none (see decomp/docs/KIZUNA.md)")


def render_board(selection: list[tuple[dict, int | None]],
                 flags: list[int]) -> str:
    grid = [[" . "] * BOARD_COLS for _ in range(BOARD_ROWS)]
    for (koma, _), fl in zip(selection, flags):
        row, col = (fl >> 4) & 0xF, fl & 0xF
        tag = {1: "1", 2: "2", 3: "3"}.get(koma["tiles"], "B")
        if koma["koma_type"] == "battle":
            tag = "L" if fl & 0x1000 else "B"
        for r, c in shape_cells(koma):
            grid[r + row][c + col] = f" {tag} "
    return "\n".join("".join(r) for r in grid)


def build_record(komas: list[tuple[int, int]], name: str) -> bytes:
    rec = bytearray(RECORD_SIZE)
    for i in range(N_SLOTS):
        off = i * 4
        rec[off:off + 4] = b"\xff\xff\x00\x00"
    for i, (kid, flags) in enumerate(komas):
        if i >= N_SLOTS:
            print(f"[!] too many komas ({len(komas)} > {N_SLOTS})",
                  file=sys.stderr)
            return b""
        off = i * 4
        rec[off:off + 2] = kid.to_bytes(2, "little")
        rec[off + 2:off + 4] = flags.to_bytes(2, "little")
    nm = fullwidth_shift_jis(name)
    if len(nm) > RECORD_SIZE - NAME_OFF - 1:
        print("[!] name too long", file=sys.stderr)
        return b""
    rec[NAME_OFF:NAME_OFF + len(nm)] = nm
    return bytes(rec)


def main() -> int:
    ap = argparse.ArgumentParser(
        description=__doc__,
        formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--name", help="deck name (ASCII, emitted full-width)")
    ap.add_argument("--koma", action="append", default=[],
                    help="koma spec: ID | ID:FLAGS | alias | series:name "
                         "[#tiles] (repeatable)")
    ap.add_argument("--assist", action="append", default=[],
                    help="assign an L/R shortcut to a support (2-3T) or "
                         "battle koma: L:<spec> or R:<spec> "
                         "(repeatable; max one L and one R per deck)")
    ap.add_argument("-o", "--out", help="output .bin (92 bytes)")
    ap.add_argument("--search", metavar="QUERY",
                    help="list matching komas and exit")
    args = ap.parse_args()

    sys.stdout.reconfigure(encoding="utf-8")
    db = KomaDB()

    if args.search:
        for k in db.search(args.search):
            print(f"{k['id']:3d} {k['name_jp']:<14} "
                  f"{k.get('name_en', ''):<22} "
                  f"{k['koma_type']:<7} {k['tiles']}T  {k['series']:<3} "
                  f"{k.get('nature') or '':<18} aliases={k['aliases']}")
        return 0

    if not args.name or not args.out or not args.koma:
        ap.error("--name, --koma and --out are required "
                 "(or use --search QUERY)")

    selection: list[tuple[dict, int | None]] = []
    for spec in args.koma:
        if ":" in spec:
            head, fl_s = spec.split(":", 1)
            # "series:name" vs "id:flags" — flags part must be numeric
            try:
                flags = int(fl_s, 0)
                kid = int(head, 0)
            except ValueError:
                selection.append((db.resolve(spec), None))
                continue
            koma = db.by_id.get(kid)
            if koma is None:
                sys.exit(f"[!] unknown koma id {kid}")
            selection.append((koma, flags))
        else:
            selection.append((db.resolve(spec), None))

    # --assist L|R:<spec> — L/R shortcuts (0x2000/0x4000)
    assists: list[tuple[int, int]] = []   # (kid, bit)
    seen_sides: set[str] = set()
    for a in args.assist:
        if ":" not in a:
            sys.exit(f"[!] --assist must be L:<spec> or R:<spec>, got {a!r}")
        side, spec = a.split(":", 1)
        if side not in ("L", "R"):
            sys.exit(f"[!] --assist side must be L or R, got {side!r}")
        if side in seen_sides:
            sys.exit(f"[!] only one {side} assist per deck")
        koma = db.resolve(spec)
        if not (koma["tiles"] in (2, 3) or koma["koma_type"] == "battle"):
            sys.exit(f"[!] L/R assist only on support (2-3T) or battle "
                     f"komas — {koma['id']} {koma['name_jp']} is "
                     f"{koma['koma_type']}/{koma['tiles']}T")
        seen_sides.add(side)
        assists.append((koma["id"], ASSIST_L if side == "L" else ASSIST_R))
    if len({kid for kid, _ in assists}) != len(assists):
        sys.exit("[!] one koma cannot carry both L and R assists")

    # legality checks
    ids = [k["id"] for k, _ in selection]
    if len(ids) > N_SLOTS:
        sys.exit(f"[!] too many komas ({len(ids)} > {N_SLOTS})")
    dups = {i for i in ids if ids.count(i) > 1}
    if dups:
        print(f"[!] duplicate koma ids {sorted(dups)} — "
              f"the game silently dedups (first instance wins)", file=sys.stderr)
    helps = [k for k, _ in selection if k["koma_type"] == "help"]
    supports = [k for k, _ in selection if k["koma_type"] == "support"]
    battles = [k for k, _ in selection if k["koma_type"] == "battle"]
    if not helps:
        print("[!] no help (1-tile) koma — battle will refuse to start",
              file=sys.stderr)
    if not supports:
        print("[!] no support koma — battle will refuse to start",
              file=sys.stderr)
    if not battles:
        print("[!] no battle koma — no leader bit set", file=sys.stderr)
    total_tiles = sum(k["tiles"] for k, _ in selection)
    if total_tiles > BOARD_COLS * BOARD_ROWS:
        sys.exit(f"[!] {total_tiles} tiles exceed the 20-cell board")

    flags = auto_place(selection, db.linkable)
    for kid, bit in assists:
        idx = next(i for i, (k, _) in enumerate(selection) if k["id"] == kid)
        flags[idx] |= bit
    report_boosts(selection, flags, db.boost)

    print("layout (L=leader B=battle, n=tile-count for help/support):")
    print(render_board(selection, flags))
    for (koma, _), fl in zip(selection, flags):
        linkn = (fl >> 8) & 0xF
        glyph = f" link={DIR_GLYPH[linkn]}" if linkn in DIR_GLYPH else ""
        assist = "L" if fl & ASSIST_L else "R" if fl & ASSIST_R else ""
        atag = f" assist={assist}" if assist else ""
        print(f"  {koma['id']:3d} {koma['name_jp']:<14} "
              f"{koma['koma_type']:<7} flags=0x{fl:04X}{glyph}{atag}")

    komas = [(k["id"], fl) for (k, _), fl in zip(selection, flags)]
    rec = build_record(komas, args.name)
    if not rec:
        return 1
    Path(args.out).write_bytes(rec)
    print(f"wrote {args.out} ({len(rec)} bytes): komas={komas} "
          f"name={args.name!r}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
