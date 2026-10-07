# Module map and traced grounding

| Owner | Responsibility and edit |
|---|---|
| `lib/src/rom/arm7_modules.rs` | Existing immutable physical boundary. Keep `decode_span` as fixed V4T authority; no new executable classifications. |
| `lib/src/analysis/input.rs`, proposed | Own immutable identity, architecture, source binding, strict span and destination declarations. One ARM7 constructor hides offsets, span alignment, decoder completeness, and policy selection. |
| `lib/src/analysis/functions.rs` | Store context in `Function`; share semantic instruction handling between ARM9 legacy parse and bounded observations. Every nested parser, register defs/uses, and diagnostic formatter uses context flags. Completion remains separate from requested span. |
| `function_start.rs`, `illegal_code.rs`, `jump_table.rs` | Receive explicit flags where they currently parse V5TE. Enable ARM9-specific compiler heuristics only in legacy semantics. Derived jump-table targets use the declared address context. |
| `lib/src/config/module.rs` | Explicit ARM9 legacy context at every Function construction, including secure/startup SWI, DS Protect, imported functions, exception/constructor/main paths. Keep ARM7 out of Config and Module analysis. |
| `cli/src/config/program.rs` | Allocate one legacy ARM9 scope per load and pass it into modules. This is an API migration, not new ARM7 Config support. |
| `cli/src/analysis/functions.rs`, `signature.rs` | Replace independent V5TE construction with a stored-context FunctionCursor. Keep raw unarm Parser private because mode/address/endian/flags are public. Assembly formatting can set UAL only. Relocation-aware signature generation remains in its existing ARM9 module path. |
| ARM7 inspection caller, new or existing planning command | Select checked module, explicit instruction mode, and exact initialized span. Write observation report. No symbol/relocation/link mutations. |

The dominant path is checked `Arm7ModuleInput` → `AnalysisSpan::arm7` → `Function::analyze_span` → observation report. The existing ARM9 path remains Config/Module → `Function::parse_function` → stored Function → source-bound parser → assembly/signatures. The new input module owns one set of bounds and context decisions. It does not split load/validate/transform into separate modules.

Graph discovery used `ds-decomp-t10-pin` searches for Function/options/parse/parse-loop and inbound traces for `parse_function` and `parser`. The graph traced import functions, constructor/main analysis, exception analysis, and ELF/signature commands into `parse_function`; constructor/main tail searches consume `parser`. Source inspection at exact `bee60e2` found context reconstruction in `functions.rs:591`, defs/uses at `:962` and `:1132`, the plain-B legacy gate at `:934`, CLI assembly at `cli/src/analysis/functions.rs:35`, and signatures at `cli/src/analysis/signature.rs:79`.

Some graph snippets use old source line metadata and returned unrelated neighboring text. Their locations were treated as discovery, then exact worktree source was read directly. `arm7_modules.rs` is new and unindexed, as allowed by the grounding instructions. No historical rationale beyond the supplied grounding is asserted. The reason for retaining ARM9 legacy behavior is the task constraint; the reason for a separate checked ARM7 input is evidenced by current ARM9-only Module/Config metadata and different physical ownership.

## Phase record

- Ground: supplied traced model read, graph discovery and exact-source signatures checked.
- Sketch: usage, types, module ownership, rationale and verification contracts written.
- Agree: parent synthesis pending; no human checkpoint requested.
- Implement: out of scope for this candidate.
- Scrap: not triggered. Shared storage refactor is broad, but its interfaces are feasible.
