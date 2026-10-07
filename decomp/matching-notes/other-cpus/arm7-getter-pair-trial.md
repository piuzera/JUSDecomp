# Actual ARM7 low/high getter pair integration

Both accepted C hypotheses coexist in one native LLD link at the original
adjacent placements. The actual MW objects retain their accepted hashes. Five
real `R_ARM_ABS32` records resolve through four hypothetical bindings, including
one WRAM symbol shared by both getter pools. Both complete original ARM7 images
match. This is a bounded integration proof; original names, types, ABI, function
extents, SDK version, and source ownership remain unknown. Source credit stays
zero, canonical 304 stays unchanged, and T10 remains open.

## Fixed inputs and proof ownership

The low source remains byte-exact SHA256
`fe3711c03cb2f0e0ee50a0751604766984e4a285a369290f6f159b87019bd537`;
the high source remains byte-exact SHA256
`342ace7943b49cb8a8fc7e47497ce0ea2a33c88948b877333875744528f0cd0e`.
Their basenames, functions, declarations, and bodies are unchanged. Each fresh
compile uses local build 82 and the same `-proc arm7tdmi -nothumb -interworking
-nostdinc -O4,s -c` flags. No candidate, flag, type, or source variation ran.
[Low C](arm7-getter-pair-proof/low_getter_trial.c),
[high C](arm7-getter-pair-proof/high_getter_trial.c),
[fixed role contract](arm7-getter-pair-proof/contract.json),
[tool recipe](arm7-getter-pair-proof/recipe.json).

The capsule owns an exact Git-tracked checked-layout copy, SHA256
`8a518abf785a1c24756d5485ee669f64e304af20a69b0d02a889fb60410d9fcc`.
All original readers and native helpers use that package-relative file. Only
the recorded original ROM and pinned tools are external replay inputs. No old
private checkout, baseline object, report, donor checkout, or cache is required.
[Checked layout](arm7-getter-pair-proof/checked-layouts.json),
[original window/literal manifest](arm7-getter-pair-proof/original-manifest.json).

One public operation `replay(NEW_PRIVATE_DIRECTORY) -> receipt Path` hides the
finite compile/link proof. It returns only after all checks pass; failed runs
retain private diagnostics without a completed receipt. Two implementation
files own this behavior. One low/high contract derives placements and opaque
ranges, while an immutable four-field value holds the bindings.
[Design synthesis](arm7-getter-pair-proof/design.md),
[public replay](arm7-getter-pair-proof/reproduce.py),
[private pair implementation](arm7-getter-pair-proof/pair.py).

## Actual objects, maps, symbols, and bytes

| Role | Original candidate placement | Code / pool | Actual MW object SHA256 |
| --- | --- | --- | --- |
| Low | `[0x037fcf2c,0x037fcf84)`, 88 bytes | 80 / 8 | `9704c69afb0dcc0a31dd008c8e4f6ce8b6f91537133238b9ecfec7c6958f076b` |
| High | `[0x037fcf84,0x037fd004)`, 128 bytes | 108 / 20 | `b392c58eb43db4427e075bf7757181dfc6ea5a16eb6ffb5686292d2c29fc50f1` |

The producer checks each actual ELF's ARM mapping symbols, function and `.text`
extents, object hash, and real zero-addend `.rela.text` records. Low has offsets
80 SUBPRIV and 84 WRAM. High has offsets 112 IRQ, 120 WRAM, and 124 system. Four
linker hypotheses bind SUBPRIV to `0x027f9c08`, WRAM to `0x0380bc90`, and each
stack size to `0x400`. The original reader independently resolves FNT/FAT79,
checks both original program/header/image identities and autoload records,
reads all frozen instruction windows and separate literal words, and decodes
only the instruction bytes with LLVM ARMv4T. Diagnostic pool resolution checks
correspondence; it never supplies native candidate bytes.

Autoload0 splits into 20,268 original opaque prefix bytes, the 216-byte pair,
and 45,636 opaque suffix bytes. Native LLD consumes both actual objects as
`low.o(.text)` followed by `high.o(.text)`. Neither object is wrapped in an
incbin, patched, or assigned different ELF flags. Separate original startup,
autoload1, table, and BSS pieces come from checked mappings.

