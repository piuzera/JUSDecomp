# Task 37 cross-judge

Reviewed by gpt-6-astra. Both candidates were read end to end after they froze. This is design review only. No source implementation, compiler invocation, or trial release occurred in this review.

- A: SHA256 `a7dd206510b7b582cda86fe06e1de2e3962eb8572e7e60210225cc353b100976`.
- B: SHA256 `4f3db2557561d524a7bb441a66dea7f3b9365c41c01e5aa859954205db90013c`.

Choose A as the base. Retain its explicit physical layout, ordered stored-field reads, single verifier-driven compile, and outcome distinction. Graft B's explicit original complete-TU preflight and prohibition on substituting the containing gap object. Revise the synthesis points below before recording a source/compiler release.

## Scores

Each criterion is scored 0–2 against the shared rubric.

| Criterion | A | B | Reason |
| --- | ---: | ---: | --- |
| 1. Observed storage and machine behavior | 2 | 1 | A freezes declarations, offsets, widths and the stored-field reload after the first opaque call. B states the behavior but leaves typed external declarations/counter expression and whether the second argument is reloaded from storage unspecified. |
| 2. One recipe/model, whole TU, stop on miss | 2 | 1 | Both freeze build114/O2 and strict extent/RELA. B explicitly runs `run_experiments`, then `verify` on a match; that compiles twice. A correctly lets `verify` compile once and stop or continue. |
| 3. Numeric binding and claim limits | 2 | 2 | Both preserve the original symbol identities and exclude allocation, original C++ identity, ownership and tuning hints. A's prefix type is an experimental physical view, not a recovered original global declaration. |
| 4. Real APIs and feasible/gated integration | 2 | 1 | A names the actual single-compile route and failure-stage result. B clearly identifies the complete-TU split risk but duplicates the compiler stage and leaves the handoff split across trial/native helpers. Neither claims the unrun DSD split has passed. |
| 5. Meaningful controls before implementation | 1 | 1 | Both propose real ELF mutation controls. A is more concrete, but its deliberately wrong layout tuple is a metadata assertion, not evidence that source layout checks work. Both need a precise per-replay precompile reference gate and receipt/failure freshness policy. |
| 6. Small public operation and finite ownership | 2 | 2 | Both expose one fresh-output replay, declare bounded ownership, and preserve canonical state. A concentrates orchestration more clearly. |
| Total | 11/12 | 8/12 | A plus the specific B preflight graft is the recommended synthesis. |

## Required synthesis decisions

1. **Compile once in each replay.** Delete B's `run_experiments` execution path. Keep its diagnostics only where they do not compile. Call unchanged `verify.verify(...)` once after the original-artifact controls and released source exist. Its `source_build` stage performs the one compiler invocation. A strict miss ends the replay before LCF/native linking. Independent replays can each perform that same single frozen trial; no source or flag variations follow a miss.

2. **Make the 92-byte reference gate precede the actual compiler in every replay.** First prove the DSD complete-TU split using only original ROM/metadata and a declared source path, before writing the target body. `prepare_source_config` checks path/declaration identity, not source contents, so this preparatory step does not require a C implementation. Require the fresh separate TU's one ARM function, 92-byte extent, initialized section inventory, four named relocations/addends and original loaded payload. Never slice the containing `_dsd_gap@main_5.o` or select it as the override for a 92-byte source object.

   The synthesis must name how the current replay's `candidate-delinks/src/main/...o` passes that gate immediately after its real DSD `source_delink` and before `build_sources`. A feasible unchanged API seam is `verify`'s existing `stage_runner`: call the genuine `run_command`, inspect the actual completed DSD output at that one boundary, reject a failed reference check, and otherwise return the genuine `CompletedProcess` unchanged. Do not fabricate stage results. A preliminary copy checked elsewhere is insufficient unless the current compiler reference is bound to it and checked before compilation. This is a design option, not permission to implement an unreviewed interception framework.

3. **Preserve A's physical access model without promoting it.** `Storage20` describes the six accesses and a minimum usable prefix. It is not the complete enclosing original object. `OriginalCounterPrefix` may express the observed word at original symbol `data_020a0c34 + 0x30c`; it owns no storage and makes no claim that the original program declared that aggregate. Do not use its `sizeof` to infer an original global extent, emit an instance, or replace the original symbol with an alias at `020a0f40`. Retain the exact two ABS32 names/addends. Freeze target pointer/word/halfword widths, four-byte alignment, member offsets, unsigned counter arithmetic and the opaque helper declaration before the one source model is written.

