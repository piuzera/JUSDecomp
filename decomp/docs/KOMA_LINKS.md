# Koma Links — Direction Enum & Linkability (2026-08-23)

> Companion to [`DECK_FORMAT.md`](DECK_FORMAT.md) (record layout) and
> [`DECK_INJECTION_STATUS.md`](DECK_INJECTION_STATUS.md) (injection tooling).
> Artifacts: `tools/scripts/link_solve.py` (analysis), `data/koma_linkable.json`
> (per-id classification), `recomp/link_solve.txt` (full text dump).

## 1. The link nibble is a direction enum — SOLVED (corpus + live oracle)

The flags bits 8-11 of a deck slot (previously called "link nibble") encode the
**direction the 1-tile help koma's arrow points toward the koma it is linked
to**:

| Nibble value | Bits | Direction (arrow points…) |
|---|---|---|
| `1` | `0x0100` | **down** |
| `2` | `0x0200` | **left** |
| `3` | `0x0300` | **up** |
| `4` | `0x0400` | **right** |
| `0` | `0x0000` | no link |

- **Corpus proof**: all 294 parsed preset decks reconstructed on the 5×4 board;
  464 linked 1-tile koma observations. Scoring all 24 nibble→direction
  permutations against the actually-adjacent komas gives **464/464 strict hits**
  for this mapping and ≤ 415/464 for every other permutation.
- **Live proof (owner-validated, same day)**: 4 injected decks with Sena on
  each side of Luffy 4-koma; in the deck viewer the arrows render exactly as
  predicted (right/left/down/up).
- This **retracts** the old hardcoded assumption `link = 0x0400 always`
  (used by `deck_build.py` v2 auto-placement and the earlier docs).

## 2. Link target

The arrow points at the koma occupying the adjacent cell in that direction:

- Normally a **battle koma** (4–8 tiles): 461/464 corpus observations.
- **3 corpus observations link a 1-koma to a SUPPORT koma** (2–3 tiles):
  - `jadv/028.bin`: kid 818 → kid 778 (support 2T)
  - `jadv/035.bin`: kid 770 → kid 767 (support 3T)
  - `jadv/060.bin`: kid 719 → kid 712 (support 3T)

  So the link arrow may legally point at a support koma, but battle komas are
  the norm. The direction enum is unchanged either way.

## 3. Are links mandatory? — NO (battle-start level, live-tested)

- `ＮＯＬＩＮＫ` test deck (Sena 1K at (3,0), no link, **not adjacent** to any
  battle koma + Luffy 4K + Zoro 2K) was injected live: **battle starts
  normally**.
- The official preset corpus agrees: many linkable komas appear **unlinked**
  and even **not adjacent** to any battle koma in legal preset decks
  (e.g. 江田島平八 kid 212: 6 unlinked non-adjacent occurrences).
