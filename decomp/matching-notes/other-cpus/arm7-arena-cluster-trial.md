# Four actual ARM7 arena candidates in one native link

Four accepted C hypotheses coexist in one native link at their original
adjacent placements. Their sources, basenames, functions, recipes, and whole
MW object hashes remain unchanged. Both complete original ARM7 images match.
The equal-sized store swap actually links, then strict map-role readback rejects
it. This integrates accepted candidates; it establishes no original name, type,
ABI, function extent, SDK version, or source ownership. ARM7 source credit stays
zero, canonical 304 stays unchanged, and T10 remains open.

## Fixed roles and the two accepted recipes

The upper store retains its original accepted build-114 `-O4,p` recipe. The
lower store and both getters retain build 82 with `-O4,s`. Both recipes preserve
`-proc arm7tdmi -nothumb -interworking -nostdinc -c`, the original argument
order, and source basename. No compiler, source, type, declaration, body, or
flag variation ran. An unexpected whole object fails the premise and stops
before native work.

| Role | Source / hypothetical function | VMA / bytes | Recipe | Actual object SHA256 |
| --- | --- | --- | --- | --- |
| Lower store | `low_store_trial.c` / `arm7_low_store_trial` | `0x037fcf04` / 20 | build82, O4s | `b0bd6f1c84e3710fc704f75a614a3c90532b44d1f274d236747cc0b752772af7` |
| Upper store | `store_trial.c` / `arm7_store_trial` | `0x037fcf18` / 20 | build114, O4p | `03aebe3ecc0c8fbbc1466d836bd2b659827b2a078f56c9eed1137d7abc426ccf` |
| Lower getter | `low_getter_trial.c` / `arm7_low_getter_trial` | `0x037fcf2c` / 88 | build82, O4s | `9704c69afb0dcc0a31dd008c8e4f6ce8b6f91537133238b9ecfec7c6958f076b` |
| Upper getter | `high_getter_trial.c` / `arm7_high_getter_trial` | `0x037fcf84` / 128 | build82, O4s | `b392c58eb43db4427e075bf7757181dfc6ea5a16eb6ffb5686292d2c29fc50f1` |

The single [fixed four-role contract](arm7-arena-cluster-proof/contract.json)
owns source and object pins, role/function identities, original placements,
code/pool sizes, observed RELAs, and recipe keys. Its four copied C sources have
SHA256 `1db6873b1ce806d32c2edffedce7a9d657418bd29a65269fd0ebb4f9dafe8362`,
`a6457f199a58403507cc0262b1187ebccd1df05190d50771c6a9ae9eafa24abb`,
`fe3711c03cb2f0e0ee50a0751604766984e4a285a369290f6f159b87019bd537`,
and `342ace7943b49cb8a8fc7e47497ce0ea2a33c88948b877333875744528f0cd0e`
in that fixed order. The [two recipes](arm7-arena-cluster-proof/recipes.json)
pin both compiler executables, adjacent DLLs, Wibo, LLVM, clang, and LLD.
[First actual compile receipt](arm7-arena-cluster-proof/first-compile.json).

The selected two-file boundary is sufficient. `reproduce.py` owns one public
`replay(output: Path) -> Path` operation, pin checks, and per-role compilation.
`cluster.py` owns private verified candidates, immutable four-field bindings,
original reads, native construction, and ELF/map checks. It accepts exactly the
four known roles in their fixed order. It derives the hole, opaque ranges,
selectors, map physical addresses, preserved intervals, and negative positions
from the contract and owned checked mappings. No registry, extra plan module,
wrapper protocol, or recipe homogenization is introduced.

## Original reads and actual native inputs

The capsule owns the exact checked-layout copy, SHA256
`8a518abf785a1c24756d5485ee669f64e304af20a69b0d02a889fb60410d9fcc`.
All readers and helpers use that relative file. Original FNT/FAT79, ARM7 headers,
full program/image identities, autoload records, instruction windows, literal
words, and PC-relative literal operands are reread independently. LLVM decodes
only the frozen instruction selections. There are 57 instruction words and
seven separate pool words across the four candidates. No new decode selection
or original function-extent claim follows.
[Checked layout](arm7-arena-cluster-proof/checked-layouts.json),
[original manifest](arm7-arena-cluster-proof/original-manifest.json).

Both store objects contain exactly 20 ARM bytes with no pool or relocations.
The lower getter contains 80 instruction bytes and eight pool bytes; the upper
contains 108 instruction bytes and 20 pool bytes. The producer validates each
actual mapping marker, global FUNC, `.text`, symbol identity, and whole object
hash. Five real zero-addend `R_ARM_ABS32` records resolve through four linker
hypotheses: SUBPRIV `0x027f9c08`, shared WRAM `0x0380bc90`, IRQ size `0x400`, and
system size `0x400`. Every supplied value is checked against the actual linked
symbol, including the value changed by the negative.

