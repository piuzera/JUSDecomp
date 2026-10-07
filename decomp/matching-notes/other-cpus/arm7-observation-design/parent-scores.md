# Parent scoring after reading both complete candidates

Scores use the five criteria in RUBRIC.md, each 0..3.

| Criterion | Shared Function | Bounded observer |
|---|---:|---:|
| Checked identity and fixed ISA | 3 | 3 |
| Strict initialized span and observation honesty | 2 | 3 |
| Destination authority and unknown mode | 2 | 3 |
| Stored/output policy and ARM9 preservation | 2 | 3 |
| Small coherent interface and falsifying cases | 1 | 2 |
| Total | 10 | 14 |

Shared Function has the best eventual unified policy ownership, but requires
migrating constructors, helper flags, Module/Program scope, cursors, assembly and
signature consumers together. It also exposes decoder transport types in its
cursor result. None of those migrations is necessary to observe the grounded
ARM7 spans. Its complete candidate/function output requires more proof than
this first increment can establish.

Bounded observer keeps the longest operation within three files, formats under
fixed V4T once, and has concrete checks for direct branches above ARM9's range,
full identity and complete Thumb BL. Context must retain an explicit distinction
between mapping and execution authority. Optional arbitrary exchange facts
are the largest unneeded caller burden. Prefer deferring them until actual
execution evidence needs them. BX remains unresolved; target mode for direct
B/BL remains known from the selected mode. Executable declaration support can
also wait if no real caller yet possesses such evidence, but must not be
replaced with an implicit executable classification.

Cross-judge is still evaluating; no implementation was started from these
scores. Concrete bytes and predicted results are design fixtures, not passed
runtime evidence.
