# Bounded ARM7 observation design

## Problem and caller usage

The physical adapter proves initialized ownership and complete V4T decoding,
but callers still need safe control-transfer and destination observations.
ARM9 Function/Module discovery cannot receive checked ARM7 inputs without a
large metadata and parser migration. The grounded eight-byte spans do not
establish functions. A separate bounded observation operation is the base.

```rust
let modules: Vec<_> = checked_view.module_inputs().collect();
let report = observe(
    &modules[0],
    Selection { span: 0x02380000..0x02380008, mode: InstructionMode::Arm },
    &modules,
)?;
// Inspect or serialize the immutable instruction/transfer observations.
```

Autoload0 uses source modules[1] and the grounded ARM span
037f8468..037f8470. A child view supplies its own module list. Mixing child
and parent contexts must fail even when bytes and addresses match.

## Shape and invariants

One new lib/src/analysis/arm7_observation.rs owns observe, Selection,
SpanObservation, instruction/transfer records, destination mapping and errors.
One export in analysis/mod.rs exposes it. Existing arm7_modules::decode_span
remains complete fixed-V4T intake. Public results expose no mutable decoder,
raw unarm instructions or caller-selected ISA. Identity borrows the checked
source and context; private result fields prevent policy mutation. Formatting
and serialization use stored observations and fixed policy, without reparsing.

observe checks every context module belongs to the exact same program and
ARM7 CPU, requires source membership, and rejects duplicate/overlapping physical
ownership. It decodes all selected initialized bytes before returning anything.
It indexes complete instruction boundaries and classifies numeric destinations
as initialized, BSS or unresolved bytes within that same program.

Direct B/BL preserve source mode and share one destination classifier. Branch
conditions, untaken fallthrough and conditional call-return continuation remain
distinct observations. Ordinary fallthrough includes the span end; it is not a
function-end claim. Numeric target arithmetic must apply the architectural pipeline bias exactly
once. Tests exposed unarm1.9.2 ARM BranchDest sign-extending an already shifted
displacement to24 rather than26 bits. The observer derives direct ARM B/BL
from signed raw imm24 shifted two plusPC8. All direct Thumb forms now derive
targets from validated raw fields; combined BL recovers its checked prefix
and addsPC4 after signed-payload extension. This local interpretation fix changes no dependency or ARM9 path. Branches inside a
combined Thumb BL must be classified as instruction interiors.

BX and other PC writes remain unresolved, without fabricated register values,
target modes or reachability. Detect PC writes using explicit V4T defs, handle
exception/state-restoring cases conservatively, and avoid claiming ordinary
unconditional fallthrough after unknown unconditional control transfer.
All source and destination executability remains unknown in this increment.
Do not equate checked initialized mapping with executable status.

## Synthesis decision

Parent scores A10/B14; independent gpt-6-sol judge scores A12/B15. Both choose
B for the bounded first increment. B hides branch arithmetic, full identity,
byte boundaries and target classification in one operation with a three-file
maximum caller path. A would migrate Function construction, Module/Program,
helper flags, cursors, assembly and signatures before these observations can
work. A's explicit immutable reporting policy and hard-span/V5-only/Thumb BL
regression obligations are retained as invariants in B, not copied as new layers.

The judge also found A requires mode on executable declarations, so cannot
represent independently known execution with unknown mode as precisely as B.
This does not block observations where no executable declarations exist.

Deferred from B: CodeDeclaration and ExchangeFact inputs. There is currently
no evidence-bearing caller for them, and arbitrary register-value declarations
are unnecessary to report honest unresolved BX. Deferred from A: Function,
FunctionCursor, Arm9Scope, Config/symbol migration and inferred candidate
termination. There were two completed candidates and no dropouts.

## Tradeoffs and next implementation

We accept separate bounded observations while ARM9 discovery remains V5TE.
We accept unresolved indirect targets and unknown executability until evidence
supports stronger statements. We do not infer header entry, function extents,
sections, symbols, relocations, ARM7 linkage or source credit.

Implement with tests failing on missing observation behavior, then minimal
code. Public fixtures must enter through Arm7Layout::checked. Cover V5-only
rejection, real ARM7 address-range regression, full identity, initialized/BSS/
unmapped targets, conditional/call continuations, PC writes, complete Thumb BL
and instruction-interior targets. Run existing library tests and clippy
sequentially, build and run an actual probe over both real checked programs,
and preserve the existing ARM9 verifier compatibility path. Native tool hashes,
source patch and public observation metadata are the review artifacts.

ARM BX alignment was checked against ARM DDI0100I A4-20/A7-33 before retaining
unknown exchange targets. No fabricated register values or hardware execution
claim is introduced. Primary manual:
https://e2e.ti.com/cfs-file/__key/communityserver-discussions-components-files/1023/ARM-Architecture.pdf

## Concrete implementation deviation

The initial compiled stub failed all nine behavior tests. The first implementation
passed eight but misreported B to037f8468 as027f8468. Exact locked dependency
arm/generated.rs6695 computes the signed field after shift using <<8>>8,
truncating the26-bit scaled offset. Parent accepted local direct ARM B/BL
normalization inside the observer, which owns target interpretation. The nine
behavior tests then passed. Extreme positive/negative raw imm24 and formatted
operand regressions remain required. This is one source-grounded correction,
not recurring architecture friction or a reason to change the chosen boundary.

A second boundary test refuted combined Thumb BL arithmetic: f3ff/fffe
must yield source+00400000 but the locked decoder yielded source-00400000
by addingPC4 before signed23 extension. Short and conditional Thumb B tests
passed before normalization and are not confirmed dependency defects. The
observer now derives every direct ARM/Thumb branch target from validated
raw fields, formats the corrected operand once and preserves uncertain
mapping/modes. Fourteen observer tests passed after this change.

Both concrete defects are absorbed inside the existing branch interpretation
owner with no new parameters, types or ownership workaround. They generalize
one invalid dependency assumption; they do not expose repeated architectural
friction requiring a new design. The shared dependency/legacy repair remains
follow-up jus-bjry.16. Independent native LLVM23.1.2 assembly, linkage and
disassembly confirmed four ARM and three Thumb target encodings in the public
llvm-branch-oracle artifacts. Actual library/probe/compatibility acceptance
still requires the final independent rebuild and review.