The contiguous `[0x037fcf04,0x037fd004)` hole is 256 bytes. Autoload0 derives a
20,228-byte original opaque prefix and 45,636-byte original opaque suffix.
Native LLD receives all four actual MW objects directly, in role order, between
those pieces. No accepted candidate's original bytes remain opaque inside the
hole. No MW object is replaced by an incbin, patched, or given spoofed flags.
Startup, autoload1, table, and separate BSS come from original checked mappings.

Each actual input hash and argv object is associated with its numeric map row,
linked function/start/end, and actual linked bytes. Both positive native ELFs
have SHA256
`dbf07694b3d6b50643c1a348dfe0b93844cd7ff46345ff0fcf1ccbaaef54efca`.
Their actual six load-segment payloads reconstruct each complete 165,552-byte
original ARM7 image with SHA256
`0540bd6fba14f886c542b3bfa15b1c0391b23dd4eaa3688367e1813cbc021139`.
Separate BSS reservations total 21,424 bytes; every noncandidate byte matches,
and no linked relocation section remains.
[Actual four-role trial receipt](arm7-arena-cluster-proof/trial-proof.json).

Native file offsets are checked against actual section offsets and payload
bounds. Physical/runtime addresses and file/memory sizes derive from the
original NDS checked layout, rather than another producer's `file_offset`.
Autoload0 section flags remain 6 while initialized PT_LOAD flags remain 4.
BSS section flags remain 3 and PT_LOAD flags remain 6. This generated ELF does
not establish an original ELF identity.

## Native controls and the equal-sized store distinction

The shared WRAM negative binds `0x0380bc94`. It changes exactly stored-image
bytes 20784 and 20908, derived from checked candidate positions and actual RELA
slots. Both getter pool words read back with the changed value, both store
functions remain byte-exact, and strict original comparison rejects the output.

Each of the four real omitted-input trials removes one actual MW object from
LLD's argv and fails native placement assertions. The producer records the
remaining actual input hashes, argv, and LLD errors separately for each role.

Reversing the two genuine 20-byte store selectors succeeds in native LLD with
return code zero. Size and contiguous-bound assertions therefore pass. Actual
map-role readback rejects the lower-store object at `0x037fcf18` instead of
`0x037fcf04`. The actual lower-store function likewise moves to `0x037fcf18`,
while the upper-store function moves to `0x037fcf04`. The tests read those real
map rows and ELF function positions. The rejection checks identity and
placement, rather than treating equal size as evidence of correct roles.

A separate malformed copy moves the positive ELF's first load file offset by
four. Actual segment/section payload correspondence rejects it. Positive
source, tools, input objects, and native artifacts remain unchanged.

## Public replay, tests, and evidence closure

Run from the repository root with a nonexistent private directory:

```bash
PYTHONDONTWRITEBYTECODE=1 python3 decomp/matching-notes/other-cpus/arm7-arena-cluster-proof/reproduce.py NEW_PRIVATE_DIRECTORY
PYTHONDONTWRITEBYTECODE=1 python3 -m unittest discover -s decomp/matching-notes/other-cpus/arm7-arena-cluster-proof -p 'test_*.py' -v
```

The replay prints and returns `NEW_PRIVATE_DIRECTORY/trial-proof.json` only
after all checks pass. Failed runs retain private diagnostics without a
completed receipt. Only original ROM and pinned tools are external inputs.
No earlier private object, report, checkout import, donor source, or ignored
cache is required. The capsule owns all source/recipe/layout/manifest/helper
inputs. Objects, ELF files, maps, extracted parts, and generated opaque assembly
remain private.

Four tests failed before implementation, then passed against real object hashes,
per-role compiler argv, numeric map rows, actual function bytes, full image
payloads, shared binding, all omissions, successful store-swap ELF, and malformed
load correspondence.
[Tests](arm7-arena-cluster-proof/test_cluster.py),
[red log](arm7-arena-cluster-proof/tdd-red.log),
[green log](arm7-arena-cluster-proof/tdd-green.log),
[fresh public replay log](arm7-arena-cluster-proof/public-replay.log),
[test log](arm7-arena-cluster-proof/public-tests.log).

The receipt keys are `candidates`, `originals`, and `programs`. Each program has
`positive`, `wrong_shared_wram`, four role entries under `omitted`,
`swapped_stores`, and `malformed_load`. The positive/shared readbacks retain
actual input pins, map rows, individual functions/bytes, every observed binding,
segment facts, and full image hashes. After committing, run:

```bash
python3 decomp/matching-notes/verify-evidence-pins.py decomp/matching-notes/other-cpus/arm7-arena-cluster-proof/evidence-pins.json
```

Original signature and linker/source ownership remain the source integration
boundary. Simultaneous exact bytes grant no execution, branch-feasibility,
original SDK/compiler identity, or source-origin promotion. Unknown BX transfers
remain unchanged.