- **Editor-level note (owner-reported, not yet RE'd)**: the in-game deck
  editor appears to force a link for some komas when saving. That validation
  lives in ov001/ov005 code and is the remaining open item — it does **not**
  affect battle start from an injected deck. If you hit an editor rejection
  for a specific koma, report the koma and we'll pin the rule.

## 4. Per-koma linkability classification (`data/koma_linkable.json`)

Derived from 294 preset decks (464 linked + unlinked observations). For the
web deck builder, the practical classes are:

| Class | Meaning | Count |
|---|---|---|
| `linkable` (A + B) | ever observed linked in official decks | **211** |
| `A_link_optional` | observed both linked and unlinked | 14 |
| `B_linked_only_observed` | only ever observed linked | 197 |
| `C_unlinked_only_observed` → `standalone_1k` | **never linked** in any preset; usually floats anywhere | **15** |
| `D_never_in_corpus` → `unknown_1k` | never appeared in any preset deck | 86 |

- **Standalone (never linked, 15 ids)**: `32 石丸, 72 ビアンキ, 110 新八,
  157 バッファローマン, 301 ジャイロ, 343 アテナ, 495 界王さま, 650 斬月,
  651 黒崎一心, 737 チュウ兵衛, 812 比古清十郎, 868 シャンクス,
  870 Ａコマ, 871 Ｂコマ, 872 Ｃコマ` (names in `data/koma_linkable.json`
  `per_id_standalone`). 870–872 are the placeholder "A/B/C koma" slots.
  Official decks place most of them **not adjacent** to any battle koma —
  treat as pure help komas: no link, free placement.
- **Link-optional (14 ids)**: `75 イーピン, 154 ブロッケンＪｒ．, 160 アシュラマン,
  163 ミートくん, 164 キン肉大王, 165 両さん, 212 江田島平八, 322 安西先生,
  527, 539, 668, 836 ナミ, 850 ロビン, 869 キウイ／モズ` — official decks
  link them in some decks and not others.
- **Linked-only (197 ids)**: always linked when present in presets. Link when
  placing adjacent; the live NOLINK test (Sena belongs to this class) shows
  leaving them unlinked is still accepted at battle start.
- **Unknown (86 ids)**: never seen in presets. Default policy in tooling:
  place freely, no link unless the user draws one.

## 5. koma.bin unknown-field observations (linkability is NOT encoded there)

Cross-tabs of the 5 harvested koma.bin unknowns (`unk[0..4]`) against
linked/unlinked status found **no clean discriminator**:

- `unk[0]` (u16 @2): sequential help-koma ordinal 1..226 — likely an index
  into a per-koma help-effect table (not located yet; candidate:
  `chr/ChrBin.aar` effect data).
- `unk[1]` (u8 @6): constant `2` for all 1-tile komas (likely size/type tag).
- `unk[2]` (u8 @7): 46 distinct values, ~effect-group id; shared by linked
  and standalone komas (e.g. `40` for both 石丸 [standalone] and 沖田
  [linked]).
- `unk[3]` (u8 @10): `1` for all but one koma (kid 888 必魂無制限 has `0`).
- `unk[4]` (u8 @11): `48` (166×), `49` (56×), `50` (3×, all unlinked-only),
  `66` (1×) — `50` is a partial standalone signature, not decisive.

So: linkability classification above comes from the **deck corpus**, not from
koma.bin. Authoritative per-koma "help vs support-type" data, if it exists,
lives in the chr effect archives — follow-up if the editor-level link rule
becomes blocking.

## 6. Tooling updates

- `tools/scripts/link_solve.py` — corpus solver (direction permutations,
  adjacency stats, classification; writes `data/koma_linkable.json` +
  `recomp/link_solve.txt`).
- `tools/scripts/deck_build.py` — auto-placement now computes the link nibble
  from real geometry (arrow toward the adjacent battle koma), links only
  corpus-linkable ids, prefers battle-adjacent cells for help komas, and
  warns when a linkable koma ends up non-adjacent.
- The web deck builder should mirror the same rule: when a linkable koma is
  placed orthogonally adjacent to a battle koma, set
  `link = {down:1, left:2, up:3, right:4}` pointing at it; otherwise `link=0`.

## 7. Still open

1. Editor-level "must link" rule (ov001/ov005) — which komas the editor
   forces a link for, if any beyond support-type heuristics.
2. `unk[0]`-indexed help-effect table location (chr ALAR) — would give the
   authoritative help/support-type flag for all 890 komas.
3. ~~High flags bits `0x2000`/`0x4000`~~ — **SOLVED (2026-08-23)**: L/R assist
   shortcut tags. `0x2000` = L, `0x4000` = R (owner-confirmed in the deck
   viewer with two injected probe decks). Placeable on support (2–3T) and
   battle (4–8T) komas; at most one of each per deck; never both on one slot.
   `0x8000` (bit 15) remains unobserved. Tooling: `tools/scripts/assist_solve.py`
   (corpus stats), `deck_build.py --assist L|R:<spec>`.
