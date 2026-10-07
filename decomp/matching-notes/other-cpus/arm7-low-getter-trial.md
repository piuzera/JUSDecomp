# Bounded ARM7 low-getter C trial

The single fixed C candidate does not match the complete low-getter cluster.
Pinned MWCC ARM7 `-O4,p` produces 80 instruction bytes and an eight-byte
literal pool, but reverses the first two ID-8 instructions. Eight instruction
bytes differ in both original program identities. The pool has two real
`R_ARM_ABS32` relocations whose proposed bindings explain both original literal
words. That pool correspondence cannot repair the instruction mismatch.

The experiment stops at this rejection. No native LLD trial, opaque prefix/suffix
replacement, or full-image native-link reconstruction is attempted. There is one
source candidate and one compiler recipe. No instruction patch, forced register,
assembly, flag search, or candidate rewrite follows the mismatch.

This is research evidence with zero source credit. Canonical 304 bytes stay
unchanged, ARM7 source stays zero, and T10 remains open. The original name, entry,
ABI, return type, C types, function extent, SDK version, and ownership remain
unproved. Final acceptance of this dependent trial requires independent acceptance
of the [getter grounding](arm7-arena-getter-cases.md).

## Frozen source and actual compiler input

[low_getter_trial.c](arm7-low-getter-trial-proof/low_getter_trial.c) uses an
unsigned-ID switch for cases 1, 7, and 8, a pointer return, and two hypothesis-named
external byte objects. It takes their addresses without reading their values.
The ID-7/8 clamp and raise compare unsigned words, avoiding C relational
comparisons between unrelated pointers. These source declarations are explicit
hypotheses, not recovered original declarations.

The source SHA256 is
`fe3711c03cb2f0e0ee50a0751604766984e4a285a369290f6f159b87019bd537`.
The basename is `low_getter_trial.c`. The only recipe is
`-proc arm7tdmi -nothumb -interworking -nostdinc -O4,p -c`.
The public [trial proof](arm7-low-getter-trial-proof/trial-proof.json) records the
actual successful argv, source, MWCC/Wibo/DLL/LLVM pins, object metadata, all
readback commands, and log hashes. MWCC and Wibo keep the accepted hashes
`7150fa4fe4cb6db6867ac530ec1a0754f6ca4df92868d963a7875196f9222880`
and `2b3000ef6a7a490c24ccd71967735ae0005e218922e51806cca1b8d77fd3cf7c`.
Compiler stdout and stderr are empty; return code is zero.

## Original window and exact mismatch

The independently read instruction window is `[0x037fcf2c,0x037fcf7c)`, followed
by separate four-byte data reads `[0x037fcf7c,0x037fcf80)` and
`[0x037fcf80,0x037fcf84)`. The public
[original manifest](arm7-low-getter-trial-proof/original-manifest.json) contains
only the five frozen low-getter instruction selections and those two literal
words. It does not select the high getter or later initializer pairs.

The independent reader resolves the original FNT/FAT 79 child, verifies both
program digests and NDS ARM7 headers, and checks the loader table and both
autoload payload hashes. The original 80 instruction bytes have SHA256
`4439515ba3e13f1224622048ec17be7c238aaba35b5ec4d254209e7fb7df7564`;
the compiled 80 instruction bytes have SHA256
`f1f2ccb1f4b1619bfb76de3f91eec76cff45a2ad8a75244decf47f844ce325b1`.
The complete 88-byte original candidate window has SHA256
`3e92f8f0b8ebb25e84dbe31ad77910309085d7d1def7e4a5821cbf196f62b9c2` in each exact program. The parent and child identities remain separate.

| Relative offset | Original address/word | Compiled word at candidate placement |
| ---: | --- | --- |
| 52 | `0x037fcf60: 0xe3a0050e`, `mov r0,#0x03800000` | `0xe59f1018`, `ldr r1,[pc,#24]` |
| 56 | `0x037fcf64: 0xe59f1014`, `ldr r1,[pc,#20]` | `0xe3a0050e`, `mov r0,#0x03800000` |

Every byte at relative offsets 52 through 59 differs; all other instruction
bytes match. Both load encodings still address candidate pool slot `0x037fcf80`
under their respective PC positions. Native LLVM independently decodes the
original and compiled instructions; neither pool is passed to the disassembler.
[Original readback](arm7-low-getter-trial-proof/original-read.json),
[original LLVM](arm7-low-getter-trial-proof/llvm-original-low-getter.txt),
[compiled LLVM](arm7-low-getter-trial-proof/compiled-llvm.txt).

