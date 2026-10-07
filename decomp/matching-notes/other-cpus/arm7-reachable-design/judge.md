# ARM7 reachable graph design judgment

Read both packages in full: Rust candidate `720d963` (`README.md`, `shape.rs.txt`, `rationale.md`) and caller candidate `79caa2b` (`usage.md`, `shape.py.txt`, `algorithm.md`, `rationale.md`). Compared them with `arm7-reachable-contract.md`, `root-proof.json`, and the accepted `7b3513f` Rust definitions through graph project `ds-decomp-arm7-physical-7b3513f`. This is a design judgment only.

| Criterion (0–3) | Native Rust | Fresh Python caller |
| --- | ---: | ---: |
| One small operation hides joining and traversal | 3 | 3 |
| Same-program, explicit-mode, checked authority; no detached JSON trust | 3 | 2 |
| Joins only selected instruction starts and classifies guarded frontiers | 3 | 3 |
| Finite cycles, mode conflicts, Thumb BL interiors | 3 | 3 |
| Small coherent change; actual caller chain; no inflated claims | 3 | 2 |
| **Total** | **15/15** | **13/15** |

**Recommend the native Rust candidate as base.** `connect(&[SpanObservation], &[RootRequest])` accepts the existing immutable, checked observations and contains the index, joins, conflict detection, traversal, and witnesses in one module. In accepted source, `SpanObservation` has private identity, target, selection, instruction, and transfer fields with read-only getters; `observe` constructs it only after source/module checks and `decode_span` uses bounded explicit-mode V4T decoding. `Target::Address` carries the observer's required mode and `Mapping::{Initialized,Bss,UnresolvedBytes}`. `Arm7ModuleIdentity` carries program, CPU, and region. This supplies the precise authority needed to join a mapped target to a selected start, without creating a second receipt validator. Its one predecessor vector per root visits at most N selected instructions and examines at most E retained edges, so O(R(N+E)) is a finite, input-derived work bound. Document that bound and reject allocation/index overflow; an arbitrary resource knob or configurable traversal stage is unnecessary for this first operation.

The Python candidate has a comparably small public call and correctly refuses detached historical JSON. Its provenance design is serious, but maintaining a fresh five-argument subprocess capture, complete source/helper inventory, exact receipt validation, post-run hashes, and `recheck()` creates a larger second authority boundary than this graph needs. Its wire format lacks a checked header-entry accessor and complete checked module extents; the candidate itself correctly limits absent-root ownership to `unobserved_root`. A fixed `work_limit` may reject otherwise valid explicit selections and adds policy without an identified fixture. Keep the native graph's input-derived bound.

**Concrete grafts into the Rust base:**

- Borrow the Python candidate's explicit report `scope` language: rooted *candidate selected interpretations*, with caller assumptions and symbolic guards, never runtime execution. Serialize each root's address, mode, full program identity, and assumption, plus every original transfer's source, kind, guard, target mapping/boundary, and the source instruction's condition. The Rust sketch promises these fields, but the custom `Serialize` body is still only a comment; make this an acceptance check.
- Retain the Python candidate's explicit rule that a local observer `InstructionInterior` cannot be promoted by a later overlapping interpretation. Same-mode overlapping selections fail atomically; opposite-mode overlapping bytes quarantine every intersecting instruction. A target covered only in the other mode is `ModeConflict`, never an implicit mode switch.
- Use the Python candidate's audit phrasing for unresolved roots if helpful, while keeping the native constructor stricter: an explicit root must be a start in its referenced supplied observation. A root on a conflicting start yields a typed root frontier rather than traversal.

**Compatibility details to settle before implementation:**

1. `ProgramIdentity` contains `parent_rom_sha256`, `program: ProgramSelector`, and `program_sha256`; do not compare only payload bytes or program hash. Compare `Arm7ModuleIdentity`'s program, CPU, and region for a mapped initialized join, and require the target's mode to equal the destination selection's mode. Both parent and child have the same three new words but distinct program identities in `root-proof.json`.
2. `RootRequest` borrows a `SpanObservation`, while `connect` receives a slice. Validate actual slice membership by reference identity, plus exact instruction start and nonempty assumption; equality of address or bytes is insufficient. The proposed lifetimes are plausible against the getters, but the sketch is uncompiled. Build the smallest fixture first to prove the borrow and iterator signatures.
3. `InstructionObservation` has address and byte length; a complete Thumb BL is one four-byte instruction from `decode_span`. Index complete byte intervals, not two-byte halfwords. An edge or root at its interior is `InstructionInterior`. Implement interval lookup with a sorted interval index or equivalent, so the stated cost and conflict behavior are real.
4. The target's observer `boundary` is local to its source selection. Recompute membership across the supplied observations, but never turn `UnresolvedBytes` into initialized ownership using another observation. Keep the original mapping and guard in the report even when the graph resolution changes to a selected node.
5. Preserve all seven original transfers in the grounded five-node graph: `0x037f8468 → 0x037f846c → 0x037fcecc → 0x037fced0 → 0x037fced4`, then call frontier `0x037fd02c`; the call-return continuations at `0x037f8470` and `0x037fced8` are separate frontiers. The startup `0x02380028 → 0x02380020` back edge terminates traversal through visited nodes; the condition-failed `0x0238002c` remains a frontier. Independently selected `BX r1` remains unknown. These are candidate paths under roots and guards, with no function, executable, original relocation, or source-credit claim.

The checked header entry is evidence for selecting an address; it does not establish ISA mode or that execution reached it. Neither package should change the old sixteen ARM7 approval files or canonical pins for this research graph.
