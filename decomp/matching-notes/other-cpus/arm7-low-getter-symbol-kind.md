# ARM7 low-getter WRAM symbol-declaration trial

Changing only the WRAM hypothesis symbol from an external byte object to an
external void function produces the same complete MW object as the
[accepted original C trial](arm7-low-getter-trial.md). The eight instruction
bytes that differ from both original programs remain unchanged. Even the
undefined WRAM ELF symbol remains `NOTYPE`, not `FUNC`. This declaration-kind
change affects neither emitted instructions nor object metadata under the
frozen recipe.

The experiment stops at that mismatch. Native LLD, actual native wrong-binding
links, opaque-prefix/suffix replacement, and full-image reconstruction are not
attempted. No additional declaration, body, type, flag, or recipe change occurs.
ARM7 source credit stays zero, canonical 304 stays unchanged, and T10 remains
open. Original name, entry/extent, ABI, C types, SDK version, link contract, and
ownership remain unproved.

## Start from the original greater-than source

This trial starts from jus-bjry.23 source SHA256
`fe3711c03cb2f0e0ee50a0751604766984e4a285a369290f6f159b87019bd537`.
It changes only `extern unsigned char hyp_wram_arena_lo;` to
`extern void hyp_wram_arena_lo(void);`. Inverse replacement restores every
original C byte, including the greater-than expression
`(unsigned int)&hyp_wram_arena_lo > low`, the other declaration, whitespace,
function name, and all case bodies. It does not start from the
[operand-flipped trial](arm7-low-getter-order.md).

The source basename remains `low_getter_trial.c` and the function remains
`arm7_low_getter_trial`. The current source SHA256 is
`3f7b22c42f4b98cfed84308f2e5b658ae9cecdb8a17d900421e71ed70c496495`.
The public package owns its
[original source](arm7-low-getter-symbol-kind-proof/accepted_original_source.c),
[current source](arm7-low-getter-symbol-kind-proof/low_getter_trial.c),
[single-line difference](arm7-low-getter-symbol-kind-proof/source-diff.json), and
[accepted recipe](arm7-low-getter-symbol-kind-proof/accepted-recipe.json).
There is one current candidate and one recipe. Fresh replays reproduce that
same frozen candidate.

