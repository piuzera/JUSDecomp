# Native ARM7 physical baseline

Architect phases:

- Ground: complete read-only feasibility; both packages trace checked-view and native-link ownership.
- Sketch: complete, two frozen isolated designs, physical b061387e and flat4bc2e0e.
- Agree: complete, parent and independent gpt-6-sol select physical with small flat-design grafts; no human checkpoint requested.
- Implement: in progress in isolated DSD worktree; missing-module public API RED observed.
- Scrap: pending assessment of concrete implementation deviations.

Arena phases:

- Frame: complete. Prove native physical ARM7 linking while retaining checked program identity and zero source or function credit.
- Fan out: complete, both full candidate packages retained.
- Cross-judge: complete, gpt-6-sol physical15/flat12.
- Pick: complete, parent physical14/flat10 and judge agree on physical.
- Graft: complete, consumed-sidecar/selector proof, actual ELF corruption test and explicit input-snapshot freshness ownership.
- Verify: pending real parent/child ELF and reconstruction proof plus negative fixtures.

Rubric, each criterion scored 0 to 3:

1. Immutable checked ownership: caller cannot substitute mutable metadata or another program after validation.
2. Physical placement evidence: actual ELF proves original initialized VMAs/LMAs and BSS extents without serializing BSS.
3. Stored image proof: exact reconstruction rejects missing/altered regions, table, entry and unexpected allocated bytes.
4. Small interface: bounded native linking path hides implementation details and avoids ARM9 Config/Module impersonation.
5. Reproducibility: pinned tools, fresh actual input/output hashes, public synthetic negatives and independently rerunnable real proof.

No ARM7 source, function, original relocation or executable-classification claim follows from this baseline. Production pins remain unchanged until reviewed compatibility proof.
