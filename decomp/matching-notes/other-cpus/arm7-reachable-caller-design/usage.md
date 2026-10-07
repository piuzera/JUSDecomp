# Caller-owned fresh observation composition

This candidate gives a research caller one operation that runs the unchanged approved observer and builds a bounded candidate graph. The graph describes selected interpretations and root assumptions. It does not recreate Rust checked views from JSON.

## Join the grounded direct-call selections

```python
from arm7_reachable import observe_candidates, SelectedSpan, RootAssumption

# Both values explicitly contain the full parent/program SHA identity.
# Repeat the exact invocation separately with the child's full identity.
operation = observe_candidates(
    original=rom, layout=approved_layout, observer=accepted_observer,
    selections=(
        SelectedSpan(parent_identity, "autoload0", "Arm", 0x037f8468, 0x037f8470),
        SelectedSpan(parent_identity, "autoload0", "Arm", 0x037fcecc, 0x037fced8),
    ),
    roots=(RootAssumption(parent_identity, "Arm", 0x037f8468,
                          pinned_seed_evidence),),
    work=fresh_work,
)
graph = operation.graph
# Candidate path includes 8468 -> 846c -> cecc -> ced0 -> ced4.
# d02c is an initialized-outside-selection frontier.
# ced8 is another frontier, guarded by call return.
save_audit(graph.audit_copy())
```

`parent_identity` and `child_identity` cannot substitute for each other when their selected bytes match. A caller cannot instantiate a checked observation or reload an operation from the saved audit.

## Startup loop and unknown exchange

```python
loop = observe_candidates(
    original=rom, layout=approved_layout, observer=accepted_observer,
    selections=(SelectedSpan(parent_identity, "startup", "Arm",
                             0x02380000, 0x0238002c),),
    roots=(RootAssumption(parent_identity, "Arm", 0x02380000,
                          pinned_header_selection_evidence),),
    work=fresh_loop_work,
)
# The caller's root is an explicit assumption, not a new checked-header accessor.
# BLT at 0028 retains taken edge to 0020 and not-taken frontier at 002c.
loop.graph.audit_copy()
```

Select `[0x023800c0,0x023800cc)` in a separate operation and explicitly root at `0x023800c0` to retain the unknown `BX r1` destination. The independently known literal does not turn that BX into a graph edge to `0x037f8468`.

## Expand only by a new caller selection

```python
# The caller reviews d02c and chooses its own bounded end, mode and evidence.
expanded = observe_candidates(
    original=rom, layout=approved_layout, observer=accepted_observer,
    selections=old_selections + (new_independently_selected_span,),
    roots=old_roots, work=another_fresh_work,
)
expanded.recheck()
# No resume-from-JSON, implicit recursion, or inferred function end exists.
```

Every run has private output and finite work. Explicit selection bytes and instruction nodes bound graph work; traversal visits each accepted instruction at most once and retains cycle edges. Save an audit for inspection, then rerun the original operation to obtain fresh authority.
