# ARM7 arena getter case and literal grounding

The selected JUS getter clusters agree with the pinned public reconstruction's
ID dispatch, low-bound clamps, high-bound stack arithmetic, and zero default.
Their literal values also reveal a concrete donor difference: the JUS ID-1 low
value is `0x027f9c08`, the checked autoload1 BSS end, rather than Pokémon's
hardcoded `0x027fafcc`. This strengthens the
[arena hypothesis](arm7-sdk-arena-hypothesis.md) while leaving original names,
C types, ABI, ownership, function extent, SDK version, and link contracts unproved.

This note adds bounded research evidence only. ARM7 source credit stays zero,
canonical 304 stays unchanged, and T10 remains open. It does not expand the
initializer's later ID-7/8 caller pairs or claim runtime feasibility.

## Frozen instruction ownership

A first bounded raw read used the known dispatch, case, and default entry
addresses. Seven-word dispatch windows stop before the first separately owned
case. Each case/default window ends after its selected final `BX lr`, before the
next entry or literal pool. The longer high-ID-8 window includes the conditional
`BXEQ lr` and its failed-condition continuation through the final `BX lr`.
Those observations fixed the following ten windows before the graph run.
They are selection limits, not discovered original function boundaries.

| Candidate role | Explicit ARM selection | Words |
| --- | --- | ---: |
| Low dispatch | `[0x037fcf2c,0x037fcf48)` | 7 |
| Low ID 1 | `[0x037fcf48,0x037fcf50)` | 2 |
| Low ID 7 | `[0x037fcf50,0x037fcf60)` | 4 |
| Low ID 8 | `[0x037fcf60,0x037fcf74)` | 5 |
| Low default | `[0x037fcf74,0x037fcf7c)` | 2 |
| High dispatch | `[0x037fcf84,0x037fcfa0)` | 7 |
| High ID 1 | `[0x037fcfa0,0x037fcfa8)` | 2 |
| High ID 7 | `[0x037fcfa8,0x037fcfb0)` | 2 |
| High ID 8 | `[0x037fcfb0,0x037fcfe8)` | 14 |
| High default | `[0x037fcfe8,0x037fcff0)` | 2 |

The windows contain 47 instructions and do not overlap one another or the
previous seven selections. No instruction selection includes a literal word.
The public [frozen manifest](arm7-arena-getter-proof/frozen-manifest.json) records
every raw word and full window SHA256, plus separate literal identities and their
load sources. Its SHA256 is
`978c0a6d743ba6a790de8f2d4277747055913d27044cd9d2c2c8afadc7b18310`.

The independent reader resolved the original FNT path `ChildRom/JSS2Child.srl`
to FAT 79 and checked both program digests, NDS ARM7 headers, image digests,
module parameters, loader table, and both initialized autoload payloads. Each
window has the same words and digest in the parent and child. Their full program
identities remain separate. Native LLVM ARMv4T accepted all 47 words;
[its output](arm7-arena-getter-proof/llvm-getter-windows.txt) separates each exact
window. No binary or ROM data file is published.

## Literal words are separate initialized data

Each listed item is exactly four bytes of checked autoload0 initialized data in
each original program. For every load, the reader independently verifies
`literal_address = instruction_address + 8 + encoded_positive_offset`.
It reads the word at that address, not RAM at the word's value.

| Literal address | Load instruction address | Word | Value relation to checked modules |
| --- | --- | --- | --- |
| `0x037fcf7c` | `0x037fcf48` | `0x027f9c08` | Exclusive autoload1 BSS end; unmapped |
| `0x037fcf80` | `0x037fcf50`, `0x037fcf64` | `0x0380bc90` | Exclusive autoload0 BSS end; unmapped |
| `0x037fcff0` | `0x037fcfa0` | `0x027ff000` | Outside checked initialized/BSS ranges |
| `0x037fcff4` | `0x037fcfb0` | `0x00000400` | Scalar word; no checked module mapping |
| `0x037fcff8` | `0x037fcfb4` | `0x0380ff80` | Outside checked initialized/BSS ranges |
| `0x037fcffc` | `0x037fcfc0` | `0x0380bc90` | Exclusive autoload0 BSS end; unmapped |
| `0x037fd000` | `0x037fcfcc` | `0x00000400` | Scalar word; no checked module mapping |

