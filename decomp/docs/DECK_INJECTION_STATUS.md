# Deck Injection — Status & Handoff (2026-08-22, CLOSED OUT)

> **Next-session goals (owner): harvest koma IDs for ALL komas, and fully
> understand the deck slot flags.** Everything known for those two goals is
> consolidated in the "Next session" section at the bottom.

**Status: POC COMPLETE.** The Luffy 4-koma POC deck was authored, injected into
the running game, and owner-validated (deck list shows it, komas correct, battle
starts). Companion docs:

- [`DECK_INJECTION.md`](DECK_INJECTION.md) — static findings (runtime-corrected).
- [`DECK_FORMAT.md`](DECK_FORMAT.md) — the 92-byte deck record format (runtime-confirmed).
- [`plans/deck-injection-plan.md`](../plans/deck-injection-plan.md) — the phased plan.
- [`deep-research-ar.md`](../deep-research-ar.md) — the Action Replay research that seeded this.

## What was DONE (all owner-validated)

| Step | Result |
|---|---|
| Runtime probe | Deck table 1 (player) confirmed at `0x020B0DBC`, count `0x020B0D6C`; table 2 at `0x020B2E8C`, count `0x020B0D6D`. `.sav` mapping corrected: records at **`0xB0C + slot*0x5C`** (not `0xB04`), counts at `0xAB5` (table1) / `0xAB4` (table2), 8-byte region headers at `0xB04`/`0x2BD4`. |
| Record format | **16 slots × `{u16 koma_id, u16 flags}` at 0x00–0x3F, Shift-JIS name at 0x40.** The old "0x18 header + 10 slots" reading was wrong. |
| Koma identification | **Luffy 4-koma = koma.bin index `823`**, Zoro 2-koma = `830`, Sena 1-koma (Eyeshield 21) = `0`, Luffy 5-koma = `824`. One Piece = **NameTableIdx 41** (retracts "op = NTbl 3"). |
| Slot flags | **Decoded**: `flags = (leader << 12) | (link << 10) | (row << 4) | col`; board 5 cols × 4 rows, no rotation (owner-confirmed). |
| Copy round-trip POC | `deck_tools.py append` of a copied record → visible in the deck list. |
| Author + inject POC | `deck_build.py` → 92-byte record `ＰＯＣ` (Sena 1K + Luffy 4K + Zoro 2K) → appended → deck list shows it, correct komas, **battle starts**. |
| CHEAT experiments (owner-curiosity) | (1) Four identical Luffy 4-komas → **only one renders/plays — duplicate koma ids are silently deduped, no crash**. (2) Luffy 4K + Luffy 5K + Zoro + Sena → all render, battle fine. (3) Battle refuses to start unless the deck has ≥1 1-koma and ≥1 support koma. |
| `prepare_jus.py` | Fixed to emit `save_type = "eeprom"` (+ the SAVEBUG comment and the `[[controls.taps]]` doc block); regen output is byte-identical to the checked-in `game.toml`. |

## Tooling (all live-tested)

| Script | Purpose |
|---|---|
| [`tools/scripts/deck_probe.py`](../tools/scripts/deck_probe.py) | read-only runtime probe (16-slot decode, corrected save diff) |
| [`tools/scripts/deck_tools.py`](../tools/scripts/deck_tools.py) | dump/export/import/copy/append/select/koma-unlock-all |
| [`tools/scripts/deck_build.py`](../tools/scripts/deck_build.py) | author a 92-byte record from `--name` + `--koma ID:FLAGS` |
| [`tools/scripts/jus_debug_client.py`](../tools/scripts/jus_debug_client.py) | debug-server client |

Runner side (unchanged this session): `write_mem` in
[`debug_server.cpp`](../tools/ndsrecomp/runner/src/debug_server.cpp) through
[`bus_debug_write8`](../tools/ndsrecomp/runner/src/bus.cpp) — correct write provenance.

## How to re-run the injection