The pinned community donor declares its WRAM linker symbol as an external
function and converts its address-like designator to unsigned words. That
established a concrete declaration difference to test. It did not identify an
original JUS type, symbol, SDK version, or source owner. This trial retains the
hypothetical name and address-taking body; it introduces no function call.
The donor hardcodes its ID-1 low value, so the other external byte declaration
remains unchanged.
[Pinned donor source](https://github.com/pret/pokediamond/blob/38f3650189f8989aed91618745aa74029fa60247/arm7/lib/src/OS_arena.c).

## Actual object and unchanged discrepancy

The only flags remain
`-proc arm7tdmi -nothumb -interworking -nostdinc -O4,p -c`.
MWCC returns zero with empty stdout/stderr. Actual argv and the accepted
MWCC/Wibo/DLL/LLVM pins appear in
[trial-proof.json](arm7-low-getter-symbol-kind-proof/trial-proof.json).
The complete object SHA256 remains
`a679cbf055b8b78aeddc71612748da0a1244a3b9b2b3a316655ab3385d9e5c20`,
the same as the original and operand-flipped trials.

The object remains ELF32 little-endian ARM, relocatable type 1, machine 40,
flags `0x02100000`. Its 88-byte `.text` retains flags 6 and alignment 4; the
trial FUNC symbol starts at zero with size 88. Actual markers `$a` at zero and
`$d` at 80 separate 80 instruction bytes from eight pool bytes. The WRAM symbol
still has type 0/`NOTYPE`, global binding 1, undefined section 0, value zero,
size zero, and `other` zero. The declaration change creates no ELF symbol-kind
change in this actual object.
[LLVM ELF readback](arm7-low-getter-symbol-kind-proof/elf-readback.txt).

The independent reader checks the original FNT/FAT 79 child, both full program
digests, NDS ARM7 headers, image hashes, loader table, and autoload payload
hashes. It reads only the five frozen low-getter instruction windows covering
`[0x037fcf2c,0x037fcf7c)` and two separate four-byte literal words at
`0x037fcf7c` and `0x037fcf80`. No high getter, later initializer pair, or pool
instruction is selected.
[Original manifest](arm7-low-getter-symbol-kind-proof/original-manifest.json),
[original readback](arm7-low-getter-symbol-kind-proof/original-read.json).

| Relative offset | Original word/instruction | Compiled word/instruction at candidate placement |
| ---: | --- | --- |
| 52 | `0xe3a0050e`, `mov r0,#0x03800000` at `0x037fcf60` | `0xe59f1018`, `ldr r1,[pc,#24]` |
| 56 | `0xe59f1014`, `ldr r1,[pc,#20]` at `0x037fcf64` | `0xe3a0050e`, `mov r0,#0x03800000` |

All eight instruction bytes at offsets 52 through 59 differ in both exact
program identities; every other instruction byte agrees. Original and compiled
instruction SHA256 values remain
`4439515ba3e13f1224622048ec17be7c238aaba35b5ec4d254209e7fb7df7564`
and `f1f2ccb1f4b1619bfb76de3f91eec76cff45a2ad8a75244decf47f844ce325b1`.
Native LLVM decodes only the instruction words:
[original output](arm7-low-getter-symbol-kind-proof/llvm-original-low-getter.txt),
[compiled output](arm7-low-getter-symbol-kind-proof/compiled-llvm.txt).

The two actual `.rela.text` entries remain zero-addend `R_ARM_ABS32` records
at offsets `0x50` and `0x54`, for the undefined `hyp_subpriv_arena_lo` and
`hyp_wram_arena_lo` symbols. Diagnostic in-memory `S+A` explanation under
bindings `0x027f9c08` and `0x0380bc90` still matches both original pool words.
The retained wrong-binding check uses `0x027fafcc` for the first symbol and
rejects the resulting pool bytes 80/81. It is a diagnostic pool comparison,
not native linker handling. The object file stays unchanged; no relocation
records are fabricated.

## Public replay and Git-owned evidence

From the repository root, run:

```sh
python3 decomp/matching-notes/other-cpus/arm7-low-getter-symbol-kind-proof/reproduce.py NEW_PRIVATE_DIRECTORY
TRIAL_OBJECT=NEW_PRIVATE_DIRECTORY/compiled.o python3 -m unittest discover -s decomp/matching-notes/other-cpus/arm7-low-getter-symbol-kind-proof -p 'test_*.py' -v
```

Use the same absolute output path; it must not exist before replay. The parser
tests consume that actual object. Replay reads its own original/current C,
recipe metadata, and original-word manifest with recorded read-only external
ROM/layout/tool paths. No prior private object, report, source, or manifest is
needed. The copied original-trial reader, parser, parser tests, and original
manifest remain byte-identical; [provenance](arm7-low-getter-symbol-kind-proof/provenance.json)
pins those copies. All earlier capsules remain unchanged.

The new replay test failed before implementation, then passed with a fresh real
compile. Public replay and all four discovery tests pass. Objects, ROM data,
extracted payloads, and linked ELFs stay private. This package changes no native
link behavior.

The [public artifact manifest](arm7-low-getter-symbol-kind-proof/public-artifact-pins.json)
uses an explicit file inventory. Its `artifact_sha256` entries name only public
files owned by Git, excluding ignored caches, external tools/ROM, and rebuilt
private objects. Tool/ROM input hashes and the private object's scientific
identity remain recorded separately in the trial proof. The artifact manifest
omits its own recursive hash. After committing the package, run:

```sh
python3 decomp/matching-notes/verify-evidence-pins.py decomp/matching-notes/other-cpus/arm7-low-getter-symbol-kind-proof/public-artifact-pins.json
```

The gate verifies every listed hash against both `HEAD` blobs and working files.
Both the operand reversal and WRAM declaration-kind hypotheses are now settled
for this compiler/recipe. The instruction-order mismatch remains unexplained.
Further candidate or toolchain changes need new bounded source/build provenance;
this result supplies no original ABI, SDK-version, or ownership promotion.
