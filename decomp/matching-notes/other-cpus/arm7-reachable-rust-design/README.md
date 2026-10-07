# Rust owner for bounded ARM7 candidate graphs

Phase B candidate only. Grounding is complete; this package sketches the public
shape. Selection and implementation belong to the parent architect run. No DSD,
verifier, approval, or executable changes occur here.

## Caller usage

One `connect` call consumes borrowed checked observations and root assumptions.
It builds immutable instruction links, classifies every frontier, and records a
bounded traversal per root. It never requests another decode. The graph joins
interpretations already supplied by the caller.

The examples use proposed `analysis::arm7_reachable` declarations from
[shape.rs.txt](shape.rs.txt). `observe`, `Selection`, and the checked-module APIs
already exist. A root borrows a particular observation; its program identity and
mode come from that value. Its nonempty assumption describes why the caller
selected that address. The assumption is recorded, not certified by the graph.

### Research probe joining the known call

```rust
use ds_decomp::analysis::arm7_observation::{observe, Selection};
use ds_decomp::analysis::arm7_reachable::{connect, RootRequest};
use ds_decomp::config::symbol::InstructionMode::Arm;

// view is the result of this exact program's Arm7Layout::checked(parent_rom).
let modules: Vec<_> = view.module_inputs().collect();
let autoload0 = &modules[1];
let observations = vec![
    observe(autoload0, Selection { span: 0x037f8468..0x037f8470, mode: Arm }, &modules)?,
    observe(autoload0, Selection { span: 0x037fcecc..0x037fced8, mode: Arm }, &modules)?,
];
let graph = connect(&observations, &[RootRequest {
    observation: &observations[0],
    address: 0x037f8468,
    assumption: "Inspect ARM seed grounded by the startup literal/BX evidence",
}])?;
for root in graph.roots() {
    for frontier in root.frontiers() {
        println!("{:?}", frontier.reason());
        for transfer in frontier.witness() {
            println!("{:08x} {:?} {:?} {:?}", transfer.source(),
                     transfer.kind(), transfer.guard(), transfer.target());
        }
    }
}
```

The selected graph has five instruction nodes and seven original transfer edges.
Four edges join selected starts. Three remain outside the selections:
`0x037f846c` has a call-return continuation to `0x037f8470`; `0x037fced4` has a
call to `0x037fd02c` and a call-return continuation to `0x037fced8`.
The witness to `0x037fd02c` retains the root assumption and both original call
sites. It establishes a root-relative candidate caller chain useful for choosing
the next independent function-mapping investigation. It establishes no function
boundary or actual execution path.

### Separate parent and child reports

```rust
// Each vector was produced with observe using its own checked view/module list.
let parent_graph = connect(&parent_observations, &[RootRequest {
    observation: &parent_observations[0], address: 0x037f8468,
    assumption: "Parent ARM seed from checked startup evidence",
}])?;
let child_graph = connect(&child_observations, &[RootRequest {
    observation: &child_observations[0], address: 0x037f8468,
    assumption: "Child ARM seed from its own checked startup evidence",
}])?;
assert_ne!(parent_graph.program(), child_graph.program());
serde_json::to_writer_pretty(parent_output, &parent_graph)?;
serde_json::to_writer_pretty(child_output, &child_graph)?;
```

Equal addresses, bytes, and ARM7 payload hashes do not collapse program identity.
Combining those observations in one constructor call fails atomically. Serialized
output is a report, with no deserializer or graph constructor from JSON.

### Startup loop and independently selected BX suffix

```rust
let startup = &modules[0];
let observations = vec![
    observe(startup, Selection { span: 0x02380000..0x0238002c, mode: Arm }, &modules)?,
    observe(startup, Selection { span: 0x023800c0..0x023800cc, mode: Arm }, &modules)?,
];
let graph = connect(&observations, &[
    RootRequest { observation: &observations[0], address: 0x02380000,
                  assumption: "Inspect checked startup header entry in ARM mode" },
    RootRequest { observation: &observations[1], address: 0x023800c0,
                  assumption: "Inspect grounded BX suffix independently; no path from header asserted" },
])?;
serde_json::to_writer_pretty(output, &graph)?;
```

The first root retains the conditional loop `0x02380028 -> 0x02380020` and the
condition-failed frontier at `0x0238002c`. Each selected instruction is visited
at most once per root. The second root reaches the unknown exchange at
`0x023800c8`. The graph does not invent a connection across the unselected gap,
and the known literal value does not replace the observer's unknown BX target.

## Grounding and module ownership

Graph project `ds-decomp-arm7-physical-7b3513f` resolves the actual accepted
`SpanObservation`, `Target`, `ProgramIdentity`, and `InstructionMode` definitions.
The source checkout is `/private/tmp/jus-arm7-physical-baseline-dsd` at
`7b3513f05adc88a1cca8b0365d3a3607a50a1b25`. Its private observation fields and
public immutable getters provide the required evidence without a new raw-input
constructor. The [grounding contract](../arm7-reachable-contract.md) and
[independent proof](../arm7-reachable-grounding-proof/root-proof.json) fix the
actual selections, instructions, transfer destinations, and remaining limits.

