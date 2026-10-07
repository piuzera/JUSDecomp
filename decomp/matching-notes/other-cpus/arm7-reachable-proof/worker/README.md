# ARM7 candidate graph worker proof

The native owner borrows checked SpanObservation values, joins only explicitly selected instruction starts, and records symbolic guards and unresolved frontiers. Reports describe root-assumed selected interpretations. They establish no function extent, executable coverage, original relocation, or source credit.

Source worktree: /private/tmp/jus-arm7-reachable-dsd, based on accepted 7b3513f05adc88a1cca8b0365d3a3607a50a1b25. Accepted worktree and caches were read only. Dedicated Cargo home and target are /private/tmp/jus-arm7-reachable-worker-cache/{cargo-home,target}. Rust and Cargo are Homebrew 1.98.1. Every build uses:

```
CARGO_HOME=/private/tmp/jus-arm7-reachable-worker-cache/cargo-home
CARGO_TARGET_DIR=/private/tmp/jus-arm7-reachable-worker-cache/target
RUSTFLAGS=--remap-path-prefix=/private/tmp/jus-arm7-reachable-dsd=/dsd-source --remap-path-prefix=/private/tmp/jus-arm7-reachable-worker-cache/cargo-home=/cargo-home
```

The accepted dependency prepare/check-only verified 47 source files; all 10 preparation tests passed. Only the isolated local-deps/unarm checkout was prepared.

## TDD and checks

- 01-direct-join-red.log: compiled public direct-call test fails against successful empty connect stub (nodes None versus Some(2)).
- 02-contract-red.log: all 13 initial contract tests compile and fail against that stub.
- 04-witness-red.log: real frontier witness assertion fails against empty witness stub; 16 other tests pass.
- 06-probe-red.log: original-ROM probe checker fails against compiled empty JSON probe stub.
- 09-all-tests.log: 75 existing library tests, 17 new public graph tests, one no-Deserialize compile-fail test pass (93 total, zero ignored).
- 10-clippy.log: library all-targets -D warnings passes with existing chunks_exact_to_as_chunks allowance.
- check_probe.py: independent checker compares all eight new original-ROM observations byte-for-byte as JSON values with the accepted observation receipt, checks both program identities, exact call graph counts, startup cycle/unknown BX, witness transfers and N/E visit bounds.
- check_probe_rejections.py: twelve actual producer rejection cases; none publishes partial success JSON.

One signature adjustment from the sketch: witness() returns Result<Vec<&TransferObservation>, ConnectError>, so allocation failure remains explicit. The owner stores predecessor/site indexes per root and materializes one witness on demand; constructor storage remains O(N+E+RN), since the accepted observer emits at most three transfers per instruction. Report serialization can produce larger output.

## Producer input and report schema

The example takes six positional arguments:

```
arm7_reachable_probe ROM LAYOUT_JSON LAYOUT_SHA256 REQUESTS_JSON REQUESTS_SHA256 SELF_SHA256
```

The request is an array of objects with exact `program` identity, `selections` (region, explicit mode, extent), and `roots` (selection index, address, nonempty assumption). A selection index is converted to a borrow of the freshly constructed checked observation before connect; it never acts as a graph authority handle. Unknown fields, duplicate requested programs, missing layouts/regions, or invalid roots reject.

The probe rehashes the consumed ROM, layout, request manifest and its executable before publishing. `commands.json` holds exact actual invocations. `calls-requests.json` and `startup-requests.json` remain explicit assumptions; the header validates an address, not ARM mode or execution. The startup suffix root is independent; no path across the unselected gap is invented.

Output schema version 1 has parent/layout/request/producer hashes, inputs_unchanged, separate programs, and all claim flags. Each program has identity, graph and on-demand witnesses. Graph contains scope, program, original observations, nodes, edges, roots. An edge retains source_condition and its original TransferObservation with mapping/local boundary, separately from graph resolution. Roots retain full module identity, mode, address, assumption, visited nodes, edge examination count, predecessors and frontier sites. Serialized indexes are report evidence only; the library has no deserialization or report-loading constructor.

The five-node fixture retains seven transfers: four selected joins, call frontier 037fd02c and call-return frontiers 037f8470/037fced8. Separate startup graphs retain the 02380028→02380020 BLT back edge and unknown BX r1 at 023800c8. No actual execution is claimed.

## Frozen result

Commit `71e766e562c78d4b0ec404b3b4edbe242a8d1b0f`, tree `75215439eec429f6dd82df8a9f49bba054a16839`; worktree clean. `candidate.patch` applies to the accepted base. `worker-summary.json` records source/producer/proof hashes and exact invocations.

Final release actual checks and all twelve producer rejections passed (16-release-actual.log, 17-release-negatives.log). All 80 accepted library/example tests, 17 new public tests, one compile-fail authority test, and one additional CLI unit test passed with zero ignored/failed. CLI bin has zero tests.

Legacy CLI/physical-example binary hashes differ; independent legacy initialization/native-output comparison remains with parent review. No legacy compatibility success is inferred from these changed hashes. The canonical approved tool pins and sixteen-file physical approval capsule remain unchanged.