```bash
# 1. Boot the game with the 100% save (debug server on port 19888):
recomp\play_import100.cmd

# 2. Author a deck (ids are koma.bin indices):
py tools/scripts/deck_build.py --name POC \
    --koma 0:0x0400 --koma 823:0x1001 --koma 830:0x0003 -o recomp/deck-poc.bin

# 3. Inject + verify:
py tools/scripts/deck_tools.py --port 19888 append recomp/deck-poc.bin
py tools/scripts/deck_tools.py --port 19888 dump
```

Known-good slot flags (placement/rotation, cribbed from live/preset decks):
1-koma `0x0400`/`0x0000`, 2-koma `0x0003`/`0x0021`, 4-koma `0x1001`/`0x1003`.

## Still open (non-blocking)

1. **Link-direction bits** — the 1-koma `link` tag's direction encoding
   (`0x0400` observed = pointing right; other directions unconfirmed).
2. **Deck legality rule** (point cost / size limits) — likely ov001/ov005.
3. **`.sav` region headers** — the 8 bytes at `0xB04`/`0x2BD4` (checksum?) are
   unidentified.
4. **Offline `.sav` route** — now possible in principle: records at `0xB0C +
   slot*0x5C`; still needs the save-format write/checksum handling (ties into
   the open `SAVEBUG.md` imported-save-recognition work).
5. **Persistence of injected decks** — `write_mem` does not mark the save range
   dirty; the deck persists only if the game saves afterwards. An explicit
   `Save_MarkRangeDirty` poke (or an in-game save) would make injection stick.

## Session notes / gotchas

- The interactive runner uses the debug server on the `--port` given
  (play cmds use 19888; `run_jus.sh interactive` defaults to 19842).
- Windows console cp1252 mangles Shift-JIS deck names — the tool scripts now
  `sys.stdout.reconfigure(encoding="utf-8")`.
- Injected records are 92 bytes exactly; empty slot = `FF FF 00 00`.
- Deck names are stored full-width Shift-JIS (ASCII "DEBUG" → `ＤＥＢＵＧ`);
  `deck_build.py --name` handles the conversion.

## FOLLOW-UP SESSION (2026-08-23) — Goal A COMPLETE: koma database

### External enrichment (owner's "Jump Database" project)

Merged the owner's prior koma database (`E:\Jump Database\jus-deck-builder`,
copied to `data/koma_external.csv`) into the harvest pipeline. It supplies
**English names, series, nature (力/知/笑), shape-variant codes, and battle
stats** for the 868 legitimately-obtainable komas (it omits the 22
cheat-only komas — the NTbl 42 specials block plus 7 in-series). Alignment is
per-series via `difflib` on tile sequences; 863/868 rows map cleanly, the
remaining 5 sit in unobtainable-dense regions and are left unmapped rather
than guessed. English names auto-seed aliases (e.g. 超べジータ → `vegeta-ssj`,
ルフィ（ギア２） → `luffy-gear-2`), so `deck_build.py` now accepts
`--koma db:vegeta-ssj` etc. directly.

## FOLLOW-UP SESSION (2026-08-23) — Goal A COMPLETE: koma database

**All 890 komas identified.** Artifacts:

- `tools/scripts/koma_harvest.py` — offline harvester (ports JUSToolkit
  readers; relative-ptr + Shift-JIS). All 14 validation checks pass, including
  the four runtime anchors (0=セナ, 823/824=ルフィ, 830=ゾロ).
- `data/koma_db.json` / `data/koma_db.csv` — per-koma: name, series (code +
  NTbl + NameNum), tiles/type (help 1T / support 2-3T / battle 4-8T), 5×4
  shape mask, image id, aliases; plus 74 battle-character and 193
  support-character ability-text tables, 41 manga entries, 89 epithets.
