# ARM7 low-getter operand-order trial

Reversing the ID-8 unsigned comparison produces exactly the same full MW object
as the [accepted rejection trial](arm7-low-getter-trial.md). Its eight differing
instruction bytes remain at relative offsets 52 through 59. The operand flip
did not change code generation under the frozen compiler and recipe. This
materialization-order hypothesis is settled by the actual object equality.

The experiment stops at that unchanged mismatch. Native LLD is not attempted,
and there is no opaque prefix/suffix replacement, native wrong-binding trial,
or full-image reconstruction. No declaration, type, flag, or additional candidate
change occurs. ARM7 source credit stays zero, canonical 304 stays unchanged,
and T10 remains open. Original names, entry/extent, ABI, SDK version, C types,
link contracts, and ownership remain unproved.

## Exactly one source change

The accepted source expression is
`(unsigned int)&hyp_wram_arena_lo > low`; this trial uses
`low < (unsigned int)&hyp_wram_arena_lo`. The replacement begins at source byte
444. Replacing it back restores every accepted C byte, including declarations,
whitespace, the other case bodies, and the function name. The source basename
remains `low_getter_trial.c` and the function remains `arm7_low_getter_trial`.

The public package includes its own
[accepted previous source](arm7-low-getter-order-proof/accepted_previous_source.c),
[current source](arm7-low-getter-order-proof/low_getter_trial.c),
[source-difference record](arm7-low-getter-order-proof/source-diff.json), and
[accepted recipe metadata](arm7-low-getter-order-proof/accepted-recipe.json).
The accepted source SHA256 is
`fe3711c03cb2f0e0ee50a0751604766984e4a285a369290f6f159b87019bd537`;
the current source SHA256 is
`92aef5bc8ce408b4d1b19a95e8191b4668a82f335cbcb19302c52faf0668e0bb`.

Only the established flags run:
`-proc arm7tdmi -nothumb -interworking -nostdinc -O4,p -c`.
The actual compiler argv and accepted MWCC/Wibo/DLL/LLVM pins appear in
[trial-proof.json](arm7-low-getter-order-proof/trial-proof.json). MWCC returns zero
with empty stdout/stderr. Replays reproduce this same frozen candidate; they do
not select another source or recipe.

## Unchanged object, instructions, and pool

The actual object SHA256 remains
`a679cbf055b8b78aeddc71612748da0a1244a3b9b2b3a316655ab3385d9e5c20`.
This is equality of the complete object, not just its instruction section.
It retains ELF32 little-endian ARM, relocatable type 1, machine 40, flags
`0x02100000`, and 88-byte `.text` with flags 6 and alignment 4. Its global FUNC
symbol has section offset zero and size 88; actual local markers `$a` at zero
and `$d` at 80 keep the instruction/pool split. The two real `.rela.text`
entries remain `R_ARM_ABS32`, code 2, at offsets `0x50` and `0x54`, with zero
addends and undefined `hyp_subpriv_arena_lo` and `hyp_wram_arena_lo` symbols.
[Actual LLVM ELF readback](arm7-low-getter-order-proof/elf-readback.txt).

The comparison remains fixed to instruction bytes `[0x037fcf2c,0x037fcf7c)`
and two separate four-byte literal reads at `0x037fcf7c` and `0x037fcf80`.
The independent reader checks the original FNT/FAT 79 child and both full program
identities, NDS ARM7 headers, image hashes, loader table, and autoload payload
hashes. Its own [original manifest](arm7-low-getter-order-proof/original-manifest.json)
contains only the five low-getter instruction windows and those two literal
words. No high getter, later initializer pair, or literal-pool instruction is
selected. [Original readback](arm7-low-getter-order-proof/original-read.json).

| Relative offset | Original instruction | Compiled instruction at candidate placement |
| ---: | --- | --- |
| 52 | `0x037fcf60: 0xe3a0050e`, `mov r0,#0x03800000` | `0xe59f1018`, `ldr r1,[pc,#24]` |
| 56 | `0x037fcf64: 0xe59f1014`, `ldr r1,[pc,#20]` | `0xe3a0050e`, `mov r0,#0x03800000` |

All eight bytes at those offsets differ in each original program, and every
other instruction byte agrees. The original 80 instruction bytes retain SHA256
`4439515ba3e13f1224622048ec17be7c238aaba35b5ec4d254209e7fb7df7564`;
the compiled 80 instruction bytes retain SHA256
`f1f2ccb1f4b1619bfb76de3f91eec76cff45a2ad8a75244decf47f844ce325b1`.
Native LLVM decodes only instruction words:
[original output](arm7-low-getter-order-proof/llvm-original-low-getter.txt),
[compiled output](arm7-low-getter-order-proof/compiled-llvm.txt).

The copied accepted verifier's diagnostic `S+A` explanation of the actual pool
relocations still produces original words `0x027f9c08` and `0x0380bc90` under
the two proposed bindings. Binding the first symbol to Pokémon's `0x027fafcc`
changes pool bytes 80 and 81 and fails the original-pool check. This retained
negative is diagnostic only. It does not test native linker acceptance, modify
the object, or resolve the instruction mismatch.

## Public replay and verification

From the repository root, run:

```sh
python3 decomp/matching-notes/other-cpus/arm7-low-getter-order-proof/reproduce.py NEW_PRIVATE_DIRECTORY
TRIAL_OBJECT=NEW_PRIVATE_DIRECTORY/compiled.o python3 -m unittest discover -s decomp/matching-notes/other-cpus/arm7-low-getter-order-proof -p 'test_*.py' -v
```

Use the same absolute output path in both commands; it must not exist before
replay. The parser/pool tests consume that actual compiled object. The replay
checks its own accepted/current C bytes and recipe metadata, reads its own
original manifest, and uses the recorded read-only external ROM/layout/tools.
No private prior object, proof, source, or manifest is needed. The copied accepted
readers/parser/tests/manifest remain byte-identical to the previous public trial.
The [provenance record](arm7-low-getter-order-proof/provenance.json) pins them.
No existing proof or approval capsule changes.

The new replay test failed before implementation, then passed using a fresh real
compile. The public replay and all four discovery tests pass, preserving the
same object hash and stop-before-link verdict. Historical red/green logs retain
the new test's sequence. Objects and ROM binaries stay private; no extracted
payload, linked ELF, SDK source copy, or fabricated relocation record is committed.

## One remaining concrete source difference

A separately authorized declaration-kind experiment is justified by the pinned
public donor, which declares `SDK_WRAM_ARENA_LO` as an external function and uses
its address-like value in both the ID-7 and ID-8 unsigned comparisons. These
candidates declare the corresponding hypothesis symbol as an external byte
object. The donor's greater-than operand direction agrees with the previous
failed candidate; it never justified the reversed source order.
[Pinned donor source](https://github.com/pret/pokediamond/blob/38f3650189f8989aed91618745aa74029fa60247/arm7/lib/src/OS_arena.c).

One isolated proposal would change only
`extern unsigned char hyp_wram_arena_lo;` to
`extern void hyp_wram_arena_lo(void);`, preserving the current body, the other
external declaration, filename, and exact flags. That tests a concrete MW source
operand-kind difference without predicting a match or asserting an original JUS
type. The donor's ID-1 low value is hardcoded, so this evidence does not justify
changing `hyp_subpriv_arena_lo` as well. No declaration experiment runs here.
Even an eventual exact compile and native link would leave original ownership,
entry/extent, ABI, SDK version, and source-credit approval unresolved.