Each role is checked individually against its actual argv input hash, numeric
map extent, linked function and bounds, and actual linked bytes. The positive
map rows place low at VMA `0x037fcf2c`, physical stored address `0x023850dc`,
size `0x58`; high at VMA `0x037fcf84`, physical address `0x02385134`, size `0x80`.
The low linked bytes retain SHA256
`3e92f8f0b8ebb25e84dbe31ad77910309085d7d1def7e4a5821cbf196f62b9c2`;
the high retains
`13b9cdc287f94094ed89582210e0c8d008ca9395b768c3f3fec183882af88fa4`.

Both positive native ELFs have SHA256
`6298ed9bc7214942ac6fbf6fefedf26c5dafd65a7806c53f14e75083783597c8`.
Reading their actual six load segments reconstructs each complete 165,552-byte
original ARM7 image with SHA256
`0540bd6fba14f886c542b3bfa15b1c0391b23dd4eaa3688367e1813cbc021139`.
Separate BSS reservations total 21,424 bytes, every noncandidate byte matches,
and no unresolved relocation section remains.
[Actual pair receipt](arm7-getter-pair-proof/trial-proof.json).

The segment checks derive physical addresses and memory/file sizes from the
original NDS checked layout. They check native ELF file offsets against actual
section offsets and payload bounds. They do not equate another producer's
`file_offset` with native LLD output or claim an original ELF identity.
Autoload0 section flags remain 6 and its initialized PT_LOAD flags remain 4;
BSS section flags remain 3 and PT_LOAD flags remain 6.

## Actual native negatives

The wrong shared WRAM binding `0x0380bc94` changes both observed relocated
operands. Derivation from each checked candidate position and actual RELA slot
yields exactly stored-image bytes 20784 and 20908. Both linked WRAM words read
back as `0x0380bc94`, and strict original comparison rejects both images. All
four supplied bindings, including the changed WRAM value, are checked against
actual native symbols for each trial.

Omitting the low object from actual LLD input fails the individual placement
assertions. Reversing the two role selectors while retaining both genuine
objects also fails native placement. The producer records the actual input
hashes, argv, and LLD errors for each negative. A separate malformed copy moves
the positive ELF's first load file offset by four; actual segment/section
correspondence rejects it. No positive artifact changes.

## Replay, tests, and receipt fields

From the repository root, choose a nonexistent private directory:

```bash
PYTHONDONTWRITEBYTECODE=1 python3 decomp/matching-notes/other-cpus/arm7-getter-pair-proof/reproduce.py NEW_PRIVATE_DIRECTORY
PYTHONDONTWRITEBYTECODE=1 python3 -m unittest discover -s decomp/matching-notes/other-cpus/arm7-getter-pair-proof -p 'test_*.py' -v
```

The CLI prints `NEW_PRIVATE_DIRECTORY/trial-proof.json`. The test command
creates its own fresh private output and needs no object-path environment
variables. Four tests failed before implementation, then passed with actual
objects, native maps, ELF bytes, and controls. The tests reread real object
hashes and native function bytes, rather than relying on producer booleans or
selector string counts. Objects, ELF files, maps, extracted parts, and generated
opaque assembly stay private. [Tests](arm7-getter-pair-proof/test_pair.py),
[red log](arm7-getter-pair-proof/tdd-red.log),
[green log](arm7-getter-pair-proof/tdd-green.log),
[fresh replay log](arm7-getter-pair-proof/public-replay.log),
[test log](arm7-getter-pair-proof/public-tests.log).

The receipt keys are `getters` for each source/compile/actual ELF;
`originals` for distinct program identities and original readbacks; and
`programs` for each linked image. Each program has `positive`,
`wrong_shared_wram`, `omitted_low`, `swapped_roles`, and `malformed_load`.
Positive and shared-binding readbacks contain actual inputs, map rows,
individual functions/bytes, all observed bindings, segments, and image hashes.
Only `reproduce.py` and `pair.py` implement the producer. Their input integrity
pins are in the same evidence manifest as the Git-owned public artifact pins.
After committing, run:

```bash
python3 decomp/matching-notes/verify-evidence-pins.py decomp/matching-notes/other-cpus/arm7-getter-pair-proof/evidence-pins.json
```

The remaining source boundary is original signature and linker ownership.
Simultaneous exact bytes do not establish original source provenance or runtime
feasibility. Unknown BX transfers and finite instruction ownership remain as
accepted in .21; this proof adds no decode selections or source credit.
