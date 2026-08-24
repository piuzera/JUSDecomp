# Adding a New Koma — Bare Minimum POC (2026-08-23)

> **Note (2026-08-24):** the `recomp/mods/koma-890-jodio/` example pack built
> from this research was retired from the shipped build (the release now
> bundles `english-translation` only). This document and the tooling
> (`tools/scripts/koma_append.py`, `dtx4_mod.py`) preserve the full recipe.

**Status: COMPLETE, owner-validated in-game.** A "new" 1-tile help koma with a
custom name and a reused effect was created by repurposing the hidden
placeholder **koma id 870 (Ａコマ)**, entirely via runtime RAM injection —
no ROM modification, no code patch. The deck viewer showed the new name
(ＺＯＯ) live, and a deck containing the koma started a battle normally.

Companion docs: [`DECK_FORMAT.md`](DECK_FORMAT.md) (deck records),
[`KOMA_DATABASE.md`](KOMA_DATABASE.md) (890-koma database),
[`KOMA_LINKS.md`](KOMA_LINKS.md) (help-koma link rules).
Tooling: [`tools/scripts/koma_tools.py`](../tools/scripts/koma_tools.py).

## 1. What a koma is made of (ground truth, confirmed this session)

| Piece | File (NitroFS) | Role |
|---|---|---|
| 12-byte record | `bin/koma.bin` (890 × 12 B) | ImageID, effect fields, series/name index, shape ref |
| Display name | `bin/komatxt.bin` (890 × 12-B rel-ptr entries + Shift-JIS blob) | the name shown in deck views |
| Art | `koma/koma.aar` (sprite archive) | selected **by koma id** (see §2) |
| Effect | `unk` record fields → chr ALAR effect tables | help-koma behavior (see §4) |
| Usage | deck record `koma_id` u16 (0–889) | deck injection is the proven path |

## 2. Key discovery: art is id-selected — there is no ImageID lever

- **`koma.bin`'s `ImageID` field equals the koma id for all 890 records**
  (verified programmatically: 0 mismatches). The runtime koma table
  (`ctx[0x30] + kid*0xC`) is a **verbatim copy** of `koma.bin` (record 870
  byte-matched live). The game picks the sprite from `koma/koma.aar` by the
  koma id itself.
- Consequence: a repurposed koma **keeps its own existing art**. Swapping art
  means either repurposing a different id (e.g. 873 コマレッド for mascot art)
  or one of the two custom-pixel routes in §7. The earlier plan phrase
  "ImageID swap" is therefore **retracted** — the field is not a lever.

## 3. Runtime layout (live-probed on the deck editor, port 19888)

- Global battle/deck ctx pointer: `0x0214BD80` (value is scene-dependent;
  deck editor: `0x021DE8E0`). `ctx[0x30]` = koma-table base
  (`0x021E0220` on the deck editor), `ctx[0x18EC]` = record bound (= 890).
- `komatxt` loads into arena buffers whose **addresses move on every screen
  load** (observed: `0x021E873E`, `0x022FACBE`, `0x0229B2FE`). The string
  blob is always a verbatim Shift-JIS copy; the pointer-table entries are
  **rebased** at load (do not match the file bytes).
- Battle loads its own koma table from NitroFS (record 870 observed at
  `0x021AEFE8` during battle).

### Persistence rule (confirmed)

**Every scene/screen transition reloads `koma.bin`/`komatxt.bin` from
NitroFS**, discarding RAM patches. RAM patches are therefore **per-screen**:
patch after the target screen has loaded, and re-apply after any navigation.
The deck viewer renders name labels **live** from the loaded table each
frame/redraw, so a patch applied while the deck is open flips the label
immediately (owner-validated: Ａコマ → ＺＯＯ). The deck editor's koma
**picker list is a snapshot** built at screen open — patching after open does
not change the picker (would need a patch before list build, i.e. a hook, or
the offline ROM route).

## 4. Effect reuse (what was copied)

A 1-tile help koma's behavior is carried by the `unk` record fields
(see [`KOMA_LINKS.md`](KOMA_LINKS.md:89) for the cross-tab analysis):

| Field | Offset | Meaning (best knowledge) |
|---|---|---|
| `unk2` | +2 (u16) | sequential help-koma ordinal (1..226 legit) → help-effect table index |
| `u6` | +6 (u8) | const 2 for 1-tile komas |
| `u7` | +7 (u8) | effect-group id (46 distinct values) |
| `u10` | +10 (u8) | ≈ const 1 |
| `u11` | +11 (u8) | 48/49/50/66 |

