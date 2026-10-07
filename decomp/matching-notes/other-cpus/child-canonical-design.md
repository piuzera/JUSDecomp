# Child ARM9 canonical design selection

Choose the local child-only helper at `8a1232e` over the combined-program owner
at `caaeb6f`. Parent and independent gpt-6-sol cross-judge both score 15/12
against five criteria: complete operation, immutable live authority, strict
native/codec gates, disjoint writes and smallest change. The child-only helper
adds one operation beside accepted ARM7 without changing its ownership.

Graft the combined design's explicit sequencing: collect and validate all 20
write extents before applying any, then compare the whole child after both child
writes. Reject its composite owner, mutual exclusion and CurrentBuild/approval
abstractions because they add caller coordination without a required capability.

Correct the local candidate's stage-count prose: source-enabled paths have
19/20/21 stages, reference-only paths 15/16/17. Existing default and ARM7 paths
retain their order. The child stage is `child_arm9_native_roundtrip`.

Implementation follows the complete operation and private immutable capture,
using existing native-link, relocation and codec checks. Keep payloads as the
existing packer's bounded write records; adopt additional types only where they
prevent misuse. Require concrete live operation authority and reject loaded
audit JSON. Analyzer and codec approvals are separate from production pins.

Grounding and both complete candidates are preserved alongside this record.
A clean upstream codec build passes its invented roundtrip and release build;
source audit and approval remain pending. No code, source credit or completion
claim follows from this selection. T10 stays open.
