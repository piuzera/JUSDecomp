# Deck Injection — Static Findings (JUS Decomp original work)

Prepared 2026-08-22. Cross-references the Action Replay anchors in
[`deep-research-ar.md`](../../deep-research-ar.md) against the local dsd disassembly
(`decomp/arm9/relocs.txt`, `decomp/asm/_dsd_gap@main_5.s`). This is the **static**
half of the deck-injection plan; the runtime half (probe + injection tooling) is
tracked in [`plans/deck-injection-plan.md`](../../plans/deck-injection-plan.md).

Status legend: **confirmed** (byte-level from disassembly/symbols), **strongly
inferred** (consistent across multiple sites, not yet runtime-verified),
**tentative**.

## 1. The deck table is plain save-mirrored BSS data

The AR research doc's central question — "where is the deck, and who consumes the
selected-deck bytes?" — is answered statically. The deck records live in **main RAM
BSS**, not in an overlay, and are bound to the cartridge save via a dirty-range
tracker.

### Deck table 1 (player decks) — confirmed

| Item | Value |
|---|---|
| Base | `0x020B0DBC` (`data_020b0dbc`) |
| Record stride | `0x5C` (92 bytes) — **identical to `Deck.aar`'s 92-byte preset format** (see `DECK_FORMAT.md`) |
| Capacity | 50 records (`0x11F8` = 50 × 0x5C, spans to next symbol `data_020b1fb4`) |
| Used-count | `0x020B0D6C` (`data_020b0d6c`, **1 byte**) — the AR "50→80" code writes `0x50` here |
| Save offset | `0x0B04` (size `0x11F8`) |

Accessor `func_02071f10` (thumb, `0x02071f10`):

```c
// return 0x020B0DBC + idx * 0x5C
void* Deck_GetPtr(int idx) {
    return (void*)(0x020B0DBC + idx * 0x5C);
}
```

Count getter `func_02071f54`:

```c
// return *(u8*)0x020B0D6C
int DeckTable1_GetCount(void) { return *(u8*)0x020B0D6C; }
```

### Deck table 2 (rival/received decks — semantic TBD) — confirmed layout, tentative meaning

| Item | Value |
|---|---|
| Base | `0x020B2E8C` (`data_020b2e8c`) |
| Record stride | `0x5C` |
| Capacity | 50 records |
| Used-count | `0x020B0D6D` (`data_020b0d6d`, 1 byte) |
| Save offset | `0x2BD4` (size `0x11F8`) |

Accessor `func_02072070` (`base + idx*0x5C`), count getter `func_020720d8`
(`*(u8*)(0x020B0D6C + 1)`).

### Per-deck aux metadata array — confirmed layout

| Item | Value |
|---|---|
| Base | `0x020B1FB4` (`data_020b1fb4`) |
| Stride | `0x4C` (76 bytes) |
| Capacity | 50 entries (`0xED8` = 50 × 0x4C) |
| Save offset | `0x1CFC` (size `0xED8`) |

Accessor `func_02072050` (`base + idx*0x4C`). `Deck_Append` zero-fills the entry
(`idx*0x4C`, 0x4C bytes) when a deck is created. **Tentative**: per-deck metadata
(deck name pointer, last-edited, flags) — not yet decoded.

## 2. Save-layout fragment — runtime-corrected (2026-08-22)

The static contiguous prediction was close but off by 8 bytes on the deck region
and had the two count bytes swapped. **Runtime-verified against the live runner**
(RAM table 1 record 0 matched `.sav` byte-for-byte at the corrected offset):

| Save offset | Size | RAM mirror | Content |
|---|---|---|---|
| `0x0AB4` | 1 | `0x020B0D6D` | deck table **2** count (u8) |
| `0x0AB5` | 1 | `0x020B0D6C` | deck table **1** count (u8) |
| `0x0B04` | 8 | — | deck-1 region header (8 bytes, e.g. `b4 32 66 71 fa c6 cf 97` observed) |
| `0x0B0C` | `0x11F8` | `0x020B0DBC` | deck table 1 records — **`0xB0C + slot*0x5C`** |
| `0x1CFC` | `0xED8` | `0x020B1FB4` | per-deck aux (50 × 0x4C) |
| `0x2BD4` | 8 | — | deck-2 region header (zero-filled observed) |
| `0x2BDC` | `0x11F8` | `0x020B2E8C` | deck table 2 records |

**Confirmed**: a deck table 1 record lives at `.sav` offset `0xB0C + slot*0x5C`.
This is the key to a future offline `.sav` injection route and also cracks part of
the save format relevant to the open imported-save-recognition bug (`SAVEBUG.md`).

## 3. Key functions (runtime-confirmed renames, 2026-08-22)

`deck_tools.py append` + the live deck-list/UI behavior confirmed the semantics
below end-to-end: an appended record shows in the deck list, a deck loads with
its komas, and a battle starts.

