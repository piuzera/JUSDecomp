# ARM7 callee prefix grounding

The explicit ARM selection `[0x037fd02c,0x037fd044)` decodes atomically as six
instructions in each exact program. Adding this 24-byte prefix to the existing
two caller selections connects the call at `0x037fced4` to selected instruction
start `0x037fd02c`. The resulting candidate graph has 11 nodes, 14 edges, and
four frontiers per program. The new frontiers are the two guarded outcomes of
`BNE` at `0x037fd040`.

This is a bounded research result under an explicit root assumption. It
establishes no runtime execution, function extent, code/data partition, original
relocation, or ARM7 source credit. Startup's `BX` remains unknown. The canonical
source count remains 304, ARM7 source credit remains zero, and T10 stays open.

## Frozen inputs and identity

The producer is the accepted research-only reachable probe from DSD revision
`71e766e562c78d4b0ec404b3b4edbe242a8d1b0f`. Its executable is
`/private/tmp/jus-arm7-reachable-root-cache/target/release/examples/arm7_reachable_probe`,
SHA256 `28e47852e593d3636d66c797c67963f5c052840c7e0e171ea7dd0dd1bda497ff`.
The frozen DSD source, cache, and executable were read only.

The original ROM is `/Users/djdjo/Documents/mine/rom/jus.nds`, SHA256
`a9c9bf89e6d99548b7c87e822b217c3fb74ef25186535b06193a6fb73d0d6d27`.
The layout is [arm7-checked-layouts.json](arm7-checked-layouts.json), SHA256
`8a518abf785a1c24756d5485ee669f64e304af20a69b0d02a889fb60410d9fcc`.
The original NDS FNT independently resolves `ChildRom/JSS2Child.srl` to FAT
file 79, whose original-ROM extent is `[0x23b800,0x4464c8)`.

The parent identity uses that ROM digest as both parent-ROM and program digest.
The child identity retains the same parent-ROM digest, the `nitro_fs` path
`ChildRom/JSS2Child.srl`, and program SHA256
`1f68f8a95818ca23e359aa24ab21b7353b6e3515964957f0f519caaaa6ec4986`.
Equal ARM7 image and prefix digests do not join these program identities. The
request and resulting graph retain each identity separately.

Graph discovery used `ds-decomp-arm7-reachable-review`. `get_code_snippet`
read `Arm7ModuleInput.decode_span` at `lib/src/rom/arm7_modules.rs:103` and
`observe` at `lib/src/analysis/arm7_observation.rs:127` from the frozen source.
The decoder checks bounds, ARM alignment, little-endian V4T legality, and complete
span consumption. It rejects a failing selection without a partial observation.
This selection passed. The graph did not discover or decode another range.

## One added selection

The request preserves the two selections and root from the published
[calls request](arm7-reachable-proof/calls-requests.json). It appends one selection
per exact identity, all in initialized autoload0 and explicit ARM mode:

| Selection index | Extent | Bytes | Role |
| --- | --- | ---: | --- |
| 0 | `[0x037f8468,0x037f8470)` | 8 | Existing caller and explicit root |
| 1 | `[0x037fcecc,0x037fced8)` | 12 | Existing caller prefix |
| 2 | `[0x037fd02c,0x037fd044)` | 24 | Only added selection |

The root remains selection 0 at `0x037f8468`, with the unchanged assumption
`Grounded explicit ARM root; execution and function extent remain unknown`.
The requested prefix starts at the previously reported direct call frontier
`0x037fd02c`. Its end is a caller-selected decode limit. It is not a function end.
No other ARM or Thumb interpretation was requested.

The original parent and child NDS headers independently give ARM7 entry and
stored image base `0x02380000`, image size `0x286b0`, and image offsets `0x210000`
and `0x1e1a00`, respectively. Both image digests are
`0540bd6fba14f886c542b3bfa15b1c0391b23dd4eaa3688367e1813cbc021139`.
Reading the module parameters and loader table independently establishes
autoload0 runtime base `0x037f8000`, initialized size `0x10248`, BSS size `0x3a48`,
and stored image start `0x1b0`.

The selected prefix therefore starts at stored image offset
`0x1b0 + (0x037fd02c - 0x037f8000) = 0x51dc`. Its parent program offset is
`0x2151dc`, and its child program offset is `0x1e6bdc`, or original-ROM offset
`0x4223dc`. The 24 bytes have SHA256
`cc0404050002c6ff8309766ef0431c16eabaeb11f1407ee6fdff635cbb08e871`
in both exact programs.

## Original words and instruction evidence

Independent LLVM ARMv4T disassembly agrees with the six producer instructions.
All instructions are four bytes. The first five have ARM condition AL, represented
as `condition: null`; the last has condition `ne`.

| Address | Original little-endian word | Instruction |
| --- | --- | --- |
| `0x037fd02c` | `0xe92d4000` | `stmdb sp!, {lr}` |
| `0x037fd030` | `0xe24dd004` | `sub sp, sp, #4` |
| `0x037fd034` | `0xe59f1090` | `ldr r1, [pc, #0x90]` |
| `0x037fd038` | `0xe5910000` | `ldr r0, [r1]` |
| `0x037fd03c` | `0xe3500000` | `cmp r0, #0` |
| `0x037fd040` | `0x1a00001e` | `bne 0x037fd0c0` |

