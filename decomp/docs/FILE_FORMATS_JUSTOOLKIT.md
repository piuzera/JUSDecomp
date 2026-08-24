# File Formats — Reused from JUSToolkit (priverop/JUSToolkit)

Source: https://github.com/priverop/JUSToolkit (C#/.NET, MIT-style license, active project
specifically targeting **Jump Ultimate Stars**). Confirmed exact-game-match: its `Koma`
name table includes `"op"` (One Piece = Luffy's series) at the correct index, and its
12-byte `KomaElement` record size matches our own byte inspection of `extract/files/bin/
koma.bin` from reconnaissance. This is a **major cost-saver** — reuse instead of
re-deriving these formats from scratch.

Original lower-level spec source (referenced by JUSToolkit itself): an archived English
community wiki: https://web.archive.org/web/20100111220659/http://jumpstars.wikispaces.com/File+Formats

Status: **confirmed** (verbatim from JUSToolkit source + docs, cross-checked against our
own byte dumps in `FILE_FORMATS.md`).

## Archive: `.aar` (ALAR)

Two sub-versions:
- **ALAR Type 2**: header + `NumberFiles` `ALAR_2_Index` entries (`type, start, size,
  4 unknown bytes` per entry), then padding, then file data.
- **ALAR Type 3** (used by `ChrArc.aar` — the big 7.36 MB character archive): more
  complex, includes a `FileTableIndex[]` lookup array before per-file headers
  (`FileID, start, size, ..., FileName[18]`) — **this is the character sprite/data
  archive we need for Luffy.**

## Compression: `DSCP` tag

Resolves our earlier "unknown DSCP magic" finding from reconnaissance
(`FILE_FORMATS.md` flagged this as unidentified) — **confirmed**: DSCP = GBA-style LZSS
compression header wrapping a compressed payload (likely wrapping ALAR/ATM/DIG files
when compression is used instead of raw storage).

## Sprite: `.dig` (DSIG)

Two sub-versions; DSIG Type 2 supports multiple animation frames, each frame prefixed
with a 4-byte LZSS header. Contains palette(s) + pixel data.

## Tile arrangement: `.dtx`/`.atm` (DSTX/ALTM family)

`DSTX_Type_1`/`DSTX_Type_2` describe tile block arrangements (1x1 up to 8x4 blocks) used
to compose sprites from DIG tile data — the "Type 2" variant is explicitly called out by
the original wiki author as complex ("this type is the devil").

## Koma sprite format — `DSTX04` / `koma.bin` / `KShape` (the deck-building visual data)

This is the format most directly relevant to **deck building**:

- **`koma.bin`**: array of 12-byte `KomaElement` records:
  `ImageID(u16), Unknown(u16), NameTableIdx(u8), NameNum(u8), Unknown(u8)x2,
  KShapeGroupIdx(u8), KShapeElementIdx(u8), Unknown(u8)x2`. Confirmed identical
  structure to what we found via our own hex dump in reconnaissance.
- **Koma name table**: 43-entry table mapping name-table index → 2-letter series code
  (e.g. `op` = One Piece/Luffy, `bl` = Bleach, `nn` = Naruto, etc.) — full table captured
  in `decomp/docs/GAME_SYSTEMS.md` addendum (see below).
- **`KShape`** data: 8 groups (indexed by koma piece size: 1,2,4,6,8-tile shapes etc.),
  each group listing possible shape variants (e.g. a 2-tile piece has horizontal +
  vertical variants = 2 shapes in group 1). Each `KShapeInfo` (0x18 bytes) is a 0x14-byte
  segment map (which 48×48 px segments are filled, for sprite reconstruction) + 4 bytes
  unknown.
- Lookup: `entry_offset = 0x40 + ((group_first_index[KShapeGroupIdx] + KShapeElementIdx) * 0x18)`.

**Important scoping note**: this documents the koma's **visual sprite shape** (which
48×48 segments are drawn) — it does NOT by itself give us grid-placement legality rules
(how shapes tile together on the deck-building grid) or stat/HP/ability data. Those still
require our own reverse engineering (see `GAME_SYSTEMS.md` / `TODO.md`).