| Module | Responsibility |
| --- | --- |
| Existing `rom/arm7.rs` | Checked program identity, header, physical loader layout, initialized and BSS extents. Unchanged. |
| Existing `rom/arm7_modules.rs` | Checked module input and atomic explicit-mode V4T decode. Unchanged. |
| Existing `analysis/arm7_observation.rs` | Immutable instructions and guarded transfer meanings. Unchanged. |
| New `analysis/arm7_reachable.rs` | One `connect` operation, private indexes, target joins, root traversal, frontier/witness views, and report serialization. |
| Existing `analysis/mod.rs` | Export the new module. |
| New `examples/arm7_reachable_probe.rs` | Parse independently pinned caller selections and assumptions; use existing checked views and observer; call `connect` separately per program and serialize reports. |
| New `tests/arm7_reachable.rs` | Invented checked fixtures and constructor/graph contracts, reusing existing fixture support. |

The new graph stores references to existing instruction and transfer records.
It does not copy guard semantics, reparse assembly, widen V4T policy, or enter
`analysis/functions.rs`. A graph lookup traverses one new module and the existing
observation getters. Shared mutable state is absent.

## Boundary rules

Constructor validation is atomic. Reject empty inputs, foreign program identity
or target policy, a root referencing an observation outside the input slice,
root addresses that are not instruction starts in their referenced observation,
empty root assumptions, duplicate roots, and duplicate or overlapping selections
in the same mode. Exact full identity includes parent hash, program selector,
program hash, CPU, and each checked region identity where an edge is joined.

Different-mode overlapping interpretations are retained as a conflict, never
silently chosen. Any instruction whose byte interval touches that conflict is
blocked from traversal. An incoming edge to it becomes `ModeConflict`; a root on
it produces a root frontier with an empty witness. A target covered only by an
opposite-mode selected interpretation is also `ModeConflict`. No alternate-mode
node is traversed to repair a missing same-mode node.

Resolution uses the transfer's existing `Target` and checked mapping. An unknown
target remains `Indirect`; BSS remains `Bss`; unresolved byte ownership remains
`Unmapped`. A mapped initialized target joins only an exact instruction start in
a selected observation with matching full program, region identity, and mode.
An initialized target inside a same-mode selected instruction becomes
`InstructionInterior`; another initialized address becomes `OutsideSelection`.
The graph recomputes selection boundaries across all supplied observations,
since the observer's boundary field concerns only the source selection.

Omitted context stays omitted: an observer target marked `UnresolvedBytes` does
not become initialized merely because another supplied observation covers that
address. Callers seeking that join must create observations with their complete
checked module context. The graph never synthesizes memory mappings.

The graph preserves every original `TransferKind`, `TransferGuard`, condition,
source, and target. It traverses possible guarded edges to compute a candidate
closure, without solving path feasibility. Witnesses are deterministic walks
through those original guarded edges. They do not certify that all guards can
hold together, that a call returns, or that a memory access succeeds. A caller
must not relabel this closure as proven runtime reachability.

## Data structures and access costs

The graph keeps one sorted vector of selected instruction references, ordered
by address and explicit ARM/Thumb rank within its single checked program. A
parallel index of selected byte intervals detects conflicts and interiors.
Flattened original edges have a contiguous range per source node. Resolutions
refer to private node indexes or store a frontier reason. No ID crosses the
public boundary.

One visited/predecessor vector per root has at most N entries, where N is the
number of supplied instruction starts. Roots are validated before traversal,
and each traversal visits each admissible node once. This input-derived bound
is the work limit; no recursive decode, path-state enumeration, resume protocol,
or arbitrary maximum-address scan exists. All edges, including back edges, are
retained. A witness uses the predecessor tree and includes the terminal transfer.
It is one shortest-edge-count candidate witness, not all paths.

Construction costs O(N log N + E log N + R(N + E)), with O(N + E + RN) retained
memory for R roots and E original transfers. A witness materializes at most N
transfers. Output view methods borrow the owning graph, so a caller cannot pass
a frontier index from a different graph or mutate its authority. Repeated calls
with identical observations and roots produce the same node order and witnesses.

## Acceptance targets for the later implementation

The first failing fixture joins a direct call to a second independently selected
same-mode instruction start. Its frontier witness must contain the original
caller and retain call-return guards. Additional fixtures cover foreign-program
mixing, omitted context, duplicate and same-mode overlap, opposite-mode conflicts,
Thumb BL interiors, BSS, unknown PC writes and exceptions, empty/foreign/interior
roots, and a conditional cycle. A conflicting root must produce a frontier,
never a traversal under a silently chosen mode.

The actual proof then consumes the existing pinned two-program fixture. For
each program it must reproduce the five-node, seven-edge selected call graph,
three frontiers, startup cycle, and unknown BX. It must not promote autoload1,
external RAM copy dependencies, or unselected destinations. Reports expose no
function counts, original relocation counts, source credit, or global coverage.
The sixteen existing ARM7 approval files remain byte-identical.