- `data/koma_aliases.json` — 81 romanized aliases (luffy, naruto, goku…).
- `decomp/docs/KOMA_DATABASE.md` — auto-generated human dump.
- `tools/scripts/deck_build.py` **v2** — name-based addressing
  (`--koma op:luffy#4`, `--koma na:sakura#2`, alias, or raw `ID[:FLAGS]`),
  `--search QUERY`, **auto-placement** (greedy 5×4 pack from shape masks;
  leader bit on exactly one battle koma — corpus shows 292/295 presets have
  exactly one; help komas placed right of the leader get link 0x0400), and
  legality checks (dup warn, ≥1 help + ≥1 support, 16-slot/board-fit errors).
  Live-tested: 4 name-authored decks (ＮＲＴ/ＤＢＺ/ＢＬＨ/ＰＯＣ２) injected and
  readable in the runtime table.

Remaining from Goal B (still open, lower priority):
- Link nibble semantics: corpus values {1,2,3,4} observed (0x0400=right is the
  only direction semantically confirmed live).
- High bits 0x2000/0x4000 (~100 occurrences each in presets; 0x8000 never).

## NEXT SESSION — koma ID harvesting + full flag decode

### Goal A: IDs for ALL komas

Current state: only a handful of koma.bin indices are identified (Sena 1K = 0,
Luffy 4K = 823, Luffy 5K = 824, Zoro 2K = 830; NTbl 41 = One Piece,
NTbl 1 = Eyeshield 21, NTbl 15 = Slam Dunk, NTbl 14/16 = JoJo candidates).
Attack vectors, best first:

1. **Decode the name tables** (offline, no game needed):
   - `chr_b_t.bin` (64,747 B): 51 u32 pointers at file start → Shift-JIS-ish
     strings ("孫悟空", "かめはめ波"…). First entry = Son Goku → likely the
     **battle-character name/description table**, one entry per character
     (~51 battle chars).
   - `chr_s_t.bin` (46,512 B): same shape, 400 pointers → support-koma texts.
   - `infoname.bin` (524 B): 42 pointers → character names (岸辺露伴 = Rohan,
     牡羊座のムウ = Mu…). 42 ≈ number of series.
   - `pname.bin` (1,465 B): 90 pointers → player/title epithets (下忍, 風の中忍…).
   - **Caveat**: these are NOT plain Shift-JIS strings — decoding produced a
     mix of valid Shift-JIS and UTF-8-looking bytes, so the tables likely use
     JUS's own text encoding (inline control codes / per-entry headers). The
     pointer tables at offset 0 also don't look sorted, so the entry format
     needs RE before trusting the string dump. Helper scripts exist:
     `recomp/ntbl_dump.py`, `recomp/ntbl2.py`, `recomp/infoname_decode.py`
     (dumps in `recomp/*.dump.txt` / `infoname_full.txt`).
   - koma.bin maps each koma to (`NameTableIdx` 1..42, `NameNum`) — see
     `recomp/infoname_full.txt` for the NTbl→index-range table. If the name
     tables index by (NTbl, NameNum), resolving all 890 names is mechanical.
   - JUSToolkit's own **43-entry NTbl→2-letter series table** is referenced in
     `FILE_FORMATS_JUSTOOLKIT.md` but was never captured — fetch JUSToolkit's
     source (or its `Koma` name table) as ground truth for the series codes.
2. **Preset corpus cross-ref** (offline): 370 named decks in
   `extract/deck_extracted/deck/`. `recomp/preset_series.py` already groups
   decks by NTbl; combined with (1), a deck name + its NTbl pins a series.
3. **Live oracle (game)**: inject a deck with unknown ids (`deck_build.py` +
   `deck_tools.py append --port 19888`) and read the deck viewer — slow for
   890 ids; only for spot-checks.

### Goal B: all deck slot flags

Decoded: `flags = (leader << 12) | (link << 10) | (row << 4) | col`, board
5 cols × 4 rows, no rotation. Remaining unknowns:

- **Link nibble bits (bits 8-11)**: `0x0400` (bit 10) = "linked" observed;
  in the live deck Sena pointed right toward Luffy, and with the same tag
  placed elsewhere she pointed away — so the other bits likely encode the
  **link direction** (up/down/left/right). Test: build decks with Sena on
  each side of a battle koma, read the flag nibble each time.