POC copied **Sena (id 0)** fields into record 870:
`unk2=1, u6=2, u7=3, u10=1, u11=48`
(record `66 03 32 01 2a 00 02 31 00 00 01 32` →
`66 03 01 00 2a 00 02 03 00 00 01 30`), keeping 870's `image_id`, `ntbl=42`,
`namenum=0`, `kgrp/kelem=0`. Verified in the deck-editor ctx table. The
**battle-time** effect was not exercised: battle reloads the original record
from NitroFS (§3), and the POC koma was placed unlinked, so no help effect
fires anyway. Battle-time effect reuse needs a post-battle-load patch —
open item below.

## 5. Name constraints

- Entry 870's name string is 6 bytes + NUL (7-byte slot, packed directly
  against 871/872's strings). **In-place rewrite caps at 6 Shift-JIS bytes**
  (3 full-width chars, e.g. ＺＯＯ, or 3 half-width katakana). Longer names
  need repointing the komatxt entry at a free string — not implemented.

## 6. Reproduction cheatsheet (all owner-validated)

```bash
# 1. Boot the game with the 100% save (debug server on port 19888):
recomp\play_import100.cmd
#    navigate to the deck select screen and open a deck view.

# 2. Locate the runtime tables (verifies ctx + koma table + name blob):
py tools/scripts/koma_tools.py --port 19888 locate

# 3. Patch id 870: rename + copy donor effect fields (all RAM copies):
py tools/scripts/koma_tools.py --port 19888 patch --id 870 --donor 0 --name "ＺＯＯ"

# 4. Build + inject a deck that uses the new koma:
py tools/scripts/deck_build.py --name NEWKOMA --koma 870:0x0000 ^
    --koma 830:0x0003 --koma 823:0x1001 -o recomp/deck-newkoma.bin
py tools/scripts/deck_tools.py --port 19888 append recomp/deck-newkoma.bin

#    Owner: open deck 30 in the deck viewer -> koma label reads ＺＯＯ;
#    start a battle -> all 3 komas play.
```

`koma_tools.py` also has `find HEX...` (RAM needle scan), `shot`, `tap`,
`key`, `run` for headless/recon use.

## 7. Follow-up roadmap (difficulty ascending)

1. ~~**Custom art — runtime route**~~ — not needed; the offline route below is
   simpler and durable.
2. ~~**Custom art — offline route (durable mod)**~~ — **DONE (2026-08-23,
   owner-validated)**, see §7.
3. **New effect behavior**: RE the chr ALAR help-effect system
   (`unk2`-indexed table; location still unknown — see
   [`KOMA_LINKS.md`](KOMA_LINKS.md:125) open items).
4. **Battle-time effect reuse**: patch the battle-loaded koma table
   (`0x021AEFE8`-style address found post-battle-load) right after battle
   starts; use a linked placement to make the help effect fire.
5. **Editor picker snapshot**: make the picker rebuild from patched data
   (ov005 hook) or accept that the picker shows original names and the deck
   viewer shows patched ones.
6. **Longer names**: repoint komatxt entry 870 to a new string (needs the
   rebased-pointer convention decoded; entries are rebased at load).
7. **Durable name/effect via the ROM route**: apply the same in-place
   ROM-byte replacement to `koma.bin` record 870 and the komatxt name string
   (`find`-locate in the ROM, patch, bump sha1) — now mechanical with the
   §7 pipeline.

## 7. Custom sprite pixels — DONE (2026-08-23, owner-validated)

Koma 870's sprite (`koma/dt_00.dtx`, 1,244 bytes, stored **uncompressed**
inside `koma.aar`) was replaced with a custom white card + red blocky Ｚ,
durable across scenes/reboots (it lives in the ROM). The in-game deck viewer
shows the custom art; battle starts normally. The battle koma panel draws a
dark backdrop behind transparent pixels — fill the whole 48×48 cell to avoid
it (the shipped design does).

**Key facts**
- `image_id == koma id` (§2) ⇒ the sprite for id 870 IS `dt_00.dtx`
  (`KomaName = <series>_<nameNum:D2>`; 870 → `dt_00`).
