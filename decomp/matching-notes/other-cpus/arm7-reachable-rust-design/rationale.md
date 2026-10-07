# Bounded Rust candidate graph rationale

## Problem

Checked ARM7 observations already preserve program identity, explicit V4T mode,
instruction boundaries, and guarded transfers. The missing operation is a join
between selected observations that can explain a candidate caller chain. Generic
`Function` would add unsupported boundaries and V5TE policy. Loaded reports would
also require a new authority boundary before their graph could be trusted.

## Usage (caller's view)

The [three call sites](README.md#caller-usage) construct a known two-span call
chain, keep parent and child separate, and inspect the startup loop and BX suffix
under separate root assumptions. One `connect(observations, roots)` call returns
an immutable graph. Root/frontier views return original guarded witness edges.
The caller chooses observations and assumptions; the graph owns every join,
conflict, traversal, and witness decision.

## Shape

Use one new `analysis::arm7_reachable` module. Borrow live `SpanObservation`
values; their private fields and checked-module origin already encode authority,
per encode-lessons-in-structure. Roots borrow those observations and inherit mode
and identity. Validate membership and instruction starts at construction, per
boundary-discipline. Instructions are nodes; block objects would add split and
ownership policy the first caller does not need, per laziness-protocol.

Sorted private indexes resolve targets, while a predecessor vector per root
bounds traversal to the supplied instructions. Preserve original transfers by
reference, per single-source-of-truth. A typed frontier records unresolved
selection, interior, mode, BSS, mapping, or indirect cases. Borrowed output views
keep private graph indexes out of callers. The interface hides graph mechanics
behind one operation and read-only inspection; it is deeper than a sequence of
public index, join, and traversal calls.

## Synthesis decision

This is the Rust owner candidate. Parent arena selection is pending. Its strongest
reason to become the base is that existing checked Rust values can carry the
entire graph's authority without a second receipt-validation implementation.

## Tradeoffs accepted

- We accept borrowed graph lifetimes in exchange for reusing immutable evidence
  directly, without duplicating instruction and guard records.
- We accept one predecessor vector per root in exchange for bounded cycle handling
  and cheap, deterministic witness reconstruction.
- We accept instruction nodes in exchange for avoiding premature block/function
  ownership. Later presentation can group instructions if a caller needs it.
- We accept conservative unresolved mappings in exchange for never inferring new
  memory ownership from a different observation's omitted context.

## Alternatives considered

A Python graph over probe receipts has a compact caller API and convenient report
handling. It must also establish receipt provenance and reproduce identity,
mode, and ownership checks across a serialization boundary. Rust hides those
checks behind the existing private observation constructor instead.

A generic graph library or configurable traversal pipeline exposes indexing,
guard adapters, and stop policies to callers. It does not hide the ARM7-specific
join decisions. A block graph adds segmentation policy without improving the
first candidate caller-chain result.

Generic `Function` integration retains the known V5TE and function-extent
assumptions. A narrow literal/BX recognizer could resolve the startup operand,
but that is new instruction/value semantics. Both remain outside this operation.

## Open questions and risks

Will a later consumer require all paths rather than one deterministic witness?
If so, can it consume the retained edge graph without promoting guard feasibility
or requiring an exponential path enumeration? Can the chosen report distinguish
candidate graph closure from actual runtime execution plainly enough for future
source-mapping callers? The proposed root assumptions and preserved guards make
that distinction explicit, but report review remains an acceptance gate.

## Next implementation step

Write a failing invented checked-fixture test joining one direct call to a
second selected instruction start while preserving its guarded continuation.