## Actual object and diagnostic relocation explanation

The actual object SHA256 is
`a679cbf055b8b78aeddc71612748da0a1244a3b9b2b3a316655ab3385d9e5c20`.
LLVM reads ELF32 little-endian ARM, relocatable type 1, machine 40, flags
`0x02100000`. The 88-byte `.text` has flags 6 and alignment 4. The global FUNC
symbol `arm7_low_getter_trial` starts at section offset zero and has size 88,
including the pool. The actual local markers are `$a` at zero and `$d` at 80,
both recorded by this MW object with symbol type 2. The proof records those
producer fields without claiming modern ABI compliance.
[LLVM ELF readback](arm7-low-getter-trial-proof/elf-readback.txt).

The two `.rela.text` entries each have zero addend:

| Pool offset | Actual relocation | Undefined hypothesis symbol | Proposed binding |
| ---: | --- | --- | --- |
| `0x50` | `R_ARM_ABS32`, code 2 | `hyp_subpriv_arena_lo` | `0x027f9c08` |
| `0x54` | `R_ARM_ABS32`, code 2 | `hyp_wram_arena_lo` | `0x0380bc90` |

The unlinked words are zero. For these data-symbol hypotheses, the verifier's
in-memory `S+A` explanation gives the two separately grounded original words.
Arm's relocation definition describes code 2 as an absolute data relocation
with expression `(S+A)|T`; no Thumb-function bit is hypothesized here.
[Arm ELF specification, 2025Q1](https://github.com/ARM-software/abi-aa/blob/2025Q1/aaelf32/aaelf32.rst#5612-relocation-types).
This is a diagnostic explanation of actual records. It does not modify the
object or prove native LLD accepts this MW relocation contract.

For the negative check, binding `hyp_subpriv_arena_lo` to Pokémon's
`0x027fafcc` changes pool bytes at relative offsets 80 and 81. The verifier
rejects it with `literal pool mismatch after actual ABS32 relocation explanation`.
The other binding remains `0x0380bc90`. This tests correspondence to the original
literal data; it is not a native-link negative trial.

## Public replay and test evidence

Run `python3 arm7-low-getter-trial-proof/reproduce.py NEW_PRIVATE_DIRECTORY`
from this note's directory. The directory must not already exist. The script
reads its own committed C source and original manifest, checks the recorded
read-only external ROM/layout/tool pins, compiles the one recipe, independently
reads both original programs, inspects the real ELF, invokes LLVM, and records
the mismatch and wrong-binding rejection. It deliberately has no LLD invocation.
Objects remain private and are not needed as input on a fresh checkout.

After public replay, run the tests from the repository root, pointing
`TRIAL_OBJECT` at the object that replay generated:

```sh
TRIAL_OBJECT=NEW_PRIVATE_DIRECTORY/compiled.o python3 -m unittest discover -s decomp/matching-notes/other-cpus/arm7-low-getter-trial-proof -p 'test_*.py' -v
```

Replace `NEW_PRIVATE_DIRECTORY` with the same absolute output path used for
replay. The parser/pool tests require this explicit actual-object input.

The parser/pool tests failed before implementation, then all three passed using
the actual MW object. A separate replay test failed before its implementation,
then passed with a fresh real compile and the expected stop-before-link verdict.
The four tests also pass from the public package. Historical red/green logs and
[provenance](arm7-low-getter-trial-proof/provenance.json) retain the test sequence.
The proof scripts use no hidden private report, source, or manifest dependency.
No ROM, object, extracted payload, SDK source copy, linked ELF, or production
approval capsule is committed.

## One possible later experiment

The eight-byte difference justifies one later materialization-order hypothesis:
reverse only ID-8's unsigned comparison from
`(unsigned int)&hyp_wram_arena_lo > low` to
`low < (unsigned int)&hyp_wram_arena_lo`, keeping all other source and recipe
bytes fixed. This would test whether MW's operand handling explains the order.
It is not run here, and no exact-match prediction follows.

The pinned donor supports the unsigned raise formula, not that reversal. Its
operand direction agrees with this failed candidate, and its link symbols are
external function designators rather than this candidate's external byte
objects. That declaration difference also remains untested and must not be
mixed into the proposed one-change experiment.
[Pinned donor getter source](https://github.com/pret/pokediamond/blob/38f3650189f8989aed91618745aa74029fa60247/arm7/lib/src/OS_arena.c).
Even a later exact compile/link would leave original declarations, entry/extent,
ABI, SDK version, link ownership, and source-credit approval unresolved.