- `dt_00.dtx` byte layout (verified pixel-perfect against JUSToolkit's
  export AND in-game): `DSTX` hdr (16 B, 1 segment of 6×6 tiles) + embedded
  **DSIG** (12 B hdr + 32 B palette = 16 BGR555 colors + 37 × 32 B 4bpp
  tiles). **Strip tile 0 is the transparent tile; the 48×48 art is strip
  tiles 1..36 in row-major 6×6 order, and within each 8×8 tile the LEFT
  pixel of each byte-pair is the LOW nibble.** (Both facts are easy to get
  wrong — a byte-swapped writer shifts art by 1 px horizontally; the tile
  offset shifts it a whole tile.)
- The game's visible koma window is 46×44 inside the 48×48 tile;
  `paint-png` scales the input art to 46×44 and centers it at (1, 2)
  (owner-validated pixel-perfect).
- The file sits at ROM offset **`0x2BBB53C`** (single occurrence). Because
  the replacement keeps the exact byte size, no NitroFS/FNT/ndstool work is
  needed — plain in-place bytes. Original `rom/jus.nds` is never modified;
  the patched ROM is `recomp/jus-mod.nds`, gated by
  [`recomp/game-mod.toml`](../recomp/game-mod.toml) `[game].sha1` and
  launched by [`recomp/play_mod.cmd`](../recomp/play_mod.cmd).
- JUSToolkit CLI builds and `export-dtx4` works (needed the .NET 10 SDK —
  installed via winget 2026-08-23). Its `import-komas` hits a Texim-version
  bug, so [`tools/scripts/dtx4_mod.py`](../tools/scripts/dtx4_mod.py)
  replaces it (byte-level, deterministic, same-size guaranteed).

**Putting YOUR art in — the full flow**
```bash
# 1. Draw your art (46x44 is ideal — the game's visible koma window; any
#    size is scaled). PNG, alpha channel = transparency.
#    Save as e.g. recomp/my_art.png.

# 2. Build the modded sprite (auto-quantizes to <=15 colors + transparency):
py tools/scripts/dtx4_mod.py paint-png recomp\koma_aar\koma\dt_00.dtx ^
    recomp\my_art.png recomp\dt_00_mod.dtx

# 3. Patch the ROM copy + update the sha1 gate automatically:
py tools/scripts/dtx4_mod.py patch-rom recomp\koma_aar\koma\dt_00.dtx ^
    recomp\dt_00_mod.dtx rom\jus.nds recomp\jus-mod.nds

# 4. Play: recomp\play_mod.cmd   (debug server on port 19888)
#    Then re-inject the test deck (RAM-only, not saved):
py tools/scripts/deck_tools.py --port 19888 koma-unlock-all
py tools/scripts/deck_tools.py --port 19888 append recomp\deck-newkoma.bin
#    Open deck slot N (ＮＥＷＫＯＭＡ) in the deck viewer.
```
`dtx4_mod.py dump <dtx>` shows the parse (header/palette/tile map) for
sanity checks. The `paint` subcommand reproduces the built-in Ｚ design.

**Limitations**
- 1-tile komas only (48×48 = one segment). Multi-tile komas are a
  generalization of the same layout (segment table + more tiles).
- ≤15 colors + transparency (palette index 0 = transparent, unchanged).
- The replacement must stay ≤ the original dtx size (pixel count is fixed
  by the segment table, so in practice sizes match exactly).
- The battle panel draws a dark backdrop under transparent pixels
  (cosmetic; full-bleed art avoids it).

## 9. Appending a NEW koma (id 890) — DONE (2026-08-23, owner-validated)

The placeholder-repurposing shortcut (§2) is superseded for the real thing:
koma **id 890** now exists as a genuine additional entry — its own 12-byte
record, its own deck presence, **its own name ＮＥＷ, its own art slot**, and
it battles. The final release form is §10 (runtime overlays against the stock
ROM); the ROM-patching experiments below established the file formats.

**How the tables grew (offline experiments)**
- `bin/koma.bin` (FAT id 66, ROM `0x7FCC00`, 10,680 B): 72 B of slack after it.
  Appended record 890 (ntbl=42, namenum=20, Sena effect fields) → 10,692 B;
  FAT end `+12`. **The game derives its record count from the file size** —
  the runtime bound (`ctx[0x18EC]`) came up as **891** with no other change.
  Record 890 byte-matched in the runtime table.
- `bin/komatxt.bin` (FAT id 67, ROM `0x7FF600`): appended entry 890 + a name
  string, blob shifted +12, all rel-pointers +12, entry-0 rel doubles as the
  table size (891).
