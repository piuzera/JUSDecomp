# Bounded ARM7 high-getter C and native relocation trial

The single frozen high-getter C hypothesis produces all 108 selected original
ARM instruction bytes under the accepted local build-82 `-O4,s` recipe. The
actual 128-byte `.text` contains five pool words, three of them backed by real
zero-addend `R_ARM_ABS32` records. Native LLD resolves those records and
reconstructs both complete original ARM7 images exactly. No original source,
symbol name, type, ABI, function extent, compiler version, or SDK ownership is
established. ARM7 source credit remains zero, canonical 304 is unchanged, and
T10 remains open.

## Model frozen before compilation

The writer sent the plain C model and its hash for the root and independent
scope checks before compiling. The source then remained byte-for-byte fixed:
[high_getter_trial.c](arm7-high-getter-trial-proof/high_getter_trial.c), SHA256
`342ace7943b49cb8a8fc7e47497ce0ea2a33c88948b877333875744528f0cd0e`.
[Model rationale](arm7-high-getter-trial-proof/model.md) records its target
arithmetic assumptions. It uses the hypothetical function
`void *arm7_high_getter_trial(unsigned int id)` and three hypothetical external
byte-object addresses. No donor source was copied.

The accepted .21 instruction evidence supplies ID1's fixed `0x027ff000`, ID7's
fixed `0x03800000`, and ID8's formula. ID8 initializes an IRQ lower bound to
`0x0380ff80` minus the IRQ-size word, raises an unsigned WRAM lower bound above
`0x03800000`, then handles the signed system-size word. Zero returns that lower
bound; negative subtracts the system word from the lower bound; positive
subtracts it from the IRQ lower bound. All subtraction uses unsigned ARM32 word
arithmetic. Pointer-address conversion to signed int is an explicit target
hypothesis; the model does not compare unrelated C pointers or dereference the
hypothetical symbols.

