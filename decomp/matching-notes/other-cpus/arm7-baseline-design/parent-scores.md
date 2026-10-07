# Parent design comparison

Both complete packages were read end to end at frozen commits: physical
`b061387e` and flat `4bc2e0e`. Each criterion scores 0 to 3.

| Criterion | Physical | Flat | Evidence |
|---|---:|---:|---|
| Immutable checked ownership | 3 | 3 | Both retain checked envelope. Physical accepts the Rust view directly; flat adds a sidecar-loading domain input. |
| Actual ELF physical placement | 3 | 0 | Physical checks VMA/PADDR and separate BSS PT_LOADs. Flat explicitly keeps runtime placement outside its ELF. |
| Exact stored-image proof | 3 | 3 | Both reconstruct solely from actual linked sections and compare original bytes, parameters and ordered table. |
| Small interface | 2 | 2 | Physical needs a bounded ELF32/attributes reader. Flat adds objcopy, an attributes-cleaning step and a new input/CLI seam. Neither reuses ARM9 Config. |
| Reproducible acceptance | 3 | 2 | Physical uses existing pinned clang/lld with public actual ELF mutation tests. Flat additionally needs a new objcopy pin and an unproved nonallocated-section backend. |
| Total | 14 | 10 | Physical proves the requested native layout with fewer caller/tool boundaries. |

The provisional base is physical. This is a design choice, not a passed native
artifact. Cross-judge verdict is pending.

Grafts worth considering from flat:

- Keep consumed sidecar bytes and hash bound in the example that creates the
  checked views. Reject duplicate program selectors rather than producing two
  nominal proofs for the same selected identity.
- State that the library holds immutable input snapshots, while its file-reading
  example owns the stronger original-file freshness assertion.
- Keep the complete source image only if needed by native reconstruction; avoid
  duplicating region descriptors in the retained envelope.

Rejected additions:

- No objcopy stage or nonallocated flat payload. Neither helps prove actual
  runtime placement and each adds another artifact/tool boundary.
- No new public pinned-input facade or mutable serialized capsule. The existing
  checked view plus a pinned file-reading example already owns input validation.
- No extra wrapper types for single fixed report values. Keep the success report
  privately constructed and serialize concrete scope fields.

Clarify the physical test contract before implementation: a valid view for a
different program is a legitimate build input and produces its own identity.
The operation has no separate expected-program parameter. Negative substitution
tests must target mismatched pins/selection/artifacts and assert separate parent
and child identity, rather than require rejection of every other valid view.