- **"Hardcoded 13,362-byte komatxt size" was a FALSE NEGATIVE.** The first
  RAM scan used wrong codepoints; re-scanning with the correct bytes
  (`82 6D 82 64 82 76` = ＮＥＷ) found **7 hits** in runtime RAM — the game
  loads the full grown file (13,381 B). **No ARM9 patch is needed at all.**

**Key discovery: the display name AND the art are BOTH ImageID-keyed**
- Art: koma 890 with `ImageID=0x0366` renders image 870's sprite — art lookup
  goes through the record's ImageID field, not the koma index.
- Name: the deck viewer shows `komatxt[ImageID]` (890 initially displayed
  Ａコマ = `komatxt[870]`).
- For full uniqueness, record 890's ImageID is now **`0x0367` (871)** (and
  `namenum=1`) → art resolves to **`koma/dt_01.dtx`**, the image slot of
  cheat-only hidden koma 871 — no archive growth needed. `dt_20..dt_27`
  turned out to be the battle's empty-slot templates (§10), not spares. The
  name resolves to `komatxt[871]` (rewritten to ＮＥＷ in place — name lookup
  is ImageID-keyed), so 871 invisibly shares 890's name/art slot.

**Tooling**
- [`tools/scripts/nitrofs_map.py`](../tools/scripts/nitrofs_map.py) — content
  search + FAT cross-ref + slack report.
- [`tools/scripts/koma_append.py`](../tools/scripts/koma_append.py) — builds
  the 891-record/891-entry table files (self-verifying; ImageID 0x037A).
- [`tools/scripts/nitrofs_grow.py`](../tools/scripts/nitrofs_grow.py) —
  in-place FAT growth + sha1 re-gate (idempotent, slack-checked) — superseded
  by the overlay route for releases (§10), kept for ROM-patch experiments.
- Deck: 92-byte record with slot 0 = `890:0x0000` (+ Zoro `830:0x0003`,
  Luffy `823:0x1001`) — `recomp/deck-newkoma890.bin`; inject via
  `deck_tools.py append` (RAM-only, re-inject after each boot).

## 10. Runtime file overlays (Riivolution-style) — the release route

**Principle: users keep their own ROM.** Nothing is patched into the ROM
image; instead the **runner** intercepts every gamecard read and serves
modded bytes from host files. This is Brawl-modding's Riivolution model,
implemented inside `nds_runner`:

- `[[mods.overlays]]` config entries: `offset` (absolute ROM offset) +
  `file` (host path). Each overlay shadows `ROM[offset, offset+size)` for
  **every** gamecard read ([`io.cpp` card_copy_rom](../tools/ndsrecomp/runner/src/io.cpp:265)).
- **Growth is supported**: for NitroFS files that grow, the mod also overlays
  the file's **FAT entry** (start/end) so the game sees the new size. The
  data must fit in the slack before the next FAT extent.
