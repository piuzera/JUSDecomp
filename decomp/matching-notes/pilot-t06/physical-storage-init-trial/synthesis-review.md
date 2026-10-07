# Task 37 synthesis review

Reviewed by gpt-6-astra. No flags in the bounded release reviewed.

Release SHA256: `8a9d5ba7473e938029fd8a2b78c53df811b8973dcb05bcdf1072f12e9bb380aa`.

The release preserves all six cross-judge requirements:

1. One unchanged `verify.verify` call and its single source-build compiler invocation per replay; no preliminary target compile or `run_experiments` execution.
2. Original DSD complete-TU proof before the C body, plus the current actual source-delink output gate before each compiler invocation. The real command result is preserved. Gap-object slicing/substitution is forbidden.
3. Local physical storage/counter views, exact original symbols, explicit alignment/string trial preconditions, and no original class/global-size/ownership claims.
4. Ordered current stored-field reads and opaque helper behavior retained from A, with no alias at the counter's interior address or new allocation policy.
5. Real original-artifact controls before source implementation. Metadata tuple checks cannot stand in for C layout evidence. Corresponding boundary behavior must fail before its implementation.
6. Freshness on rejection and successful paths, raw failed `source_build` stage results, exclusive receipt publication, and post-publication exact-byte/input/artifact/ROM checks.

Bead37 comment1383 records the release and prerequisites while stating no C body/compiler existed yet. That matches the release's conditional authorization. The preserved cross-judge file hashes exactly to `0eb050a2dd23d5d0496ddb05c08d20db298542f0818aebb9166a1a6a1f33067e`.

This review validates the synthesis and recorded release. It does not claim the DSD split, controls, implementation, compiler result or final receipt have run. Those remain implementation evidence to inspect later. Scope is the release document and selected bead record, not the complete transcript. No code, compiler run, tracked edit or agent was created by this review.