For the BNE word, `imm24 = 0x1e` gives signed displacement `0x78`.
Independent ARM branch arithmetic gives
`0x037fd040 + 8 + 0x78 = 0x037fd0c0`. LLVM prints `bne #120`, the encoded
displacement before the ARM PC bias; the producer prints `bne #0x80`, the
displacement including that bias. These are the same branch.

The literal-load address is `0x037fd034 + 8 + 0x90 = 0x037fd0cc`. Only this
address arithmetic is recorded. The literal value and the memory contents
subsequently read through `r1` were not inspected, so the comparison result and
branch feasibility remain unknown.

## Guarded graph and remaining frontiers

The seven prefix transfers preserve both outcomes of the NE condition. All
numeric destinations map to initialized autoload0 bytes in the same exact
program and ARM mode. That mapping does not establish executability.

| Edge | Source | Condition | Transfer and guard | Destination | Graph resolution |
| ---: | --- | --- | --- | --- | --- |
| 7 | `0x037fd02c` | AL | fallthrough, `always` | `0x037fd030` | selected node 6 |
| 8 | `0x037fd030` | AL | fallthrough, `always` | `0x037fd034` | selected node 7 |
| 9 | `0x037fd034` | AL | fallthrough, `always` | `0x037fd038` | selected node 8 |
| 10 | `0x037fd038` | AL | fallthrough, `always` | `0x037fd03c` | selected node 9 |
| 11 | `0x037fd03c` | AL | fallthrough, `always` | `0x037fd040` | selected node 10 |
| 12 | `0x037fd040` | NE | branch, `condition_passed` | `0x037fd0c0` | `outside_selection` frontier |
| 13 | `0x037fd040` | NE | fallthrough, `condition_failed` | `0x037fd044` | `outside_selection` frontier |

The earlier call at `0x037f846c` resolves to selected node 2 at `0x037fcecc`.
The call at `0x037fced4` now resolves to selected node 5 at `0x037fd02c`, while
its observation still records that destination as outside its own selection.
The two earlier call continuations remain guarded by `call_returned` and stop
outside the supplied selections.

Both graphs have three observations, 11 nodes, 14 edges, 10 selected edges,
and four frontier edges. The explicit root visits all 11 nodes and examines
14 edges. There are zero mode conflicts and zero unknown-target edges within
these selected call graphs. Startup was not part of this request, and its
unknown `BX` destination remains unresolved.

All four root-relative frontier witnesses preserve the original edge guards:

| Frontier edge | Source and guard | Destination | Witness edge sequence |
| ---: | --- | --- | --- |
| 2 | `0x037f846c`, `call_returned` | `0x037f8470` | `0, 2` |
| 6 | `0x037fced4`, `call_returned` | `0x037fced8` | `0, 1, 3, 4, 6` |
| 12 | `0x037fd040`, NE `condition_passed` | `0x037fd0c0` | `0, 1, 3, 4, 5, 7, 8, 9, 10, 11, 12` |
| 13 | `0x037fd040`, NE `condition_failed` | `0x037fd044` | `0, 1, 3, 4, 5, 7, 8, 9, 10, 11, 13` |

The common witness reaches the new prefix from root `0x037f8468` through call
site `0x037f846c`, selected start `0x037fcecc`, and call site `0x037fced4`.
No edge proves that a call returns or that either NE outcome executes. Neither
frontier was decoded, and no frontier is a discovered function end.

## Reproduction record

The [request](arm7-callee-prefix-proof/requests.json) SHA256 is
`91fc7b3da7000d67be18042a49e513a4d5ac474cb4430bb13a13ea21f33296ef`.
The exact successful six-argument invocation is retained in
[commands.json](arm7-callee-prefix-proof/commands.json). It consumes the frozen
ROM, layout and digest, request and digest, and producer digest. The process
returned 0 with empty stderr and reported `inputs_unchanged: true`.
Its complete private report SHA256 is
`e3920a2a353cbfb5c9a35a0d0e2a01f23cfe4a75e3580215f38de62f389b8bf7`.

The committed [graph summary](arm7-callee-prefix-proof/graph-summary.json)
retains each exact identity, every selected instruction, every edge condition,
guard, target, resolution, root predecessor, count, and frontier witness.
The full 159,209-byte report remains at
`/private/tmp/jus-arm7-callee-worker-proof/report.json`.

The independent [original-ROM reader](arm7-callee-prefix-proof/read_original.py)
checks FNT/FAT identity, each header, image digest, module parameters, loader
mapping, prefix words, digest, and raw branch arithmetic. It feeds only the
selected 24 bytes through stdin to
`/opt/homebrew/opt/llvm/bin/llvm-mc --disassemble --triple=armv4t-none-eabi`.
[original-read.json](arm7-callee-prefix-proof/original-read.json) and
[llvm-decode.txt](arm7-callee-prefix-proof/llvm-decode.txt) retain the results.
No ROM, extracted binary, source change, or build output is committed.

## Next bounded operation and barrier

A next caller-owned expansion can select a separate finite ARM prefix beginning
at `0x037fd044` or `0x037fd0c0`, with the corresponding NE guard preserved.
This record supplies no decode range for either destination. The other two
frontiers still require separately selected call-return continuations.

Resolving which NE path is feasible requires new evidence for the literal at
`0x037fd0cc` and the memory state read through its value. Function mapping also
needs independent entry and extent evidence. The selected graph supplies
neither value propagation nor execution traces, original relocations, or source
ownership. This prefix does not complete the ARM7 binary baseline or T10.
