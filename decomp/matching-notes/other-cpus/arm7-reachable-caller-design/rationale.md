# Caller-owned candidate graph

## Problem

The next research probe needs a root-relative caller chain across already selected ARM7 observations. The approved observer already provides guarded transfers, instruction starts and full program identity. A new Rust graph module would retain checked types directly, but would also change accepted producer sources. This candidate explores a Python owner of fresh execution and bounded graph composition.

## Usage (caller's view)

[Usage first](usage.md) shows a direct-call join, a startup cycle and caller-controlled expansion. One `observe_candidates` operation returns an immutable graph. Callers provide full identities, bounded selections and evidence-bearing root assumptions. They do not coordinate decoding or load historical receipts.

## Shape

[Types and signatures](shape.py.txt) expose requests, immutable graph facts and one live operation. [The boundary decisions](algorithm.md) define private receipt conversion and joining. A new `tools/scripts/arm7_reachable.py` owns exact subprocess evidence, source/tool snapshots, instruction indexing, guarded traversal, frontier classification and rechecks. Existing `arm7_observation_probe` retains ROM/layout validation and decoding unchanged. This is a deep operation, per boundary-discipline; callers see one capability rather than its transport stages.

Every key includes full program identity, CPU and mode. Immutable domain nodes reference their selected region and actual observer output digest. Private construction distinguishes facts originating in a fresh approved run from arbitrary JSON, per encode-lessons-in-structure. No Python value is advertised as a Rust checked view. The selected-start index and disputed byte intervals are the only graph indexes. A visited worklist makes cycles finite without collecting paths or guessing returns.

The boundary has a concrete limit. Existing stdout does not expose the checked header entry, complete module byte ranges or raw selection bytes. Consequently this candidate supports explicit root assumptions only. An absent root is `unobserved_root`; ownership is unknown. BSS target ownership comes from the freshly run observer's emitted mapping. A checked-header root API or independently verified module descriptor API requires a producer change and belongs to the native candidate.

## Module map

| Module | Responsibility |
| --- | --- |
| Research caller | Bounded selection, full program identity and pinned root assumption |
| `arm7_reachable.py` | Fresh producer provenance, private parsing, immutable candidate graph and recheck |
| Existing observer probe/library | Checked ARM7 view, V4T decode and guarded transfer observations, unchanged |

## Synthesis decision

Candidate recommendation only. Choose this shape when retaining the accepted observer binary unchanged is the deciding constraint and operation-bound root assumptions are sufficient. Prefer a native graph module if the deliverable needs a library contract accepting actual checked types or a checked-header root accessor. Python cannot honestly supply those features through the existing CLI.

## Tradeoffs accepted

- We accept dependence on approved producer serialization and semantic correctness in exchange for leaving the accepted observer unchanged.
- We accept explicit root assumptions and incomplete arbitrary-root ownership in exchange for avoiding a false checked-view adapter.
- We accept a fresh subprocess run for each caller expansion in exchange for immutable operation-bound provenance.

## Alternatives considered

A Rust graph inside the checked-view library hides wire parsing and preserves actual checked module authority; it wins on type depth when graph use belongs inside that library. It requires new source review and binary evidence, while this caller-only operation reuses the accepted observer.

A pure Python function over saved observation JSON hides graph indexing but leaves producer authority, identity validation and source freshness to every caller. It loses because stale or forged receipts could grant candidate reachability without checked execution.

## Open questions and risks

Is explicit-assumption research output sufficient, or must consumers receive native checked-header roots? Can the existing observer source/binary approval provide a complete immutable consumed-source inventory for the new wrapper without editing the 16-file physical capsule? The wrapper's own source approval is separate if any downstream consumer later treats it as accepted evidence.

## Next implementation step

Test a fresh private observer-run boundary that rejects detached receipt substitution, then build the instruction-start graph over the grounded two-selection fixture.

## Grounding and red-flag screen

Graph snippets in `ds-decomp-arm7-physical-7b3513f` confirmed private `SpanObservation` fields and crate-only `checked_envelope`. Actual source `lib/examples/arm7_observation_probe.rs` confirms five arguments, exact request matching, input rechecks and JSON-only output. The integration contract and `arm7-reachable-grounding-proof` supply the real direct-call, cycle and unknown-exchange fixtures. The observer and module-input code remain unchanged; all 16 physical approval files remain untouched.

The public method does not expose transport schemas or temporal stages. It adds producer provenance, graph ownership and stopping policy rather than forwarding a CLI. Wire types stay private. No inferred functions, executable classification, ends, relocations, source credit or T10 completion are introduced. This package is design only.
