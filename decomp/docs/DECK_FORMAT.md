# Deck Format — Reverse-Engineered & Runtime-Confirmed (JUS Decomp original work)

This format is **not** covered by JUSToolkit (its `Deck`/`PDeck` classes treat the koma
slot data as an opaque "Header" byte blob — see `FILE_FORMATS_JUSTOOLKIT.md`). Everything
below is our own reverse engineering, done 2026-08-20 (static, from `Deck.aar`) and
**runtime-confirmed 2026-08-22** via the ndsrecomp runner + live deck oracle (a user-built
deck: Sena 1-koma / Luffy 4-koma / Zoro 2-koma, and two injected decks — a byte-copied
append and an authored deck — both accepted by the game, shown in the deck list, and
battle-started).

## Source data

`extract/files/deck/Deck.aar` — ALAR type 3 archive, 370 files, each 92 bytes
(`0x5C`, matching JUSToolkit's `Deck.FileSize` constant exactly).

Extraction tool: `tools/scripts/alar_extract.py`.

## Byte layout (runtime-confirmed via live deck records)

```
Offset  Size  Field
0x00    4*16  Koma slot array — 16 slots, each:
              { u16 koma_id, u16 flags }   koma_id = direct bin/koma.bin index (0-889)
                                           0xFFFF = empty slot
0x40    ...   Null-terminated deck name (Shift-JIS; JUS deck names use the full-width
              font, e.g. ASCII "DEBUG" is stored as 0x8263 0x8264 0x8261 0x8274 0x8266
              = ＤＥＢＵＧ)
```

The earlier "0x18-byte header + 10 slots at 0x18" hypothesis is **retracted**: the bytes
we read as "header" were simply slots 0–5, and the "10 slots" were slots 6–15. A live
deck with 3 komas showed exactly 3 non-`0xFFFF` entries in slots 0/1/2 and the name at
0x40, and the OP1 preset (`jadv/003.bin`) starts with slot 0 = Luffy 4-koma.

## Runtime-confirmed koma ids (live oracle, 2026-08-22)

| Koma | koma_id (koma.bin index) | NameTableIdx | Notes |
|---|---|---|---|
| Sena 1-koma (Eyeshield 21) | `0` | 1 | NTbl 1 = Eyeshield 21 (indices 0-32) |
| **Luffy 4-koma (One Piece)** | **`823` (`0x0337`)** | **41** | NTbl 41 = One Piece (indices 820-869) |
| Zoro 2-koma (One Piece) | `830` (`0x033E`) | 41 | same series as Luffy |

The previous claim "op (One Piece) = NameTableIdx 3, indices 41-55" (TODO.md, 2026-08-20)
is **retracted** — the live oracle placed both Luffy and Zoro komas in **NameTableIdx 41**,
and the OP1 preset (`jadv/003.bin`, name `ＯＰ１`) consists entirely of NTbl 41 komas.
NTbl 3 is a different series (15 entries).

## Slot flags — DECODED (live oracle + preset cross-check, 2026-08-22; link
## direction SOLVED 2026-08-23)

```
flags = (leader << 12) | (link_nibble << 8) | (row << 4) | col
```

- Board: **5 columns × 4 rows**, no rotation — every koma has a fixed Tetris-like
  shape (owner-confirmed; `KShapeGroupIdx`/`KShapeElementIdx` select it from
  `kshape.bin`).
- `col` = bits 0-3 (0..4), `row` = bits 4-7 (0..3) — the piece's top-left anchor cell.
- `leader` = bit 12 (`0x1000`) — battle-koma tag (4+ koma only).
- `link_nibble` = bits 8-11 — **SOLVED (2026-08-23)**: the direction the 1-koma's
  link arrow points toward the koma it links to —
  `1` = down, `2` = left, `3` = up, `4` = right (`0` = no link).
  Proof: 464/464 preset-corpus adjacency hits (only 461/464 if targets are
  restricted to battle komas — 3 corpus decks link 1-komas to SUPPORT komas) +
  live in-game arrow check on 4 injected direction decks.
  **Links are optional**: an unlinked, even non-adjacent 1-koma is accepted and
  battle starts (live-tested with Sena 2026-08-23). Per-id linkability
  (211 linkable / 15 standalone / 101 unknown) in `data/koma_linkable.json`;
  full report in [`KOMA_LINKS.md`](KOMA_LINKS.md).
- `assist` = bit 13/14 — **L/R shortcut tags** (owner-confirmed in deck viewer
  2026-08-23): `0x2000` = **L** shortcut, `0x4000` = **R** shortcut. Placeable
  on **support komas (2–3 tiles)** and **battle komas (4–8 tiles)** (battle =
  "switch to this character" shortcut). At most **one L and one R per deck**;
  never both bits on the same slot. `0x8000` (bit 15) never observed.

Verification anchors (all consistent):

| Piece | flags | Position (row, col) |
|---|---|---|
| Sena 1-koma, linked (live) | `0x0400` | (0, 0) |
| Luffy 4-koma, leader (live) | `0x1001` | (0, 1) |
| Zoro 2-koma (live) | `0x0003` | (0, 3) |
| Luffy 4-koma, leader (OP1) | `0x1003` | (0, 3) |
| Luffy 5-koma (`jadv/023.bin`) | `0x0020` | (2, 0) |

Runtime semantics (CHEAT experiments, 2026-08-22):

- **Duplicate koma ids are silently deduped** by the game (deck view and battle) —
  the first instance wins; no crash, no error. Four identical Luffys render/play
  as one.
- Different koma ids of the same series coexist fine (Luffy 4-koma + Luffy
  5-koma + Zoro + Sena deck battles normally).
- Battle requires at least one 1-koma and one support koma, else the game
  refuses to start.

## Verified example (live oracle, 2026-08-22)

| File/source | Slots (koma_id/flags) | Meaning |
|---|---|---|
| user-built deck (RAM `0x020B0DBC`) | `0/0x0400`, `823/0x1001`, `830/0x0003` | Sena 1K + Luffy 4K + Zoro 2K |
| `jadv/003.bin` (`ＯＰ１`) | `823/0x1003`, `853/0x0000`, `838/0x0023`, `830/0x0021`, `868/0x0012`, `862/0x0410`, `857/0x0020` | One Piece preset, all NTbl 41 |
| `007.bin` (2026-08-20) | `0x00d6`, `0x00e3`, `0x00ea` | nn_02, nn_15, nn_22 (Naruto) — slots are at 0x00.., not 0x18 |

## Runtime deck table (main RAM) — see DECK_INJECTION.md

The 92-byte preset format above is **also the runtime deck-record format**. The
game keeps two 50-slot deck tables in main-RAM BSS, each record 92 bytes (`0x5C`),
mirroring `Deck.aar` exactly:

- Deck table 1 (player decks): `0x020B0DBC`, count at `0x020B0D6C` (u8).
- Deck table 2 (rival/received): `0x020B2E8C`, count at `0x020B0D6D` (u8).
- Per-deck aux metadata: `0x020B1FB4`, 76 bytes (`0x4C`) per deck.

Injection (2026-08-22, user-validated): `tools/scripts/deck_tools.py append` writes a
92-byte record at `0x020B0DBC + count*0x5C`, zeroes the aux entry, bumps the count byte —
mimicking `Deck_Append` (`func_020723cc`). A copied record and a fully authored record
(`tools/scripts/deck_build.py`) both appeared in the deck list; the authored ＰＯＣ deck
(Luffy 4-koma + Sena 1-koma + Zoro 2-koma) loaded with correct komas and started a battle.

## What's still needed for a faithful deck-builder (not yet done)

1. ~~**Link-direction bits**~~ — **SOLVED (2026-08-23)**: nibble = direction enum
   {1: down, 2: left, 3: up, 4: right}; see `KOMA_LINKS.md`.
2. **Find deck point-cost / size-limit rule** — likely in game code (ov001 or ov005),
   not purely data. Governs *how many* koma and *which combinations* are legal.
3. ~~**Kizuna (support/bond) pairing rule**~~ — **SOLVED (2026-08-23)**: the ally
   boost carries **no deck-record flag**; the game computes it from adjacency +
   per-battle-character relations (`chr_b_t.bin` unk triplets = related
   characters' 1-koma ids). See [`KIZUNA.md`](KIZUNA.md) and
   `data/kizuna.json`.
4. **Editor-level "must link" rule** (owner-reported) — the in-game deck editor
   appears to force links for some 1-komas when saving; locate in ov001/ov005
   (battle start from injected decks is unaffected — links are optional there).
5. **`0x8000` (bit 15)** — never set in any preset; unknown/reserved.

## Confidence summary

| Finding | Confidence |
|---|---|
| Deck.aar is ALAR type 3, 370 files, 92 bytes each | Confirmed (extraction + size match) |
| Record layout: 16 × `{koma_id u16, flags u16}` slots + Shift-JIS name at 0x40 | **Confirmed (runtime: live deck records + injected decks accepted)** |
| `koma_id` is a direct koma.bin index | **Confirmed (live oracle: Sena=0, Luffy 4-koma=823, Zoro=830)** |
| `0xFFFF` = empty slot | Confirmed |
| Name is Shift-JIS, full-width font | Confirmed (ＺＸＹ chars in live records) |
| `flags` u16 = `(leader<<12)|(link<<10)|(row<<4)|col`, 5×4 grid, no rotation | **Confirmed (live anchors + preset cross-check)** |
| Duplicate koma ids are silently deduped; battle needs >=1 1-koma and >=1 support | Confirmed (CHEAT experiments) |
| NameTableIdx 41 = One Piece; NTbl 1 = Eyeshield 21 | Confirmed (live oracle + OP1 preset) |
