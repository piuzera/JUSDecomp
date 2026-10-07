# Shared Function analyzer rationale

## Problem

ARM7 observations must preserve V4T, full checked parent/child identity, explicit instruction mode, and hard byte bounds. Existing Function stores mode only, while reparsing, register analysis, assembly, and signatures reconstruct V5TE. Config/Module analysis assumes ARM9 startup conventions and linker metadata. Sharing that shell would invent ARM7 authority; sharing instruction analysis requires changing the stored Function contract.

## Usage, caller's view

[USAGE.md](USAGE.md) was written first. Its three callers cover checked ARM7 startup observations, the existing Module import loop with explicit ARM9 policy, and existing assembly/signature consumers using the stored Function context. ARM7 callers supply only a checked module, selected span/mode, and declared address context. They receive observations with explicit completion; short grounded spans do not become functions by request.

## Shape

[SHAPE.rs](SHAPE.rs) stores an immutable context on Function and binds later byte sources to its identity. Architecture is a private valid-pair enum, per encode-lessons-in-structure. A bounded cursor hides unarm's public mutable flags from consumers. `AnalysisSpan::arm7` alone copies checked identity/ranges and invokes the existing fixed-V4T `decode_span`, per boundary-discipline. Its exact requested span bounds every later read; semantic completeness is separately derived. Shared helpers and defs/uses receive stored flags. Address context separates initialized/BSS mapping, executable declarations, and mode. All B/BL/BLX/BX/jump-table targets retain unresolved knowledge until declarations resolve it. Legacy ARM9 retains its old heuristic semantics and destination rules under explicit V5TE. This is a deep input interface: one call hides slicing, arithmetic, policy, decoder completeness, and identity validation. The caller still owns span selection and execution evidence because the tool cannot establish them from physical layout.

## Synthesis decision

This is the shared-existing-Function candidate only. Parent arena synthesis has not selected a base. Its strongest property is one lasting policy source for every consumer; its largest cost is migration of Function construction and output across ARM9 callers.

## Tradeoffs accepted

- We accept a broad shared storage/API migration in exchange for eliminating V5TE reconstruction after ARM7 intake.
- We accept strict instruction-only ARM7 spans and explicit incomplete outcomes in exchange for using the checked decoder without misclassifying literal pools or bytes after the decode limit.
- We accept a scoped legacy ARM9 identity distinct from verified ROM identity in exchange for retaining Config/ELF callers without fabricating program hashes.

## Alternatives considered

A separate ARM7 observation analyzer hides ownership and V4T at a smaller boundary and leaves ARM9 consumers stable; it loses shared Function semantics but may be the better first deliverable. Parameterizing only `parse_function` with a version loses because every stored Function consumer must still know the version. Extending Config/Module to ARM7 hides some orchestration but demands sections, symbols, relocation provenance and startup conventions the evidence does not provide.

## Open questions and risks

Would sharing existing compiler-pattern heuristics yield enough bounded ARM7 facts to justify migrating all Function constructors now? Can source-binding changes be staged while retaining exact ARM9 output behavior? Does a future requirement need persisted legacy identities, beyond the process-scoped identity sufficient for current stored Functions? These are synthesis decisions, not prerequisites for documenting the candidate.

## Next implementation step

Build the immutable shared context and strict ARM7 span bridge with the V5-only, truncated Thumb BL, cross-program, and hard-end cases before migrating shared Function consumers.