- **High bits 13-15** (`0x2000`, `0x4000`, `0x8000`): seen in presets
  (`0x4023`, `0x2001`, `0x4014`…). Candidates: deck-edit marks, assist
  (L/R) tags (owner: L/R assist shortcuts only placeable on 2/3-komas),
  or "illegal/banned" flags. Test via the deck builder: place komas with
  L/R assist set and diff the flags.
- **koma.bin field semantics**: `KShapeGroupIdx` (8 groups, ~piece size),
  `KShapeElementIdx` (variant), plus `kshape.bin` (1,648 B) format — needed
  to map each koma to its exact grid shape. `kshape.bin` head looks like 8
  u32 group offsets (0,1,3,9,21,35,49,62) + per-group variant byte lists.

### Bonus findings (Route 4 dedup-removal experiment, inconclusive)

The battle-side dedup is in main ARM9 and fully located:

- `func_020769cc` (0x020769cc): deck record → battle list builder. Loop 1
  adds leader slots; loops 2-4 add support tiers; slot bitmask in r7.
- `func_02076e38`: add-to-list; **the dedup** = walk the linked list from
  `deck_struct[0x558]` comparing `*(u16*)(node[0x34]) == koma_id`, reject on
  match (`0x40000000`). Node format (0x50 bytes):
  `+0x0 next ptr, +0xC u16 koma_id, +0xE pos byte (row<<4|col), +0xF flags
  high byte (0x10 = leader), +0x34 koma-record ptr, +0x38 grid ptr,
  +0x40/0x41 role bytes, +0x42 role-fn result`.
- `func_02076c98`: koma lookup — `ctx[0x30] + kid*0xC` (12-byte records,
  runtime ImageID at +0 == koma_id), bounds vs `ctx[0x18EC]`; global ctx at
  **`0x0214BD80`** (`data_0214bd80`).
- `func_02076c18`: battle-deck init (zeroes +0x8..0x5E8; 16 × 0x50 slots at
  +0x58; allocator/freelist at +0x560).
- `func_02076d30`: grid-occupancy validation for a placement.
- **Runtime**: nodes observed at `0x021DF19C` / `0x021DE99C` (arena ≈
  0x021DE000). `recomp/battle_dupe.py` finds them by scanning for the koma
  record pointer and splices clones into the chain. Result: list clones had
  **no visible effect** (mid-fight and load-time). Interpretation: the fight
  engine either spawns fighters from a derived snapshot taken at list build,
  or dedupes again at spawn. Next step if wanted: trace ov011 fight setup
  from the list nodes (watch the node addresses at fight start), or pursue
  the code patch (Route 1/2) instead.

## FOLLOW-UP SESSION (2026-08-23) — link direction SOLVED, live-oracle confirmed

The "link nibble" open item is closed (full report:
[`KOMA_LINKS.md`](KOMA_LINKS.md); analysis tool:
[`tools/scripts/link_solve.py`](../tools/scripts/link_solve.py); data:
`data/koma_linkable.json`).

- **Direction enum solved**: flags bits 8-11 = `{1: down, 2: left, 3: up,
  4: right}` — the 1-koma's arrow direction toward the linked koma.
  464/464 preset-corpus adjacency hits; only 461/464 when restricted to
  battle-koma targets (3 official decks link 1-komas to SUPPORT komas).
- **Live oracle (owner-validated)**: 4 direction decks (Sena on each side of
  Luffy 4-koma) injected at slots 12-15 of the running game — deck-viewer
  arrows render exactly as predicted. `ＮＯＬＩＮＫ` deck (slot 16: Sena
  unlinked AND non-adjacent) **starts a battle** → links are optional.
