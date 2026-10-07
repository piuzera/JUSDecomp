# Bounded ARM7 lower-store C and native proof

The single frozen lower-store C hypothesis compiles to the exact original
20-byte ARM selection `[0x037fcf04,0x037fcf18)`. Native LLD consumes that actual
MW object directly and reconstructs both complete original ARM7 images exactly.
Omitted-object, wrong-placement, and malformed-load controls reject. Original
name, type, ABI, function extent, and source ownership remain unproved. Source
credit stays zero, canonical 304 remains unchanged, and T10 remains open.

## Static check before the one compiler experiment

The writer independently resolved original FNT/FAT79 and read both original
ARM7 headers and checked autoload mappings before compiling. Both identities
have the same five selected words, SHA256
`b1f95073bcc84916809b86a81bc8d2b6246515a3c4646a1f9ac171214a389488`:

```text
e1a00100  lsl r0, r0, #2
e2800627  add r0, r0, #0x02700000
e2800aff  add r0, r0, #0x000ff000
e5801da0  str r1, [r0, #0xda0]
e12fff1e  bx lr
```

The constants sum to `0x027ffda0`. The frozen
[low_store_trial.c](arm7-low-store-trial-proof/low_store_trial.c), SHA256
`1db6873b1ce806d32c2edffedce7a9d657418bd29a65269fd0ebb4f9dafe8362`,
models unsigned ARM32 address `0x027ffda0 + (index << 2)` and a volatile word
store of `value`. It preserves the supplied basename and function
`arm7_low_store_trial`. Unsigned arithmetic preserves the observed modulo-word
address calculation. Its parameter and void-return types remain hypotheses,
and the original BX transfer remains unresolved.
[Precompile static receipt](arm7-low-store-trial-proof/static-proof.json).
Root and independent static checks accepted this exact model before the
compiler gate opened. The selected direct caller remains `0x037fd06c`; no new
caller, range, function extent, or path-feasibility claim is introduced.

The address formula has an external/unmapped dependency. For example, index 1
computes `0x027ffda4`, outside both checked initialized/BSS mappings. This does
not establish ROM or BSS ownership, and the proof never reads RAM there.

The only experimental recipe is the accepted current build 82 and `-O4,s`:

```text
/private/tmp/jus-track-a/tools/wibo/wibo-macos
/private/tmp/jus-track-a/tools/mwccarm/1.2/sp2p3/mwccarm.exe
-proc arm7tdmi -nothumb -interworking -nostdinc -O4,s -c
NEW_PRIVATE_DIRECTORY/low_store_trial.c -o NEW_PRIVATE_DIRECTORY/compiled.o
```

No body, type, declaration, compiler, or flag variation ran. Fresh checks
reproduce this same fixed experiment.
[Recipe and tool pins](arm7-low-store-trial-proof/recipe.json),
[first actual compiler receipt](arm7-low-store-trial-proof/first-compile.json).

## Actual object and native original-image comparison

The actual 512-byte object has SHA256
`b0bd6f1c84e3710fc704f75a614a3c90532b44d1f274d236747cc0b752772af7`.
Its ELF is little-endian ARM32 with flags `0x02100000`; the global FUNC and
`.text` are both 20 bytes. `$a` is at zero, with no data marker, literal pool,
relocation section, or relocation records. All five instructions match both
original identities exactly.
[ELF readback](arm7-low-store-trial-proof/elf-readback.txt),
[compiled LLVM output](arm7-low-store-trial-proof/compiled-llvm.txt),
[original parent LLVM output](arm7-low-store-trial-proof/original-0-llvm.txt),
[original child LLVM output](arm7-low-store-trial-proof/original-1-llvm.txt).

