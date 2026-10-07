# ARM7 arena API hypothesis

The bounded JUS evidence is consistent with a NitroSDK-style arena initializer
and low/high setter pair. The adjacent stores target `0x027ffda0 + index*4` and
`0x027ffdc4 + index*4`; the selected caller transfers a prior callee's result
into each setter's second argument register. A pinned community reconstruction
uses those two slot bases and the same high-before-low initialization pattern.
This corroborates an arena interpretation, without assigning original JUS names,
types, signatures, SDK version, or function ownership.

This research contributes zero source credit. The canonical source count remains
304, ARM7 source credit remains zero, and T10 stays open. Existing execution,
ABI, extent, and original relocation claims remain unknown.

## What the public sources actually establish

The inspected NitroSDK artifacts belong to `pret/pokediamond` commit
`38f3650189f8989aed91618745aa74029fa60247`. The project identifies itself as a
Pokémon Diamond decompilation. Its source is primary evidence for that community
reconstruction, not a Nintendo-published SDK contract or a JUS donor version.
[Project provenance](https://github.com/pret/pokediamond/blob/38f3650189f8989aed91618745aa74029fa60247/README.md).

Its shared arena header declares these IDs and a maximum count of nine:

| ID | Public reconstructed enum |
| ---: | --- |
| 0 | `OS_ARENA_MAIN` |
| 1 | `OS_ARENA_MAIN_SUBPRIV` |
| 2 | `OS_ARENA_MAINEX` |
| 3 | `OS_ARENA_ITCM` |
| 4 | `OS_ARENA_DTCM` |
| 5 | `OS_ARENA_SHARED` |
| 6 | `OS_ARENA_WRAM_MAIN` |
| 7 | `OS_ARENA_WRAM_SUB` |
| 8 | `OS_ARENA_WRAM_SUBPRIV` |

The declared `OSArenaInfo` layout places nine low pointers before nine high
pointers. [Shared arena header](https://github.com/pret/pokediamond/blob/38f3650189f8989aed91618745aa74029fa60247/include/nitro/OS_arena_shared.h).
Its buffer constant is `0x02000000 + 0x007ffda0`; the arena accessor casts that
address to the structure. [Memory constants](https://github.com/pret/pokediamond/blob/38f3650189f8989aed91618745aa74029fa60247/include/nitro/mmap_shared.h),
[accessor definition](https://github.com/pret/pokediamond/blob/38f3650189f8989aed91618745aa74029fa60247/include/nitro/consts_shared.h).

On the declared 32-bit target, this gives the inferred slot formulas
`address(lo[id]) = 0x027ffda0 + 4*id` and
`address(hi[id]) = 0x027ffda0 + 9*4 + 4*id = 0x027ffdc4 + 4*id`.
The `0x24` spacing between the JUS store bases therefore agrees with this public
nine-pointer layout. This is arithmetic corroboration; JUS does not provide a
type or table-size declaration in the selected bytes.

The reconstructed ARM7 header declares void setters taking `OSArenaId` and a
pointer, plus pointer-returning initial-bound getters taking `OSArenaId`.
Those declarations are public candidate signatures, rather than proved JUS
signatures. [ARM7 arena header](https://github.com/pret/pokediamond/blob/38f3650189f8989aed91618745aa74029fa60247/arm7/lib/include/OS_arena.h).

The reconstructed ARM7 initializer uses a separate static guard, then processes
IDs 1, 7, and 8. For each ID it obtains the initial high pointer and sets high,
then obtains the initial low pointer and sets low. The getters switch on those
same three IDs; the setters assign the supplied pointer to the indexed slot.
[ARM7 arena source](https://github.com/pret/pokediamond/blob/38f3650189f8989aed91618745aa74029fa60247/arm7/lib/src/OS_arena.c).

Official devkitPro libnds is a separate source. At commit
`5ddb7d9b05ea4cae145da8dbb19401a9387888a9`, its system header exposes ARM9
`getHeapStart`, `getHeapEnd`, and `getHeapLimit`, each returning `u8 *`. That is
libnds' own library contract. This inspected header supplies no authority for
NitroSDK arena names or their shared slot addresses.
[Official libnds system header](https://github.com/devkitPro/libnds/blob/5ddb7d9b05ea4cae145da8dbb19401a9387888a9/include/nds/system.h).

## Only two new original-ROM selections

The independent reader checked the original parent and FAT 79 child identities,
each NDS ARM7 header, image digest, module parameters, loader table, and initialized
autoload0 mapping. The parent ROM remains SHA256
`a9c9bf89e6d99548b7c87e822b217c3fb74ef25186535b06193a6fb73d0d6d27`.
The child keeps its full `nitro_fs` identity and program SHA256
`1f68f8a95818ca23e359aa24ab21b7353b6e3515964957f0f519caaaa6ec4986`.
Equal payloads do not merge those identities.

| Explicit ARM selection | Bytes | Stored image offset | SHA256 in each program |
| --- | ---: | --- | --- |
| `[0x037fcf04,0x037fcf2c)` | 40 | `0x50b4` | `dba77433134717ea7a8f1fc995279825ca62de53ab0adf7bdb7f8c7f020c2d59` |
| `[0x037fd064,0x037fd070)` | 12 | `0x5214` | `aeb809ad5a9f8c3894e005fff8eadce11ca04cde1cb44a11f157d9dc258c70cf` |

The first selection contains two five-instruction sequences. They share words
`0xe1a00100`, `0xe2800627`, and `0xe2800aff`, which shift `r0` by two and add
`0x02700000` and `0x000ff000`. At `0x037fcf10`, word `0xe5801da0` stores `r1`
at offset `0xda0`; at `0x037fcf24`, word `0xe5801dc4` uses offset `0xdc4`.
Words `0xe12fff1e` at `0x037fcf14` and `0x037fcf28` encode `BX lr`.
No selected instruction supplies a nine-element bound or a source type.

The caller tail words are `0xe1a01000`, `0xe3a00001`, and `0xebffffa4`:
`mov r1, r0`, `mov r0, #1`, and a direct BL at `0x037fd06c`.
Independent sign extension gives displacement `-0x170`, so
`0x037fd06c + 8 - 0x170 = 0x037fcf04`; its guarded continuation is `0x037fd070`.
Native LLVM ARMv4T disassembly agrees with all thirteen instructions. Neither
selection limit is a discovered function end.

The earlier selected caller path has calls at `0x037fd04c → 0x037fcf84`,
`0x037fd058 → 0x037fcf18`, and `0x037fd060 → 0x037fcf2c`, followed by this new
`0x037fd06c → 0x037fcf04` call. Between each candidate getter and setter, the
caller copies `r0` to `r1` and reloads index 1 into `r0`. This matches the
reconstruction's first high/low pair under the arena hypothesis. It remains an
inference about purpose, rather than an original symbol assignment.

## Corroboration and unresolved differences

The exact slot bases, four-byte stride, sibling store shapes, one-time-guard
pattern, and first high-before-low call pair agree with the public reconstruction.
The prior [triage](arm7-leaf-c-trial-proof/triage.json) also observes comparisons
against IDs 1, 7, and 8 in the two candidate getter prefixes. These are several
independent structural matches, not proof of original signatures or ownership.

There is a concrete donor-specific difference to preserve. The reconstructed
ID-1 low getter returns hardcoded `0x027fafcc` with a TODO referring to
`SDK_SUBPRIV_ARENA_LO`. That Pokémon-linked number must not be carried into JUS.
The reconstruction also depends on linker-provided arena and stack symbols.
[ARM7 getter source](https://github.com/pret/pokediamond/blob/38f3650189f8989aed91618745aa74029fa60247/arm7/lib/src/OS_arena.c).

The selected JUS reads do not recover those original linker contracts, all getter
case bodies, their literal values, or the later caller pairs for IDs 7 and 8.
The BSS guard's runtime value remains unknown. The slot addresses remain outside
the checked ARM7 initialized/BSS module ranges; the public shared-system-buffer
interpretation does not change the checked original mapping or prove safe access.
The source declarations suggest a void/pointer API, while the accepted plain
unsigned-word C trial established only matching bytes. Several source signatures
can produce those same instructions.

A case-insensitive scan of each original stored ARM7 image found no occurrences
of exactly `OS_SetArena`, `OS_InitArena`, `NitroSDK`, `NITRO`, or `SDK_VERSION`.
This negative token result supplies no JUS SDK-version identification. It did
not search ARM9, NitroFS contents beyond the child image, or runtime RAM.

## Fresh guarded graph and provenance

The research request preserves the previous five selections and the explicit
root at `0x037f8468`, then appends only the two ranges above. It uses the frozen
DSD `71e766e562c78d4b0ec404b3b4edbe242a8d1b0f` reachable producer, executable
SHA256 `28e47852e593d3636d66c797c67963f5c052840c7e0e171ea7dd0dd1bda497ff`,
and the existing checked-layout digest. Atomic V4T decoding accepted both ranges.
The graph now joins the existing `0x037fd058` call to selected `0x037fcf18`,
the `call_returned` continuation at `0x037fd064` to the new tail, and its call
to selected `0x037fcf04`.

Each exact program has 34 nodes, 41 edges, all 34 nodes visited, 41 edge
examinations, and eight frontiers. Six frontiers are outside the selections:
`0x037f8470`, `0x037fced8`, `0x037fd0c8`, candidate callees `0x037fcf84` and
`0x037fcf2c`, and the new guarded continuation `0x037fd070`. The other two
are unknown exchanges at `0x037fcf14` and `0x037fcf28`, reason `indirect`.
NE outcomes and every call-return guard remain explicit. `BX lr` does not become
a resolved return, and startup's unknown exchange remains outside this request.

The [request](arm7-sdk-arena-proof/requests.json) SHA256 is
`681a5260c40c031a2fcd4161863a45d7ef3d61af36639a293a17176818141f5d`.
The full private 529,577-byte report SHA256 is
`dd61b9d34b443128375a6cddf4bff87dca6844c331b6ac0d3b740fc1d7d7f288`,
at `/private/tmp/jus-arm7-sdk-arena-worker-proof/report.json`.
[commands.json](arm7-sdk-arena-proof/commands.json) records the exact successful
probe argv. The compact [graph summary](arm7-sdk-arena-proof/graph-summary.json)
preserves every node, edge, guard, resolution, root predecessor, and frontier
witness separately per exact program.

The public [source manifest](arm7-sdk-arena-proof/external-sources.json) pins all
external source URLs and commits with their authority classification.
[read_original.py](arm7-sdk-arena-proof/read_original.py) reproduces the bounded
reads, raw BL arithmetic, LLVM results, and specified token scan.
[summarize_report.py](arm7-sdk-arena-proof/summarize_report.py) consumes its own
packaged request and a freshly generated private probe report. Readbacks are in
[original-read.json](arm7-sdk-arena-proof/original-read.json),
[setter LLVM output](arm7-sdk-arena-proof/llvm-setter-pair.txt), and
[caller LLVM output](arm7-sdk-arena-proof/llvm-caller-tail.txt).
[reproduce.py](arm7-sdk-arena-proof/reproduce.py) runs the pinned probe with its
packaged request, invokes both readers, and compares the new outputs with this
capsule. Run `python3 arm7-sdk-arena-proof/reproduce.py NEW_OUTPUT_DIRECTORY`
from this note's directory. The output directory must not already exist.
The recorded ROM, checked-layout, producer, and LLVM paths are external read-only
inputs; no private report or request is required to replay the package.
No SDK source copy, ROM, extracted binary, source/cache mutation, or canonical
change is committed.

## The next bounded ownership proof

The next useful proof is a caller-selected comparison of the two candidate
getters' reachable case bodies and literal operands against this pinned ARM7
reconstruction. The known case destinations are `0x037fcfa0`, `0x037fcfa8`,
and `0x037fcfb0` for the candidate high getter, and `0x037fcf48`, `0x037fcf50`,
and `0x037fcf60` for the candidate low getter. Each requires a separate finite
ARM selection with its branch guard retained; a literal load requires its own
checked four-byte data read. No case body or literal range is expanded here.

That comparison must treat donor-specific addresses and linker symbols as
unresolved inputs, rather than copying Pokémon values. A separately bounded
caller continuation can then test whether the same high/low sequence appears
for IDs 7 and 8. Only a consistent named donor cluster, explicit entry/extent
evidence, typed public contract, and original link/ownership validation could
justify a later signature or source-ownership proposal. Another matching generic
store or a typed setter compilation alone cannot distinguish the original
signature. This research leaves all promotion gates open.
