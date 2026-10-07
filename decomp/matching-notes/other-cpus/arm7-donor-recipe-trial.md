# Donor-selected ARM7 low-getter recipe trial

The unchanged first C hypothesis compiles to all 80 selected original ARM
instruction bytes with the local build-82 compiler and `-O4,s`. Its actual object
has two zero-addend `R_ARM_ABS32` pool entries. Native LLD resolves those entries
and reconstructs both complete 165,552-byte ARM7 images exactly. This settles a
bounded compiler and relocation experiment. It establishes no original name,
type, ABI, function extent, SDK version, or source ownership. Source credit stays
zero, canonical 304 is unchanged, and T10 remains open.

## Frozen question and recipe

[The accepted build provenance](arm7-donor-build-provenance.md) records that
`pret/pokediamond` commit `38f3650189f8989aed91618745aa74029fa60247` selects
compiler directory `1.2/sp2p3` for ARM7 SDK objects and `-O4,s` for ARM7 C. Its
`ARM_FUNC` annotation selects ARM mode.
[Compiler override](https://github.com/pret/pokediamond/blob/38f3650189f8989aed91618745aa74029fa60247/arm7/Makefile#L160-L177),
[optimization flags](https://github.com/pret/pokediamond/blob/38f3650189f8989aed91618745aa74029fa60247/arm7/Makefile#L92-L94),
[mode annotation](https://github.com/pret/pokediamond/blob/38f3650189f8989aed91618745aa74029fa60247/include-mw/function_target.h#L4-L5).
This is a community reconstruction's build declaration. It does not identify
the original JUS toolchain or the donor's undistributed executable hash.

The experiment keeps every byte of the original .23
[C candidate](arm7-donor-recipe-trial-proof/low_getter_trial.c), SHA256
`fe3711c03cb2f0e0ee50a0751604766984e4a285a369290f6f159b87019bd537`.
It preserves basename `low_getter_trial.c`, function `arm7_low_getter_trial`,
external byte-object declarations, unsigned address comparison, and the original
greater-than expression. No source variant, assembly, register directive, byte
patch, or flag search ran. The single experimental recipe is:

```text
/private/tmp/jus-track-a/tools/wibo/wibo-macos
/private/tmp/jus-track-a/tools/mwccarm/1.2/sp2p3/mwccarm.exe
-proc arm7tdmi -nothumb -interworking -nostdinc -O4,s -c
NEW_PRIVATE_DIRECTORY/low_getter_trial.c -o NEW_PRIVATE_DIRECTORY/compiled.o
```

The selected executable reports version 2.0 build 82. Its SHA256 is
`a0db9f5dd49ceb619dbc64993660b39f96cca10821a698a9859824e2d4ae2a81`.
This changes the compiler and optimization together from .23's build 114 and
`-O4,p`. All other options remain identical. It is the established header-free
trial recipe with two donor-grounded inputs, rather than the full donor build.
The replay separately rebuilds the accepted .23 recipe only to provide the
actual wrong-object negative. [Recipe and external pins](arm7-donor-recipe-trial-proof/recipe.json)
record both roles, the runner, adjacent DLLs, ROM, layout, LLVM, clang, and LLD.
[Copied donor audit](arm7-donor-recipe-trial-proof/donor-primary-audit.json)
retains pinned source URLs and file identities without copying SDK source.

## Actual object and original readback

The package's original reader independently resolves the child by original FNT
and FAT79, reads both original ARM7 headers, checks their full identities and
checked autoload mappings, and reads the five previously frozen instruction
windows. Those windows partition `[0x037fcf2c,0x037fcf7c)` into 20 ARM words.
The two four-byte literals at `0x037fcf7c` and `0x037fcf80` remain data and are
never disassembled. LLVM decodes exactly the 80 instruction bytes with
`armv4t-none-eabi`. No new dispatch case, initializer, or graph selection is added.
[Original manifest](arm7-donor-recipe-trial-proof/original-manifest.json),
[actual read](arm7-donor-recipe-trial-proof/original-read.json),
[original LLVM output](arm7-donor-recipe-trial-proof/llvm-original-low-getter.txt).

| Actual object fact | Result |
| --- | --- |
| Object SHA256 | `9704c69afb0dcc0a31dd008c8e4f6ce8b6f91537133238b9ecfec7c6958f076b` |
| ELF | 32-bit little-endian ARM, flags `0x02100000` |
| `.text` / global FUNC size | 88 bytes |
| Mapping symbols | `$a` at 0, `$d` at 80 |
| Instruction bytes | 80, exact in both original identities |
| Instruction SHA256 | `4439515ba3e13f1224622048ec17be7c238aaba35b5ec4d254209e7fb7df7564` |
| Pool | 8 zero bytes before linking |
| Actual `.rela.text` entries | offset 80 → `hyp_subpriv_arena_lo`; offset 84 → `hyp_wram_arena_lo` |
| Both relocation records | `R_ARM_ABS32`, addend 0, undefined global NOTYPE symbols |

The actual scheduling now matches original `0x037fcf60`'s `mov r0,#0x03800000`
followed by `0x037fcf64`'s `ldr r1,[pc,#20]`. The accepted earlier object
`a679cbf055b8b78aeddc71612748da0a1244a3b9b2b3a316655ab3385d9e5c20`
orders these materializations differently and still differs at relative bytes
52 through 59. [Actual ELF readback](arm7-donor-recipe-trial-proof/elf-readback.txt),
[compiled LLVM output](arm7-donor-recipe-trial-proof/compiled-llvm.txt),
[trial receipt](arm7-donor-recipe-trial-proof/trial-proof.json).

## Native symbolic link and complete images

The new proof adapts the accepted .19 finite layout and ELF parser. It regenerates
opaque startup, autoload1, table, and autoload0 prefix/suffix from each original
image. Autoload0 splits into 20,268 opaque prefix bytes, exactly 88 candidate
bytes, and 45,764 opaque suffix bytes. Separate NOBITS sections reserve the
original 6,504 and 14,920 BSS bytes. The linker consumes the actual MW
`compiled.o(.text)` directly between prefix and suffix. It never substitutes
an incbin for that object, synthesizes relocations, changes ELF flags, or patches
its bytes.

Native LLD assigns hypothetical absolute symbols `hyp_subpriv_arena_lo =
0x027f9c08` and `hyp_wram_arena_lo = 0x0380bc90`, the two observed original
literal values. These are exclusive ends of the checked autoload1 and autoload0
BSS extents. Such bindings explain literal operands; they grant neither names
nor original symbol ownership. The proof pins candidate placement at
`0x037fcf2c` through `0x037fcf84` and checks all six load segments against the
checked original VMA, physical stored address, file size, memory size, flags,
alignment, and section payload. It also checks all noncandidate bytes, separate
21,424-byte BSS reservation, and absence of remaining relocation sections.

Both actual native ELFs have SHA256
`673459693cdd25df49c550f9b0db3ffa8d6d703cc9cdbc4d9f249b55d92a6696`.
Reading their actual load segments reconstructs both 165,552-byte images with
SHA256 `0540bd6fba14f886c542b3bfa15b1c0391b23dd4eaa3688367e1813cbc021139`.
The linked 88-byte candidate has SHA256
`3e92f8f0b8ebb25e84dbe31ad77910309085d7d1def7e4a5821cbf196f62b9c2`.
[Finite native layout](arm7-donor-recipe-trial-proof/native-layout.json),
[actual native receipt](arm7-donor-recipe-trial-proof/native-proof.json).

Three controls run against actual native outputs for each program:

- Bind the first symbol to donor-specific `0x027fafcc`. Only stored-image bytes
  20780 and 20781 change, and strict original comparison rejects the output.
- Link the rebuilt accepted .23 object with the correct bindings. Only
  stored-image bytes 20752 through 20759 change, and strict comparison rejects it.
- Increase the positive ELF's first `PT_LOAD` file offset by four. Segment and
  section payload correspondence rejects this malformed output.

No positive binary is modified. The malformed copy exists only in private
negative-test output. Original ROM, layout, source, tools, and input objects
remain unchanged.

## Replay and tests

Run from the repository root with a nonexistent private output directory:

```bash
PYTHONDONTWRITEBYTECODE=1 python3 decomp/matching-notes/other-cpus/arm7-donor-recipe-trial-proof/reproduce.py NEW_PRIVATE_DIRECTORY
PYTHONDONTWRITEBYTECODE=1 TRIAL_OBJECT=NEW_PRIVATE_DIRECTORY/compiled.o WRONG_OBJECT=NEW_PRIVATE_DIRECTORY/wrong-original.o python3 -m unittest discover -s decomp/matching-notes/other-cpus/arm7-donor-recipe-trial-proof -p 'test_*.py' -v
```

The replay reads source, original windows, layout recipe, and provenance from
its own committed package. Its only external inputs are the recorded read-only
original ROM, checked layout, and tools. It creates both actual objects and all
native outputs in the new private directory. No prior private proof, object,
SDK checkout, ignored cache, or donor source is a replay dependency. Public
reports record the writer's output paths as historical receipts, not input paths.

Three new native tests and a fresh public-replay test failed before their behavior
was implemented, then passed against actual objects and native links. Together
with the reused three object-parser tests, all seven tests pass. Red/green logs,
[fresh replay log](arm7-donor-recipe-trial-proof/public-replay.log), and
[test log](arm7-donor-recipe-trial-proof/public-tests.log) are included. Objects,
ELFs, maps, extracted image parts, and generated assembly stay private.
[Evidence manifest](arm7-donor-recipe-trial-proof/evidence-pins.json) lists only
Git-owned public artifacts. Run its gate after committing this package:

```bash
python3 decomp/matching-notes/verify-evidence-pins.py decomp/matching-notes/other-cpus/arm7-donor-recipe-trial-proof/evidence-pins.json
```

## Remaining boundary

The recipe comparison resolves the earlier eight-byte compiler scheduling
mismatch. The next proof must resolve original symbol/signature and linker
ownership before any source integration. This C function remains a named
hypothesis, and its compiled FUNC size is not evidence of original function
extent. Finite getter-case ownership and unknown BX transfers remain as in .21;
this experiment grants no path feasibility or runtime state claims. Independent
compile/native replay and publication review remain acceptance checks.