The capsule owns its exact checked-layout copy, SHA256
`8a518abf785a1c24756d5485ee669f64e304af20a69b0d02a889fb60410d9fcc`.
Every reader/helper uses that relative file. The layout and fixed selection
produce an autoload0 split of 20,228 opaque prefix bytes, the 20-byte candidate,
and 45,872 opaque suffix bytes. Startup, autoload1, table, and separate BSS come
from the checked original mappings.
[Checked layout](arm7-low-store-trial-proof/checked-layouts.json),
[finite source/original manifest](arm7-low-store-trial-proof/original-manifest.json).

The linker receives the real `compiled.o(.text)` between the original prefix
and suffix. The proof checks the actual argv/input hash, map row, linked
function, candidate start/end, and actual linked bytes. The map places the
candidate at VMA `0x037fcf04`, physical stored address `0x023850b4`, and size
`0x14`. No object is patched, wrapped in an incbin, or assigned spoofed flags.

Each positive native ELF has SHA256
`2f67289e8e24014bfd32a0e06fa91d5334553cd1124b21b269756eaf42e13bb9`.
Its actual six load segments reconstruct the complete 165,552-byte original
ARM7 image, SHA256
`0540bd6fba14f886c542b3bfa15b1c0391b23dd4eaa3688367e1813cbc021139`,
in both program identities. BSS reservations total 21,424 bytes, every
noncandidate byte matches, and no linked relocation section remains. Native
file offsets are checked against actual section offsets and payload bounds.
They are not assumed to equal another producer's `file_offset`. Autoload0
section flags remain 6 while initialized PT_LOAD flags remain 4; BSS section
flags remain 3 and PT_LOAD flags remain 6.
[Actual complete trial receipt](arm7-low-store-trial-proof/trial-proof.json).

The omitted-object control removes `compiled.o` from the real LLD argv. The
wrong-placement control adds a four-byte gap before that unchanged object.
Both actual native links fail placement/size assertions. A separate malformed
copy moves the positive ELF's first load file offset by four; actual
segment/section correspondence rejects it. Positive source, tools, objects,
and linked artifacts remain unchanged.

## Public replay and tests

From the repository root, choose a nonexistent private directory:

```bash
PYTHONDONTWRITEBYTECODE=1 python3 decomp/matching-notes/other-cpus/arm7-low-store-trial-proof/reproduce.py NEW_PRIVATE_DIRECTORY
PYTHONDONTWRITEBYTECODE=1 python3 -m unittest discover -s decomp/matching-notes/other-cpus/arm7-low-store-trial-proof -p 'test_*.py' -v
```

The replay prints and returns `NEW_PRIVATE_DIRECTORY/trial-proof.json`.
It owns the C, manifest, layout, recipe, original reader, object parser, and
native checks. Only the original ROM and pinned tools are external inputs;
no private older object, checkout, report, or cache is required. The test
command creates its own fresh private replay and rereads actual object hashes,
map rows, native function bytes, and controls. Both tests failed before
implementation and now pass.
[Public replay](arm7-low-store-trial-proof/reproduce.py),
[finite helper](arm7-low-store-trial-proof/store.py),
[actual-artifact tests](arm7-low-store-trial-proof/test_store.py),
[red log](arm7-low-store-trial-proof/tdd-red.log),
[green log](arm7-low-store-trial-proof/tdd-green.log),
[fresh replay log](arm7-low-store-trial-proof/public-replay.log),
[test log](arm7-low-store-trial-proof/public-tests.log).
Objects, ELF files, maps, extracted image parts, and generated opaque assembly
stay private. The receipt has `elf`, `compile_command`, `originals`, and
`programs`. Each program records `positive`, `omitted_object`, `wrong_placement`,
and `malformed_load`. Exactly two Python implementation files produce it.
After committing the package, check every public pin against Git HEAD:

```bash
python3 decomp/matching-notes/verify-evidence-pins.py decomp/matching-notes/other-cpus/arm7-low-store-trial-proof/evidence-pins.json
```

Original signature and linker/source ownership remain the integration boundary.
This finite exact match grants no additional decode selection, original
function extent, execution claim, or source credit.
