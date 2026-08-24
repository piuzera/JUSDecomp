# Game Systems — Jump Ultimate Stars (AJUJ)

Findings about runtime architecture, discovered via data-driven analysis (not yet
full disassembly review). Confidence labels used throughout.

## Module/subsystem registry table (strongly inferred)

**Location**: ARM9 main `.data`, starting at `0x0209e320`.

**Header** (confirmed bytes, interpretation tentative):
```
0x0209e320: "Imp." (0x2e706d49 read as little-endian ASCII)
0x0209e324: 0x00000068   (possibly size/offset, = 104)
0x0209e328: 0x0000002f   (possibly entry count = 47, or flags)
0x0209e32c: 0x0214cd20   (= region A base address — the overlay code region!)
0x0209e330: 0x0206e618   (pointer, likely default/null handler)
0x0209e334: 0x00000000
```

The presence of the literal region-A base address (`0x0214cd20`, confirmed identical to
the value in `extract/arm9_overlays/overlays.yaml`) inside this table is strong evidence
this structure is directly tied to the overlay system.

**Entries** (confirmed structure via memory dump, 12 bytes each, starting `0x0209e338`):

```c
struct SystemEntry {
    void* init_or_update_fn; // pointer into main or into an overlay's code region
    void* data_ptr;          // pointer into main's .data (context/vtable?)
    u32   owner_overlay_id;  // small integer 0-13, matches ARM9 overlay IDs
};
```

Sample decoded entries (confirmed via hex dump, `tools/scripts` candidate to formalize):

| # | func | data | overlay id |
|---|---|---|---|
| 0 | 0x0214d3c8 | 0x0206e62c | 0 |
| 1 | 0x0214fb6c | 0x0206e674 | 0 |
| 2 | 0x0206e6ec | 0x0206e70c | 0 |
| 3 | 0x0206e884 | 0x0206e8b8 | 1 |
| 4 | 0x0206ea6c | 0x0206ea84 | 2 |
| 5 | 0x0206eaa4 | 0x0206eac0 | 1 |
| 6 | 0x0206eb10 | 0x0206eb68 | 1 |
| 7 | 0x0206ebd8 | 0x0206ebf0 | 5 |
| 8 | 0x0206ec18 | 0x0206ec44 | 5 |
| 9 | 0x02161184 | 0x0206e5d0 | 5 |
| 10 | 0x0206eca8 | 0x0206ecb8 | 6 |
| 11 | 0x0206ece0 | 0x0206ed80 | 6 |
| 12 | 0x0206eff0 | 0x0206f00c | 1 |
| 13 | 0x0206f038 | 0x0206e5d0 | 2 |
| 14 | 0x0206f050 | 0x0206e5d0 | 3 |

Note some `func` pointers fall inside overlay code (e.g. entry 0: `0x0214d3c8` is in
region A = overlay space) while others are in `main` itself (e.g. entry 2: `0x0206e6ec`).
**Tentative interpretation**: entries whose func is in `main` are generic/dispatcher stubs
that internally check whether their `owner_overlay_id` is currently loaded before calling
into overlay code; entries whose func is already an overlay address are direct pointers
usable once that overlay is resident.

## Table initialization code (confirmed via disassembly)

Two ARM9-main functions reference the table header directly (via `relocs.txt`, `kind:load`):

- **`func_0206dd74`** (`0x0206dd74`, 0x40 bytes) — writes to table header fields at
  offsets matching `0x0209e328`/`0x0209e32c` region: stores `0x10` (16) into two data
  slots (`data_020a1008`, `data_020a0cd4`) and a `0` byte flag into `data_020afc9c`.
  **Tentative**: a "reset/init overlay manager state" routine.
- **`func_0206ddb4`** (`0x0206ddb4`, 0x1e8 bytes) — larger function; calls
  `func_0206d9f0`, `func_0206db88`, `func_0206df9c`, `func_0206e134`, then two `blx`
  calls to `func_02062da8` and `func_0208c2f8` (likely NitroSDK/OS init calls), followed
  by a loop (`.L_0206df6c` referenced) iterating some state and calling
  `func_02086bd4`/`func_02086c14` (possibly `FS_*`-family functions — signature
  match not yet attempted on these) and conditionally `func_02042b58` with a 0/1 flag
  (possibly enable/disable of a subsystem — matches the "load/unload" pattern).
  **Tentative**: this looks like the **main system update loop / dispatcher** — it walks
  the registry table (or a related list) once per frame, and manages loading state based
  on `owner_overlay_id` bookkeeping (`r10` toggling 0/1 mirrors an "is overlay resident"
  flag being flipped alongside calls to what may be `FS_LoadOverlay`/`FS_UnloadOverlay`
  or JUS's custom equivalents — the dsd built-in signatures for those functions did NOT
  match any function in this binary, so JUS's loader is either custom or a different
  build/version than dsd's known signature).

## Relationship to overlay/screen architecture (see OVERLAYS.md)

This registry table's `owner_overlay_id` field cleanly explains how `main` can hold
generic pointers to per-screen logic without hardcoding which overlay must be loaded:
each entry says "this behavior belongs to overlay N"; a dispatcher (candidate:
`func_0206ddb4` region) presumably checks current overlay residency before invoking.

This is consistent with, and provides the mechanism for, the co-residency model already
documented in `OVERLAYS.md` (one region-A screen overlay + one region-B overlay + region-C
ov012 resident at a time).

## Confidence summary

| Finding | Confidence |
|---|---|
| Table header magic `"Imp."` present at `0x0209e320` | Confirmed (byte-level) |
| Table contains `{func,data,u32}` triples, 12 bytes each | Confirmed (byte-level, consistent pattern across dozens of entries) |
| Third field is an ARM9 overlay ID (0-13 range observed) | Strongly inferred (values match known overlay ID range; several entries' `func` pointer falls inside that exact overlay's address range in `OVERLAYS.md`) |
| Table is a subsystem/module registry consulted by a dispatcher | Strongly inferred |
| `func_0206ddb4` is the per-frame dispatcher/overlay manager | Tentative |
| `FS_LoadOverlay`/`FS_UnloadOverlay` (dsd's built-in signatures) are NOT used directly | Confirmed (signature apply returned no match) — JUS uses a custom or differently-built loader |

## Next steps

- Fully disassemble `func_0206ddb4` and its callees (`func_0206d9f0`, `func_0206db88`,
  `func_0206df9c`, `func_0206e134`, `func_02086bd4`, `func_02086c14`, `func_02042b58`)
  to confirm the dispatcher hypothesis and find the actual overlay load/unload calls.
- Write a script to fully decode the `Imp.` table (all ~47 entries) and cross-reference
  every `owner_overlay_id` against `OVERLAYS.md`'s screen identities — this would let us
  enumerate every distinct "system" in the game (menus, battle states, etc.) by table
  position, even before reading their code.
- Attempt `dsd sig list` against other known NitroSDK signatures beyond FS_*Overlay to
  identify more library boundary functions referenced from the dispatcher.