| Function | Proposed name | Evidence |
|---|---|---|
| `func_02071f10` | `Deck_GetPtr` | `base + idx*0x5C` |
| `func_02071f54` | `DeckTable1_GetCount` | reads u8 at `0x020B0D6C` |
| `func_020720d8` | `DeckTable2_GetCount` | reads u8 at `0x020B0D6D` |
| `func_02072050` | `DeckAux_GetPtr` | `base + idx*0x4C` |
| `func_02072070` | `DeckTable2_GetPtr` | `base + idx*0x5C` |
| `func_020723cc` | `Deck_Append` | if `count >= 0x32` return −1; else slot=count, count++, clear (`func_02078aa0`), init from default template `0x02092454` (`func_02078b08`), zero aux entry, set dirty flag |
| `func_02071f60` | `Deck_CopyTo` | `Deck_CopyTo(idx, dst)`: validity check `func_02078ad0(Deck_GetPtr(idx))`, then 92-B memcpy (`func_02051890`) — **the convergence point the AR doc was hunting** |
| `func_02073114` | `Save_MarkRangeDirty` | tracks min/max dirty save byte range on `data_020b02ac` |
| `func_02071f20` | `DeckTable1_Init` | mark save ranges + append one starter deck |
| `func_02072090` | `DeckTable2_Init` | mark save ranges + append one starter deck |
| `func_02078ad0` | `Deck_IsValid?` | validity predicate used by `Deck_CopyTo` (body not yet read) |
| `func_02078aa0` | `Deck_Clear?` | clears a deck record (called by `Deck_Append`) |
| `func_02078b08` | `Deck_InitFromTemplate?` | copies default template `0x02092454` into a record |

## 4. AR anchor addresses — resolved locally

| RAM address | dsd symbol | Meaning | Confidence |
|---|---|---|---|
| `0x020AFEB0` | `data_020afeb0` (4 B) | per-player deck-select state (count/flags) | strongly inferred |
| `0x020AFEB4` | `data_020afeb4` (10 B) | **per-player selected-deck bytes** (AR Deck 1–8 codes write `01010101`…`08080808`) | confirmed (writers/readers in `func_0207538c`; ov001 deck-select refs) |
| `0x020B0BAC` | `data_020b0bac` (0x74 B) | Koma-unlock block (AR E-code fills first 0x68 B) | confirmed |
| `0x020B0C20` | `data_020b0c20` (0x74 B) | twin Koma block (second bitset) | confirmed |
| `0x020B0D6C` | `data_020b0d6c` (1 B) | deck table 1 used-count | confirmed |
| `0x020B0D6D` | `data_020b0d6d` (1 B) | deck table 2 used-count | confirmed |
| `0x020B0D70` | `data_020b0d70` | pointer returned by `func_02071f08` (profile/deck ctx) | tentative |
| `0x020B02AC` | `data_020b02ac` | save-dirty state struct (`[0]`=dirty, `[4]`=max end, `[8]`=min offset) | confirmed |
| `0x02092454` | `data_02092454` (.data) | default/blank deck template (92 B) | confirmed |

Note: the AR doc's four `0x61C`-strided addresses (`0x020AFEB4`, `0x020B04D0`,
`0x020B0AEC`, `0x020B1108`) are **not** four deck tables — `0x020AFEB4` is the
selected-deck byte vector, and the other three are unrelated BSS symbols that
happen to sit `0x61C` apart (the stride is a coincidence of BSS layout, not a
`Player[4]` array). The deck tables themselves are at `0x020B0DBC`/`0x020B2E8C`.

## 5. Koma identification (Luffy 4-koma) — RESOLVED (live oracle, 2026-08-22)

The deck record's `koma_id` field is a **direct koma.bin index (0-889)** (re-confirmed
at runtime). koma.bin is 890 × 12-byte `KomaElement` records:
`ImageID(u16), Unknown(u16), NameTableIdx(u8), NameNum(u8), Unknown(u8)x2,
KShapeGroupIdx(u8), KShapeElementIdx(u8), Unknown(u8)x2`.

- **"op" (One Piece) = `NameTableIdx` 41** (indices 820-869, 50 entries), NOT
  NTbl 3 as previously assumed. The earlier "op = NTbl 3, indices 41-55" claim
  (TODO.md, 2026-08-20) is retracted. Evidence: a user-built deck containing
  Luffy 4-koma + Zoro 2-koma (both NTbl 41), and preset `jadv/003.bin` (`ＯＰ１`)
  which is entirely NTbl 41.
- **Luffy 4-koma = koma.bin index `823` (`0x0337`)** — live oracle (the user's
  deck record slot 1, flags `0x1001`). Zoro 2-koma = `830` (`0x033E`). Sena
  1-koma (Eyeshield 21, NTbl 1) = index `0`.
- The **Action Replay deck-builder buffer** (`0x0228AAB0`, 6 × 16-bit slots of
  `0x021EXXXX`) uses a **different ID space** than koma.bin indices. Luffy 4-koma
  = `0x28B4` in that space (from the AR "fill buffer" code). This is a runtime
  materialized structure, not the saved-deck format.
- Deck record slot flags vary per deck (placement/rotation), not per koma; author
  with a known-valid flag cribbed from the live deck or a preset (see
  `DECK_FORMAT.md`).

## 6. Injection boundary — VALIDATED (2026-08-22)

The deck table is **plain data in save-mirrored BSS**. The runner *is* the
production runtime, so a host-side data write (new `write_mem` debug-server
command, through the bus-write path for correct write provenance) achieves the
same result as the AR doc's "hook `GetDeck`" route — without touching generated
banks (forbidden by the framework) or unverified recompiler hook support.

The injection point is a **deck record slot** at
`0x020B0DBC + slot*0x5C`, consumed by `Deck_CopyTo` (`func_02071f60`) when the
game resolves the selected deck. See `plans/deck-injection-plan.md` for the
full phased plan.

**Result (2026-08-22, owner-validated on the live game):**
1. `deck_tools.py append` of a byte-copied record → deck list shows the new deck.
2. `deck_build.py` authored record (`ＰＯＣ`: Sena 1K + Luffy 4K + Zoro 2K) →
   appears in the deck list, shows the correct komas, **battle starts**.
   The TODO.md POC goal ("Luffy 4-koma + support koma") is thereby met via
   runtime injection.