The pinned community reconstruction corroborates this case and formula shape.
It declares its linker symbols as functions, while this candidate keeps byte
objects as explicit hypotheses. This difference grants no original declaration
claim. [Pinned donor high getter](https://github.com/pret/pokediamond/blob/38f3650189f8989aed91618745aa74029fa60247/arm7/lib/src/OS_arena.c#L36-L69).
The recipe follows the two donor-grounded inputs accepted by .27 and successful
in .28: local compiler directory `1.2/sp2p3` and optimization `-O4,s`.
[SDK-object selector](https://github.com/pret/pokediamond/blob/38f3650189f8989aed91618745aa74029fa60247/arm7/Makefile#L160-L177),
[ARM7 flags](https://github.com/pret/pokediamond/blob/38f3650189f8989aed91618745aa74029fa60247/arm7/Makefile#L92-L94).
This remains a standalone header-free recipe, not a full donor build or original
JUS compiler identification.

The only experimental compile uses:

```text
/private/tmp/jus-track-a/tools/wibo/wibo-macos
/private/tmp/jus-track-a/tools/mwccarm/1.2/sp2p3/mwccarm.exe
-proc arm7tdmi -nothumb -interworking -nostdinc -O4,s -c
NEW_PRIVATE_DIRECTORY/high_getter_trial.c -o NEW_PRIVATE_DIRECTORY/compiled.o
```

The compiler is local version 2.0 build 82, SHA256
`a0db9f5dd49ceb619dbc64993660b39f96cca10821a698a9859824e2d4ae2a81`.
[Recipe and read-only external pins](arm7-high-getter-trial-proof/recipe.json),
[first actual compile receipt](arm7-high-getter-trial-proof/first-compile.json),
[copied pinned donor provenance](arm7-high-getter-trial-proof/donor-primary-audit.json).
There is one candidate and one recipe. Fresh verification replays reproduce
that same experiment; no later body, type, declaration, optimization, or flag
variation ran.

## Original windows and actual object

The package's reader independently resolves original FNT/FAT79 and both ARM7
headers, checks the full program/image identities and initialized/BSS mappings,
and rereads exactly the five accepted high instruction windows. They partition
`[0x037fcf84,0x037fcff0)` into 108 bytes, or 27 ARM instructions. Five separate
four-byte literal selections occupy `0x037fcff0`, `0x037fcff4`, `0x037fcff8`,
`0x037fcffc`, and `0x037fd000`. The total bounded candidate is 128 bytes ending
at `0x037fd004`. LLVM decodes only the instruction windows with
`armv4t-none-eabi`; the literals stay data.
[Original manifest](arm7-high-getter-trial-proof/original-manifest.json),
[actual original readback](arm7-high-getter-trial-proof/original-read.json),
[original LLVM output](arm7-high-getter-trial-proof/llvm-original-high-getter.txt).

The actual 840-byte object has SHA256
`b392c58eb43db4427e075bf7757181dfc6ea5a16eb6ffb5686292d2c29fc50f1`.
Its ELF is little-endian ARM32 with flags `0x02100000`. Its global FUNC and
`.text` sizes are 128 bytes, with `$a` at 0 and `$d` at 108. The parser reads
that actual data marker to separate code and pool; it does not impose a
precompile extent or relocation count. All 108 instruction bytes match both
original identities, SHA256
`85a5352a73e4cf800fe0ef88137d78afbdf6289d0dd369d839daa007c7c016ce`.
[Actual ELF readback](arm7-high-getter-trial-proof/elf-readback.txt),
[compiled LLVM output](arm7-high-getter-trial-proof/compiled-llvm.txt),
[trial receipt](arm7-high-getter-trial-proof/trial-proof.json).

| Relative pool offset | Original word | Actual unlinked object | Actual relocation |
| --- | --- | --- | --- |
| 108 | `0x027ff000` | `0x027ff000` | None, fixed constant |
| 112 | `0x00000400` | `0x00000000` | `R_ARM_ABS32 hyp_irq_stack_size`, addend 0 |
| 116 | `0x0380ff80` | `0x0380ff80` | None, fixed constant |
| 120 | `0x0380bc90` | `0x00000000` | `R_ARM_ABS32 hyp_wram_arena_lo`, addend 0 |
| 124 | `0x00000400` | `0x00000000` | `R_ARM_ABS32 hyp_system_stack_size`, addend 0 |

All three symbolic operands are undefined global NOTYPE symbols in the actual
`.rela.text` records. The two equal size words remain distinct hypothetical
symbols. All five literal values are outside the checked initialized/BSS
half-open mappings; `0x0380bc90` equals autoload0's exclusive BSS end. The proof
reads the initialized literal storage, not RAM at the pointed values.

## Actual native link and original images

The finite .28 helper is adapted only for this 128-byte selection and three
actual symbolic operands. It regenerates original opaque startup, table,
autoload1, and autoload0 prefix/suffix. Autoload0 splits into 20,356 prefix bytes,
128 candidate bytes, and 45,636 suffix bytes. The linker consumes the actual
MW `compiled.o(.text)` directly. Absolute hypothesis assignments resolve IRQ
size `0x400`, WRAM lower bound `0x0380bc90`, and system size `0x400`. No MW object
bytes, relocation records, or flags change; no incbin replaces the MW object.

Each positive native ELF has SHA256
`d90a255d1193d31f0c4b322250e2b4de85608dbf59b855975a25ad499332c059`.
Actual load-segment payloads reconstruct both complete 165,552-byte original
ARM7 images, SHA256
`0540bd6fba14f886c542b3bfa15b1c0391b23dd4eaa3688367e1813cbc021139`.
The proof checks all six segment/section pairs against original physical stored
addresses, runtime addresses, file/memory sizes, flags, alignment, and payload
bounds. Separate NOBITS reservations total 21,424 bytes. Every noncandidate
byte matches, and no linked relocation section remains. The linked 128-byte
candidate SHA256 is
`13b9cdc287f94094ed89582210e0c8d008ca9395b768c3f3fec183882af88fa4`.
[Finite native layout](arm7-high-getter-trial-proof/native-layout.json),
[actual native receipt](arm7-high-getter-trial-proof/native-proof.json).

Changing only the actual native IRQ binding to `0x800` changes only stored-image
byte 20901 in each program. Strict original comparison rejects these outputs.
A separate malformed copy moves the positive ELF's first load-segment file
offset by four; segment/section payload correspondence rejects it. The positive
objects and ELFs remain unchanged. These are literal and structural proof
controls, not execution or branch-feasibility tests.

## Public replay and checks

From the repository root, choose a nonexistent private output directory:

```bash
PYTHONDONTWRITEBYTECODE=1 python3 decomp/matching-notes/other-cpus/arm7-high-getter-trial-proof/reproduce.py NEW_PRIVATE_DIRECTORY
PYTHONDONTWRITEBYTECODE=1 TRIAL_OBJECT=NEW_PRIVATE_DIRECTORY/compiled.o python3 -m unittest discover -s decomp/matching-notes/other-cpus/arm7-high-getter-trial-proof -p 'test_*.py' -v
```

The package owns its C model, original windows, native layout, recipe, reader,
object parser, native helper, and provenance metadata. Only recorded read-only
ROM, checked layout, and tools are external replay inputs. No previous private
proof, object, donor checkout, or ignored cache is required. Historical receipt
paths describe actual outputs; they are not replay dependencies. Objects, ELFs,
maps, opaque image parts, and generated assembly remain private.

Test-first checks cover the high-only original windows and five literal words,
observed object code/pool marker and three relocations, wrong diagnostic binding,
actual native link with wrong-binding/malformed controls, and a fresh public
compile/native replay. All five tests pass. Red/green logs,
[fresh replay log](arm7-high-getter-trial-proof/public-replay.log), and
[test log](arm7-high-getter-trial-proof/public-tests.log) are included.
After committing the package, check Git ownership and exact public bytes:

```bash
python3 decomp/matching-notes/verify-evidence-pins.py decomp/matching-notes/other-cpus/arm7-high-getter-trial-proof/evidence-pins.json
```

This exact finite model does not identify the original getter or establish its
full ABI/extent. Original linker ownership and signatures remain the source
integration boundary. Unknown BX transfers, guard witnesses, and unresolved
runtime state stay as accepted by .21; no new decode selection or feasibility
claim follows. Independent actual compile/native replay and publication review
remain acceptance checks.