4. **Keep observed ordering.** Retain the key in storage, choose the optional-label fallback, reload the currently stored key for the first opaque call, then reload the currently stored label after that call. Keep both halfword stores and the later counter increment. Do not introduce purity, `restrict`, null recovery, lifetime or allocator assumptions. The actual whole-TU gate, not the readability of the C sketch, decides acceptance.

5. **Distinguish real layout evidence from a tuple check.** Before source implementation, use the actual original TU for exact-copy positive and extent/mode/instruction/pool/RELA/extra-section negatives. Pin/source/tool failures must occur before compilation. Compile-time width/offset/size assertions can be part of the single released C model, but changing a Python tuple alone does not prove those C assertions. No extra target compiler trial is needed to claim more test coverage.

6. **Define failure and publication authority.** `verify` stops on source mismatch before its final freshness stage. Therefore a measured rejection receipt must independently recheck the frozen source/tool/reference/recipe inputs and the actual diagnostic object after diagnostics; otherwise an input failure could be mislabeled as a model miss. A malformed/unsupported object, missing artifact or pin failure is `blocked`, not a successful exact result. After writing the final experimental receipt, recheck its exact bytes and all captured output/input hashes relevant to the outcome. Task35's known late-receipt defect must not recur. Do not rewrite the verifier's report/status or treat its research source-coverage number as canonical promotion.

## API findings checked against source

Graph discovery used `JUSDecomp-verification`; the decisive snippets were checked against the publisher files.

- `verify.prepare_source_config(root, output, manifest)` at `tools/scripts/verify.py:308` requires `decomp/src/...`, corresponding `src/...o`, supported module, unique basename and a complete declaration in the supplied root. It derives candidate config; it does not compile or prove a 92-byte split itself.
- `source_build.build_sources(manifest, root, output, reference_dir, compiler, runner)` at `tools/scripts/source_build.py:217` creates a fresh object, records command/hash, compares it, and leaves zero accepted units/empty objects on failure. It does not accept a precompiled-object argument.
- `source_build.compare_objects(reference, compiled, functions)` at `tools/scripts/source_build.py:183` compares allocated section inventories, function identities/extents/modes, exact named RELA, section type/flags/size and masked initialized bytes. Changing an unresolved relocation placeholder alone is correctly not a negative; changing relocation identity/addend is.
- `verify.record_stage(report, name, action)` at `tools/scripts/verify.py:141` retains the returned builder dictionary as `stage['result']` before raising on its failed status. On that path `report['source_build']` is not assigned. Read the failed stage result for diagnostics.
- `verify.verify(rom, output, dsd, lld, clang, root=..., stage_runner=..., source_manifest=..., source_compiler=..., compiler_runner=...)` at `tools/scripts/verify.py:386` runs source delink then source build once, writes `source-objects.json` only after success, and then runs the native pipeline. It returns `(report, report_path)`, not an accepted object handle or receipt path.
- Native proof uses `native_link.prepare_objects(lcf, reference_dir, object_dir, overrides)`, `verify.verify_link_record(output, tools, source_build)`, and `source_accounting.verify_source_ownership(source_build, link_inputs, lcf, link_map_path, linked_elf, config_dir)`. The ownership function receives LCF text. Actual selected raw/normalized inputs, map and linked bytes must agree.
- `rom_roundtrip.roundtrip_rom(original_rom, build_dir, regions, verified_build, output_rom, arm7_operation=None, child_operation=None)` remains downstream of module, relocation, ownership and freshness checks. No new ARM7/child authority is needed for this bounded ARM9 experiment.

The research root must also satisfy real `git rev-parse HEAD` and pin the visibly derived metadata/source/manifest. Merely recording the publisher commit while silently changing a copied root is not derivation evidence. Keep the original 47 Git/CRLF ownership distinct from the research-only modified delinks file.

## Decision boundary

Design A with the listed grafts is suitable for root synthesis. The DSD split and original-TU controls remain unrun prerequisites. No finding here releases C implementation, compilation, canonical source credit, or a second model. Freeze the synthesized design, recipe and test order, record the release, then execute the original-artifact gate first.