- **Archive-internal members** (`koma.aar/koma/dt_01.dtx`) become same-size
  sub-range overlays resolved by ALAR3 member **name** (content collisions
  don't matter). Archive growth needs an archive rebuild — donating a
  hidden koma's slot avoids that entirely (see the collision note below).
- **Slot collision found (2026-08-23)**: `dt_20..dt_27` are NOT spares —
  they are the battle screen's **empty-slot templates** for koma sizes 1..8
  (stock `dt_20` = plain white square; painting it made every empty battle
  slot show the new art). The mod therefore donates **`dt_01.dtx`**
  (cheat-only hidden koma 871's image, unreachable in normal play) to koma
  890 instead: record 890 gets `ImageID=0x0367` **and** `namenum=1` (both
  art-lookup keys resolve to `dt_01`), and `komatxt[871]`'s string is
  rewritten to ＮＥＷ in place (name lookup is ImageID-keyed). Hidden koma
  871 invisibly shares the name/art slot — the one caveat.
- The ROM stays byte-identical: [`recomp/game-mod.toml`](../recomp/game-mod.toml)
  keeps `[game].sha1` at the **stock** dump hash, so any legitimately-ripped
  copy of JUS works.

**The unique-koma 890 mod set** (`recomp/mods/`, mirrors the NitroFS tree):

| Mod file | Target (stock ROM) | Effect |
|---|---|---|
| `mods/bin/koma.bin` | `0x7FCC00` (FAT 66) | 891 records; record 890 ImageID 0x0367, namenum=1 |
| `mods/_fat_66.bin` | FAT entry 66 | extent 10,680 → 10,692 B |
| `mods/bin/komatxt.bin` | `0x7FF600` (FAT 67) | 891 entries; entries 871 + 890 = ＮＥＷ |
| `mods/_fat_67.bin` | FAT entry 67 | extent 13,362 → 13,381 B |
| `mods/koma/koma.aar/koma/dt_01.dtx` | `0x2BBBA18` | koma 890's own art (white card + red Ｚ) |

`recomp/mods.toml` is generated by
[`tools/scripts/mods_build.py`](../tools/scripts/mods_build.py) (content
search + FAT cross-ref + slack check + ALAR3 member resolve);
[`recomp/game-mod.toml`](../recomp/game-mod.toml) carries the same overlay
block alongside the stock sha1 gate. [`recomp/apply_overlays_check.py`](../recomp/apply_overlays_check.py)
pre-flights the config by applying it to an in-memory ROM copy and asserting
the game-visible artifacts.

**Release flow (all owner-validated)**
```bash
# Change mods in recomp/mods/, then:
py tools/scripts/mods_build.py rom\jus.nds recomp\mods recomp\mods.toml
#   paste the [[mods.overlays]] block from mods.toml into game-mod.toml
recomp\play_mod.cmd          # boots rom\jus.nds (STOCK) + overlays, port 19888
py tools/scripts/deck_tools.py --port 19888 append recomp\deck-newkoma890.bin
# Owner: deck viewer -> koma 890 shows ＮＥＷ + its own art; battle runs.
```

**Follow-ups**: config-driven deck auto-inject (so the test deck survives
reboots without the debug-server step); multi-tile art segments; a real
effect (chr ALAR RE); a `mods/` pack format (zip + manifest) for end users.

## 11. "Jodio" + a BRAND-NEW CUSTOM series — RE notes (IN PROGRESS, paused 2026-08-23)

Goal (owner): koma 890 renamed **Jodio** (art = owner's PNG), placed in a
**newly-created series** (ntbl 43, "カスタム"/CUSTOM) — not in any existing
series, no renaming of existing ones. All via `[[mods.overlays]]`; ROM
untouched.

### Picker mechanics (all empirically proven this session)

| Display path | Lookup key | Evidence |
|---|---|---|
| Picker **row list** | record ids 0..890 (record 890 IS listed) | Jodio row visible under the catch-all tab |
| Picker **row name** | `komatxt[record_id]` string | row 871 showed ジョディオ/ＪＯＤＩＯ when entry 871 was edited |
| Picker **row tile art** | `koma.aar` member `{prefix(ntbl)}_{namenum:02d}` | ntbl 14 + namenum 29 painted the tile with Gyro's `jj_29`; ntbl 42 + namenum 1 → `dt_01` |
| Picker **category** | `record.ntbl` | record 871 with ntbl 14 moved into the JoJo tab (picking it stored 871 → deck tile showed Jotaro `jj_00` + name Ａコマ) |
| Deck tile **name** (after pick) | `komatxt[record.ImageID]` | 871 with ImageID 870 → Ａコマ |
| Detail **art** | image table by ImageID (871 → `dt_01`) | all iterations |
| ntbl 42 (hidden "dt") | catch-all tab labeled ジャンプ (string in ov001 @ 0x1CFE8 file offset 118760) | all iterations; category stayed "JUMP" for ntbl 42 |

- **ASCII names render BLANK** (the koma-name font has no ASCII glyphs) and
  an odd-length ASCII string appears to hang the detail screen on select.
  Use full-width Latin (ＪＯＤＩＯ), the game's own convention (ＤＩＯ).
- Duplicating Jotaro's `komatxt` unk fields (0x00024815/0x0000006E) onto
  entries 871+890 did NOT move the category; those fields are per-character
  name/icon metadata, not the series key.

### Series machinery (where the data lives)

- **`bin/piece.bin`** = per-series table (deck-builder ov005 reads it;
  `piece.bin`/`infoname.bin` path strings are in ov005 @ 0x25518/0x24650).
  Format (JUSToolkit `PieceEntry`): `count u32 @ 0` (=41), then 41 × **0x60-
  byte records** at `4 + i*0x60`, each = 23 **relative** u32 string pointers
  (Title + 2 Authors + 2 Info + 9 Page1 + 9 Page2; rel = str_off −
  record_off, same convention as komatxt) + `Unk1 u16 @ +0x5C` + `Id u16
  @ +0x5E`. Strings follow the records. 41 visible series ↔ ntbl 1..41;
  ntbl 0 = null, ntbl 42 = hidden dt (no piece record).
- **Series-name strings** (ワンピース / ジョジョの奇妙な冒険 / ドラゴンボール)
  live ONLY in piece.bin (searched all overlays + arm9: not present).
- **`ジャンプ`** catch-all label = ov001 string @ file offset 118760
  (RAM 0x02167E48). No absolute pointer references it in ov001 (indirect
  string table — find the relative-pointer table around it next session).
- **Prefix table** = JUSToolkit `Koma.cs` NameTable, 43 entries in ntbl
  order: `[null, es, is, ig, tr, ct, gt, kn, kk, cb, oj, nb, sk, tc, jj,
  sd, ss, tz, to, dg, dn, ds, tl, db, na, nk, hh, pj, bu, bc, bl, hs, hk,
  bb, nn, mo, mr, yo, yh, rk, rb, op, dt]` (ntbl 14 = jj ✓, ntbl 42 = dt).
  The game's copy of this mapping has not been located yet (not a plain
  byte array in arm9/ov005 — likely built at runtime from piece.bin Ids).
- **Overlays are UNCOMPRESSED** (`extract/arm9_overlays/overlays.yaml`,
  all `compressed: false`, load base 0x0214AE60 = 34917664, custom loader,
  `file_id` = NitroFS file id) ⇒ byte-level overlays of ov*.bin work
  directly. arm9.bin reads koma.bin/komatxt.bin/kshape.bin; ov000 reads
  koma.bin; ov005 reads piece.bin + infoname.bin; ov012 reads infoname.bin.

### Next-session plan (brand-new series, ntbl 43)

1. Parse all 41 piece.bin records (Title + Id + Unk1) — see
   `recomp/piece_analyze.py` (scratch, fix the str-decoding errors) — and
   confirm `Id` == ntbl and whether ov005 builds the tab list from piece
   records (count u32@0) or a hardcoded 43.
2. If tabs come from piece.bin: append a 42nd record (0x60 B) with Title
   "カスタム" (+ NUL, appended at EOF), Id = 0x2B (43), Unk1 copied from a
   sample record; count 41→42. Growth ≈ 105 B — check piece.bin FAT slack
   via `tools/scripts/mods_build.py` (raises if slack is short; locate FAT
   id with `nitrofs_map.py`).
3. Tab icon source TBD (piece Unk1? a per-series icon id elsewhere?).
   Copy an existing series' icon value initially; custom icon later.
4. koma.bin: record 890 = ImageID 0x0367, ntbl **43**, namenum 1, Sena's
   effect fields; **restore record 871 to stock** (ImageID 0x0367, ntbl 42,
   namenum 1) — undo the iteration-3 clone that caused the "Jotaro
   transform" confusion.
5. komatxt: entries 871 + 890 → "ＪＯＤＩＯ"; entry 890 keeps 870's unk
   (validated); entry 871 keeps its own unk.
6. Tile art: with ntbl 43 the tile resolves via `prefix[43]_namenum` — the
   prefix mapping for 43 must be made to resolve to an existing prefix
   (e.g. point it at `dt`) or the tile breaks; verify in ov005 how the
   member name is composed and where `prefix[ntbl]` comes from.
7. Rebuild mods → mods_build → game-mod.toml → owner verification: Jodio
   appears in the NEW CUSTOM tab with ＪＯＤＩＯ + owner art, pickable,
   battle OK.

### Current shipped state (iteration 3, functional but with artifacts)

`recomp/mods/` currently carries the iteration-3 experiment: record 871
cloned onto 870 with ntbl 14 (category lever), record 890 ntbl 42. Known
artifacts: picking the JoJo-tab row (871) yields Jotaro art + Ａコマ; the
JUMP tab shows record 890 as ＪＯＤＩＯ. Superseded by the plan above;
`tools/scripts/koma_append.py` documents the iteration-3 design in its
docstring (update when building the new-series config).

## 8. Difficulty answer (the original question)

Bare-minimum "new" 1-koma helper via runtime injection: **easy — done in one
session** (name + effect = 2 RAM writes; usage = proven deck injection).
Custom sprite pixels: **done the same day** via the offline in-place ROM
route (`dtx4_mod.py paint-png` + `patch-rom`) — harder than the bare
minimum, but no ndstool/NitroFS work was needed because the sprite is stored
uncompressed and the replacement is size-preserving. Genuinely **new effect
behavior** (chr ALAR RE) remains the one untouched hard part.