## Move file: `.atm`/`.amt` (ALMT) — relevant to Luffy's battle moves

```c
struct ALMT {
    char id[4];        // "ALTM"
    byte unknown1;
    byte unknown2;
    byte count1;
    byte count2;
    dword count3;
    char unknown[count1*4];
    dword data_offsets[count2];
    word string_offsets[count3];  // null-terminated strings, each preceded by unknown word
};
```

Documented only at the header level by the original wiki source — the per-move data
layout it points to (`data_offsets`) is NOT yet documented publicly. **This is likely
where Luffy's actual move properties (damage, startup/active frames, hitbox shape) live**
— a high-value target for our own RE work, informed by this header structure as a
starting point rather than starting blind.

## Corrections & additions from our own port (2026-08-23, `tools/scripts/koma_harvest.py`)

- **Pointer convention**: all these text tables use **relative pointers** — the
  u32 at field offset P points to `P + value` (`JusText.ReadIndirectString`).
  Strings are **plain Shift-JIS**, null-terminated. Our earlier
  absolute-offset dumps (`recomp/*.dump.txt`) were garbled for exactly this
  reason; there is no custom text encoding. Entry-count trick: for
  entries-at-offset-0 tables, `count = u32@0 / entry_size` (entry 0's pointer
  doubles as the table size). `pname.bin` instead stores an explicit u32 count.
- **Series table location**: the 43-entry NTbl→2-letter-code table is in
  `src/JUS.Tool/Graphics/Koma.cs` (`NameTable`), not a data file. NTbl 41 = `op`
  (One Piece), runtime-confirmed.
- **`komatxt.bin` is the master per-koma name table**: 890 × 12-byte entries,
  **indexed by koma.bin index** (entry 0 = セナ = koma 0 ✓).
- **Actual entry counts**: `chr_b_t.bin` = **74** battle characters (0xD4
  entries, 51 pointer fields each — the source of the old "51 pointers" note);
  `chr_s_t.bin` = **193** support characters (0x24 entries);
  `infoname.bin` = 42 entries, but they are **each NTbl's representative
  support character** (infoname[i] ↔ NTbl i), NOT series names — e.g. [41] =
  チョッパー (Chopper, One Piece); `pname.bin` = **89** epithets;
  `piece.bin` = **41** per-series manga entries (title/authors/magazine-run;
  piece[i] ↔ NTbl i+1).
- **`kshape.bin` decoded**: 8 groups, 66 shapes; **tiles = group + 1** holds for
  every shape; the 0x14-byte segment map is the deck-board occupancy
  (5 cols × 4 rows of 48×48 cells, row-major byte = r*5+c; nonzero = filled).
  E.g. Luffy 4-koma (group 3, elem 0) = 2×2 block.
- Machine-readable output of all of the above: `data/koma_db.json` (+ `.csv`,
  + auto-generated `decomp/docs/KOMA_DATABASE.md`).

## Reproducibility / next steps

- JUSToolkit is a .NET tool (`JUS.CLI`) — we can either invoke it directly (if .NET SDK is
  available) to batch-extract Luffy's sprites/data, or port just the relevant C# reader
  logic into our own Python/C++ pipeline (simpler, no .NET dependency for our shipped
  engine). **Recommendation: use the CLI for one-time asset extraction during development;
  do not depend on .NET at runtime for the shipped game.**
- Still needed (not covered by JUSToolkit per its own docs): character stat tables
  (`chr_b.bin`/`chr_s.bin`/`ability.bin`), deck-building grid placement/legality rules,
  and move data body (`ALMT`'s `data_offsets` targets). These remain our own RE work.