The independent loader-table reads yield autoload0 initialized
`[0x037f8000,0x03808248)` and BSS `[0x03808248,0x0380bc90)`;
autoload1 initialized `[0x027e0000,0x027f82a0)` and BSS
`[0x027f82a0,0x027f9c08)`. The two literal/end equalities are arithmetic facts
about the checked layout. They do not make the exclusive ends initialized bytes
or recover BSS contents. All seven literal-storage extents and SHA256 values,
their PC arithmetic, and per-program mapping classifications appear in
[original-read.json](arm7-arena-getter-proof/original-read.json).

## Comparison with the pinned public donor

The only comparison donor is `pret/pokediamond`
`38f3650189f8989aed91618745aa74029fa60247`, a community reconstruction rather
than an identified original JUS SDK version. Its initial-bound getters dispatch
IDs 1, 7, and 8 and default to zero. Its low-ID-1 value is hardcoded
`0x027fafcc`; other cases depend on linker arena/stack symbols.
[Reconstructed ARM7 source](https://github.com/pret/pokediamond/blob/38f3650189f8989aed91618745aa74029fa60247/arm7/lib/src/OS_arena.c).

The donor memory headers give `HW_WRAM_END` and `HW_PRV_WRAM` as `0x03800000`.
They derive the sub-main-memory end as `0x027ff000` and IRQ-stack end as
`0x0380ff80`. These agree with the JUS high-ID-1 literal, high-ID-7 immediate,
and high-ID-8 literal. This is a calculation from those public constants.
[ARM7 memory header](https://github.com/pret/pokediamond/blob/38f3650189f8989aed91618745aa74029fa60247/arm7/lib/include/mmap.h),
[shared constants](https://github.com/pret/pokediamond/blob/38f3650189f8989aed91618745aa74029fa60247/include/nitro/mmap_shared.h).

| Case | Selected JUS operation | Donor comparison |
| --- | --- | --- |
| Low 1 | Load `0x027f9c08`, then `BX lr` | Different linked low value |
| Low 7 | Load `0x0380bc90`; unsigned HI replacement with `0x03800000` | Low bound capped at WRAM end |
| Low 8 | Start at `0x03800000`; unsigned HI replacement with `0x0380bc90` | Low bound raised to arena low |
| High 1 | Load `0x027ff000`, then `BX lr` | Sub-main-memory end |
| High 7 | Move `0x03800000`, then `BX lr` | WRAM end |
| High 8 | Subtract `0x400` from `0x0380ff80`; unsigned HI low-bound choice; compare a second `0x400`; EQ exchange, LT/GE subtractions, final exchange | IRQ/system-stack formula shape |
| Defaults | Move zero, then `BX lr` | Zero default |

The low clamp shapes and high-ID-8 zero/negative/nonnegative stack handling agree
with the donor source. Under that interpretation, the two `0x400` words would be
stack-size link values and `0x0380bc90` an arena-low link value. Their original
JUS symbol names and signed C types remain unknown. A source-shaped explanation
of the observed arithmetic does not prove branch feasibility or resolve returns.
[Donor getter bodies](https://github.com/pret/pokediamond/blob/38f3650189f8989aed91618745aa74029fa60247/arm7/lib/src/OS_arena.c).

## Actual graph, conditions, and remaining frontiers

The [request](arm7-arena-getter-proof/requests.json) retains the previous seven
selections and root `0x037f8468`, then appends only the ten frozen windows.
Its SHA256 is
`a7c79ddf45b866017e2e7da3c3d298ac9d42cef9a54368c912fee0934012aa01`.
The actual frozen producer accepted all windows atomically. Both candidate
dispatches now resolve as selected direct-call targets, without creating new
roots or assigning function ownership.

Each exact program has 81 nodes, 95 edges, all 81 nodes visited, 95 edge
examinations, 80 selected edges, zero mode conflicts, and 15 frontiers.
Four remain outside the selections: `0x037f8470`, `0x037fced8`,
`0x037fd0c8`, and `0x037fd070`. Eleven are unknown `BX lr` exchanges at
`0x037fcf14`, `0x037fcf28`, `0x037fcf4c`, `0x037fcf5c`, `0x037fcf70`,
`0x037fcf78`, `0x037fcfa4`, `0x037fcfac`, `0x037fcfd4`, `0x037fcfe4`,
and `0x037fcfec`. The conditional exchange at `0x037fcfd4` keeps its EQ-passed
unknown edge 87 and EQ-failed selected fallthrough edge 88. No pool is a node.

All six dispatch EQ branches retain separate passed/failed guards, as does the
previous NE branch. HI, LT, and GE remain instruction conditions in the graph;
ordinary arithmetic instructions retain always-fallthrough edges. Those edges
do not mean the conditional write happened. Every caller continuation retains
`call_returned`. The graph does not propagate argument constants, substitute
literal values, or decide feasible execution. Its frontier witnesses describe
guarded syntactic paths, not proved return paths.

The full private report is 1,272,089 bytes, SHA256
`128ea0b92922521b237d5d7f65a820d3154c289ba8605f71fa00bea10bdb9560`,
recorded originally at `/private/tmp/jus-arm7-arena-getter-worker-proof/report.json`.
The [compact summary](arm7-arena-getter-proof/graph-summary.json) preserves every
node, edge, condition, guard, mapping resolution, root predecessor, and frontier
witness per exact identity. It is generated from a fresh report and the packaged
request, not from a private triage file.

## Replay and the next proof

Run `python3 arm7-arena-getter-proof/reproduce.py NEW_OUTPUT_DIRECTORY` from this
note's directory. The new output directory must not exist. The script reads its
own committed request and frozen word/literal manifest, runs the pinned probe,
independently reads both original programs, invokes native LLVM, and compares
all generated readbacks with the package. The ROM, checked layout, frozen
producer, and LLVM paths recorded in the scripts remain external read-only
inputs. No private report, manifest, source copy, or request is needed.
[Commands](arm7-arena-getter-proof/commands.json) record the actual successful
probe invocation; [source metadata](arm7-arena-getter-proof/external-sources.json)
pins the inspected donor files. The package contains no objects or ROM binaries.

One compiler experiment is justified by the complete low cluster. Compile a
candidate unsigned-ID, pointer-return C switch with cases 1, 7, and 8, the observed
unsigned cap/raise operations, and two hypothesis-named external absolute symbols.
Use only the accepted MW ARM7 `-O4,p` recipe. Inspect the actual ELF symbol, ARM
mode, section bytes, literal placement, and relocations. Then attempt a native
ARM link at candidate address `0x037fcf2c`, binding those two hypothesis symbols to
the checked values `0x027f9c08` and `0x0380bc90`. Compare the fixed 80 instruction
bytes plus the two separate four-byte literal words in both original programs.
Record a mismatch or linker rejection and stop, without recipe search. No such
compile or link runs in this scope. The candidate types and link names would test
a hypothesis, not recover original declarations or ownership.

The concrete next caller evidence is the initializer continuation beginning at
`0x037fd070`, to test the proposed ID-7/8 caller pairs without extending either
getter automatically. Original signature and ownership still need independent
entry/extent, ABI, SDK-version, and link-contract evidence; this getter comparison
cannot supply them. A later typed compile can test a candidate contract, but an
exact match alone would still not identify the original source or its ownership.