- **Classification**: 211 linkable ids (ever linked in presets; 11 of them
  also appear unlinked), 15 standalone ids (never linked, usually placed
  non-adjacent in official decks: 石丸/ビアンキ/新八/バッファローマン/ジャイロ/…),
  101 ids never seen in the corpus. koma.bin unknown fields do NOT encode
  linkability (`unk[0]` = sequential help ordinal, `unk[1]` = const 2,
  `unk[2]` = effect-group id, `unk[3]` ≈ const 1, `unk[4]` = 48/49/50/66).
- **Tooling**: `deck_build.py` auto-placement now derives the link nibble
  from real board geometry (prefers battle-adjacent cells for help komas,
  links only corpus-linkable ids, warns otherwise). The web-side handoff
  `plans/hook-implementation.md` was updated with the enum, adjacency rule
  and the linkable/standalone lists for the Jump Database deck builder.
- **Still open**: editor-level "must link" validation (ov001/ov005 —
  owner reports the in-game editor forces links for some komas when saving,
  but injected decks pass battle start regardless) and the
  `unk[0]`-indexed help-effect table (chr ALAR).

## FOLLOW-UP SESSION (2026-08-23, same day) — L/R assist flags SOLVED

- **`0x2000` = L shortcut, `0x4000` = R shortcut** — owner-confirmed in the
  deck viewer via two injected probe decks (`ＡＳＳＴ－Ｌ` slot 19, `ＡＳＳＴ－Ｒ`
  slot 20; Zoro 2K tagged with each bit).
- **Placement rule**: L/R assists go on **support komas (2–3 tiles) and battle
  komas (4–8 tiles)** (owner-corrected: on battle komas they are the
  character-switch shortcuts). At most **one L and one R per deck**; never
  both bits on the same slot (corpus: 0 such slots, 0 decks violating the
  per-side cap, 99 decks using both). `0x8000` never observed.
- **Tooling**: `tools/scripts/assist_solve.py` (corpus stats);
  `deck_build.py --assist L:<spec> / R:<spec>` with legality checks
  (support/battle only, ≤1 per side, no double-tag) — validated by building
  `ＡＴＥＳＴ` (slot 21: Zoro `assist=L`, Luffy `assist=R`) and two rejected
  error cases. Docs updated: `DECK_FORMAT.md`, `KOMA_LINKS.md`, `TODO.md`,
  `plans/hook-implementation.md` (payload `"assist": "L"|"R"|null`).
- **Handoff**: `plans/assist-ui-implementation.md` for the Jump Database
  agent (assist UI + injection contract).

## FOLLOW-UP SESSION (2026-08-23, same day) — ally boost (kizuna) SOLVED

- **Mechanic (owner-confirmed live)**: a related character's support/help
  koma placed orthogonally adjacent to a battle koma gives an ally boost —
  golden sparkles in the deck builder. Live probes: Jotaro+Josuke/Jolyne,
  Goku+Arale/Gohan, Naruto+Sakura/Gaara/Jiraiya sparkle when adjacent,
  nothing when separated (`ＢＯＯＳＴ－ＪＪ/ＦＡＲ/ＤＢＺ/ＮＡＲ`, slots 22-25).
- **No deck-record flag exists**: `0x8000` unused in corpus+code; injected
  decks sparkle with zero flag changes — the game computes the boost from
  adjacency at render time.
- **Data located**: `chr_b_t.bin` battle-char entries end with `unk`
  triplets = related characters' 1-koma ids (+ `interactions` dialog lines).
  Extracted into `data/kizuna.json` by `tools/scripts/kizuna_build.py`:
  73 battle characters, **205/206 battle komas, 0 unmatched**; variant forms
  (ギア２/九尾/卍解/…) resolved via a reviewable manual table;
  `Ｄｒ．マシリト（ボス）` excluded (no deck komas).
- **Tooling/docs**: `deck_build.py` reports ally boosts after placement
  (record unchanged); `decomp/docs/KIZUNA.md` (findings);
  `plans/boost-ui-implementation.md` (web handoff: sparkle simulation from
  `kizuna.json`, adjacency rule, no injection payload change);
  `DECK_FORMAT.md`/`TODO.md` updated.
