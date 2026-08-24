# Kizuna — Ally Boost relationships (2026-08-23, SOLVED)

> Companion to [`KOMA_LINKS.md`](KOMA_LINKS.md) and
> [`DECK_FORMAT.md`](DECK_FORMAT.md). Artifacts: `data/kizuna.json`
> (machine-readable relations), `tools/scripts/kizuna_build.py` (extractor),
> `recomp/kizuna_scan.txt` (RAM-scan reconnaissance, mostly noise —
> see §3).

## 1. The mechanic (owner-confirmed)

Placing a **support or help koma of a related character orthogonally adjacent
to a battle character's koma** gives the battle character an ally boost and
shows **golden sparkles** in the deck builder. Live-validated probes
(2026-08-23): Jotaro+Josuke/Jolyne, Goku+Arale/Gohan, Naruto+Sakura/Gaara/
Jiraiya sparkle when adjacent, nothing when separated.

**There is NO deck-record flag for the boost.** Evidence:
- `0x8000` (the only unused flags bit) never appears in any of the 295
  preset decks and no code treats it as a deck-slot bit.
- The 92-byte record has no spare space beyond flags + name.
- Injected decks sparkle in the deck viewer with **zero flag changes** — the
  game recomputes the boost from board adjacency at render/deck time.

Consequence: the authentic web deck builder must **simulate** the sparkles
client-side from the relationship data below. Injection is unchanged.

## 2. Where the data lives (harvested already)

`chr_b_t.bin` (74 battle-character entries, parsed by `koma_harvest.py`) —
each entry ends with:

```
unk: [r1, r2, r3]        — up to 3 related characters, encoded as their
                           1-koma (help) koma id
interactions: [6 lines]  — 2 in-game dialog lines per relation
```

Example — Jotaro (`data/koma_db.json` battle_characters):

```json
"unk": [292, 298, 771],
"interactions": [
  "承太郎さんとオレのコンビっスか", "グレートな判断っスよ",   // Josuke
  "あたしは星をみるわ…　父に会うまで…", "星の光をみていたい", // Jolyne
  "ケンカの数なら　いい勝負かもな！", ""                     // Yusuke
]
```

The anchor id is always the related character's **1-tile koma**; the game
matches by character, so any koma (help/support) of that character counts.

## 3. Extraction (`data/kizuna.json`)

`tools/scripts/kizuna_build.py` resolves each battle-character entry to its
battle komas and expands each relation anchor to the related character's full
koma-id group:

- **73 battle characters, 205/206 battle komas covered, 0 unmatched.**
- Entry resolution: koma_ids majority vote → name cluster → series vote →
  a reviewable manual table for variant/enhanced forms (超サイヤ人悟空,
  ギア２, 九尾, 卍解, 白鵠, 真説ボーボボ, 怒んパッチ, 射手座聖衣, ベジット,
  両津勘吉, 完璧天候棒ナミ, …) which share the char id with their base form.
- `Ｄｒ．マシリト（ボス）` has no deck komas (encyclopedia/cheat-only) —
  listed under `excluded_entries`.
- The one uncovered battle koma is in the cheat-only region (owner hint;
  probe-able later if ever needed).

JSON shape:

```jsonc
{
  "rule": "…computed from adjacency; no deck-record flag…",
  "relations": [
    { "name_jp": "空条承太郎", "battle_koma_ids": [272,…,278],
      "related": [
        { "anchor_id": 292, "char_id": 115, "name_jp": "仗助",
          "koma_ids": [292,293,294], "boost_koma_ids": [292,293,294],
          "lines": ["…","…"] }, … ] }, … ],
  "battle_koma_boost": { "275": [292,293,294,298,299,300,771,…], … },
  "validated": { "jotaro": [["仗助","徐倫","幽助"]],
                 "goku":   [["超サイヤ人悟飯","亀仙人","アラレ"], …],
                 "naruto": [["自来也","我愛羅","サクラ"], …] },
  "unmatched_entries": [], "excluded_entries": ["Ｄｒ．マシリト（ボス）"]
}
```

`battle_koma_boost` is the flat lookup the tools use: battle koma id →
related **support/help** koma ids.

## 4. Owner-confirmed combos (validation anchors)

| Battle | Related (from `unk`) |
|---|---|
| Jotaro (275…) | Josuke 292, Jolyne 298, Yusuke 771 |
| Goku (454/455) | Gohan 466, Kame-sennin 493, Arale 419 |
| Naruto (500/502) | Jiraiya 527, Gaara 524, Sakura 510 |

## 5. Tooling

- `tools/scripts/kizuna_build.py` → `data/kizuna.json`.
- `tools/scripts/deck_build.py` now reports ally boosts after auto-placement
  ("ALLY BOOST: 承太郎 boosted by 仗助") — informational only, record bytes
  unchanged (the game computes the boost itself).

## 6. Open items

- The one cheat-only battle koma without relations (identify + probe if
  needed).
- Whether a related character's BATTLE komas also sparkle when adjacent
  (only support/help adjacency was requested/tested; `battle_koma_boost`
  deliberately lists only help/support ids).
