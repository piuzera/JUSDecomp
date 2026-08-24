# Function Reconstruction Log — JUS Decomp

Records every function reconstructed to matching (or near-matching) C/C++ source,
with the evidence used and the compiler build that reproduces it byte-exact.

Status legend: **MATCHED** (byte-exact after linking), **NEAR-MISS** (structurally
correct, differs in exact bytes), **WIP**.

---

## `func_ov000_0214de00` — MATCHED (first verified match, 2026-08-20)

- **Module**: ov000 (title/menu overlay)
- **Address**: `0x0214de00`, size 0x18 (24 bytes), ARM mode
- **Original bytes**: `08 40 2d e9 08 00 9f e5 00 00 90 e5 30 ff 2f e1 08 80 bd e8 18 0e 0a 02`

**Reconstructed C**:
```c
void (*data_020a0e18)(void);

void func_ov000_0214de00(void) {
    data_020a0e18();
}
```

**Compiler version sweep result** (all 24 available mwccarm builds, `-proc arm946e`,
default optimization):

| Version family | `.text` bytes (pre-link, first 20B) | Result |
|---|---|---|
| `2.0/*` (base, sp1, sp1p2, sp1p5/6/7, sp2, sp2p2/3/4) | `08402de908009fe5000090e530ff2fe10880bde8` | **Byte-exact match** |
| `dsi/*` (1.1–1.6sp2) | `08402de908009fe5000090e530ff2fe10880bde8` | **Byte-exact match** |
| `1.2/*` (base, sp2, sp2p3, sp3, sp4) | `00402de904d04de20c009fe5000090e530ff2fe1...` | No match (extra stack padding: `sub sp,#4`/`add sp,#4` frame) |

The trailing 4 bytes (`18 0e 0a 02`) are the linked address of `data_020a0e18`
(`0x020a0e18`, little-endian) — confirmed by direct calculation, not a mismatch;
this is the unresolved relocation slot before linking.

**Confidence**: MATCHED (confirmed) for instruction bytes; the exact original overlay's
compiler build is **narrowed to `2.0/*` or `dsi/*` family**, not `1.2/*`
(**strongly inferred** — needs corroboration from more functions before treating this
as the pinned build, since different object groups/files could use different builds,
per general decomp community experience).

## Compiler version sweep methodology (reusable)

1. Pick an isolated, small (<0x40 byte) leaf function with few/no calls, to minimize
   the chance that optimization choices elsewhere obscure the byte pattern.
2. Write literal matching C using recovered symbol names (`data_XXXXXXXX` from
   `decomp/arm9*/symbols.txt` / `relocs.txt`).
3. Compile against every available `mwccarm.exe` version found under `tools/mwccarm/`
   (script: inline for now, formalize as `tools/scripts/compiler_sweep.py` if reused).
4. Compare pre-link `.text` bytes against the original overlay bytes at the same offset
   (relocation slots will legitimately differ pre-link — verify by hand or link fully).
5. Record the winning version(s) here.

## Deck-system function renames — runtime-confirmed (2026-08-22)

Not yet reconstructed to matching C (this log's bar), but disasm-identified and
**runtime-confirmed** by deck injection (an appended record appeared in the deck
list; an authored deck loaded and started a battle — `DECK_INJECTION_STATUS.md`):

| Address | Name | Evidence |
|---|---|---|
| `func_02071f10` | `Deck_GetPtr` | `0x020B0DBC + idx*0x5C`; injected records consumed correctly |
| `func_02071f54` | `DeckTable1_GetCount` | u8 at `0x020B0D6C` |
| `func_020720d8` | `DeckTable2_GetCount` | u8 at `0x020B0D6D` |
| `func_02072050` | `DeckAux_GetPtr` | `0x020B1FB4 + idx*0x4C` |
| `func_02072070` | `DeckTable2_GetPtr` | `0x020B2E8C + idx*0x5C` |
| `func_020723cc` | `Deck_Append` | mimic (record + zero aux + count++) yields a listed, playable deck |
| `func_02071f60` | `Deck_CopyTo` | validity check + 92-byte copy (AR convergence point) |
| `func_02073114` | `Save_MarkRangeDirty` | dirty min/max tracking on `0x020B02AC` |

## Next candidates

Continue with more tiny leaf functions (trampolines, getters/setters) across different
overlays to build confidence in a single pinned compiler version (or determine that JUS
mixes versions across object files, as some other DS decomp projects have found).
