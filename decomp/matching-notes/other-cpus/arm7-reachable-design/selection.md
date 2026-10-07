# Selected ARM7 candidate graph design

Use the native Rust owner from candidate `720d963`. Retain the structurally distinct Python candidate `79caa2b` for comparison. Both were read in full before selection. The independent gpt-6-sol judge scored Rust 15/15 and Python 13/15 against the five grounded criteria; see [judge.md](judge.md).

One pure `connect(observations, roots)` operation borrows immutable checked `SpanObservation` values. It owns target joins, conflict detection, finite traversal and witness construction. Roots borrow their exact supplied observation and record a nonempty caller assumption. No caller-controlled graph IDs or report-loading constructor are added.

The existing private observation constructors already establish program, CPU, region and explicit V4T interpretation. Rust preserves that authority without a second subprocess and serialized-report validator. The Python wrapper's captured process, source inventory, receipt conversion and recheck machinery would duplicate this boundary. Its absent-root ownership is also incomplete with the existing observer wire format.

Adopt the Python candidate's explicit report scope and conflict rules. Reports describe root-assumed selected interpretations. Serialize each root's full identity, mode, address and assumption; retain original transfers, source conditions, mappings and local boundaries alongside the graph resolution. An original instruction-interior target cannot acquire a successor through an overlapping interpretation. Same-mode overlapping selections reject; opposite-mode overlap blocks every intersecting whole instruction. A conflicting root yields a typed frontier with an empty witness.

Traversal visits each admissible selected instruction at most once per root. Retain every original edge, including back edges and guarded call-return continuations. N supplied instructions and E transfers bound each root traversal by N visits and E edge examinations. Reject index/allocation overflow. Do not add an arbitrary configurable work limit, path solver, call stack, recursive decode or block/function ownership.

The implementation belongs in new `analysis/arm7_reachable.rs`, an analysis-module export, one pinned research probe and public checked-fixture tests. Accepted source `7b3513f` stays frozen; develop in a new isolated worktree. The old sixteen-file physical approval capsule and canonical analyzer/tool-role pins remain unchanged. The new source and producer receive separate evidence and review.

First prove the borrowed API with a failing test joining a direct call into a separately selected span. Then cover foreign identities and roots, duplicates and overlaps, omitted mappings, opposite-mode conflicts, Thumb BL interiors, BSS/unmapped/indirect frontiers, symbolic guards and finite cycles. Independent actual verification must reproduce both separate program graphs, the five-node/seven-transfer call chain, startup BLT cycle and unknown BX. Reports grant no function extent, executable classification, original relocation or source credit. T10 stays open.

The first implementation preserves on-demand witnesses but returns
`Result<Vec<&TransferObservation>, ConnectError>` from `witness()` so allocation
failure is reported consistently with construction. This is an accepted narrow
signature change. The direct-call test compiled and failed against a minimal
stub, followed by thirteen failing public behavior contracts. Visit and edge
examination counts provide evidence for the input-derived work bound.

Retained space includes per-root frontier capacity: `O(N + E + R*(N + E))`. Current checked observations emit at most three transfers per instruction (`E <= 3N`), so the selected design and source comment's `O(N + E + R*N)` bound is valid under that API invariant. A future observer that permits unbounded transfers per instruction must use the general bound.
