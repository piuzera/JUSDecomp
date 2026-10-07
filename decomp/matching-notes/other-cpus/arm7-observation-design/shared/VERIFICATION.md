# Verification contracts

These are proposed red/green cases, not tests run or proofs obtained. Fixtures must be synthetic unless the two grounded spans are explicitly named. No real function extent is assumed.

| Case | Failure this catches | Required green result |
|---|---|---|
| Public output cursor | Raw unarm Parser lets a caller mutate ISA/endian after validation | Consumer gets a FunctionCursor with no flags/endian/ISA setter; forward seeks remain bounded and data/code transitions cannot select another ISA or instruction mode. |
| V5-only ARM instruction such as `clz r0, r0`, encoded `0xe16f0f10` in little endian | ARM7 intake or later reparse silently inherits V5TE | Checked ARM7 strict span rejects atomically as illegal under V4T. Synthetic ARM9 legacy function containing it still parses with V5TE where existing entry/termination rules allow. Test the stored Function parser and register semantics with explicit flags, not only intake. |
| Synthetic V4T plain B with computed destination `0x037f8468` | Old `0x01ff8000..0x03000000` gate rejects valid ARM7 address context | Same-program autoload0 checked initialized mapping yields `Unresolved { mapping: Initialized(Autoload(0)), reason: ExecutionUndeclared }`; no outside-program claim. An explicit evidence-bearing ARM executable declaration can produce `DeclaredExecutable`. The short real autoload0 span alone does not make this declaration. ARM9 legacy plain-B gate retains its previous behavior. |
| Same ARM7 bytes and runtime address in parent and NitroFS child | Flat address map or payload-only identity merges observations | Reports retain distinct full `ProgramIdentity`. Source binding rejects parent Function with child source and vice versa. The insertion boundary rejects mismatched program/CPU/region before indexing by address. |
| Thumb BL first halfword only, bytes `00 f0`, explicit span length two | Iterator exhaustion or raw high halfword claims valid decode | `AnalysisSpan::arm7` returns truncated/illegal decode error with no partial report. Complete synthetic pair `00 f0 00 f8` decodes as one four-byte Thumb BL and receives explicit destination classification. |
| Requested end immediately before a synthetic return | `known_end_address` changes reported extent but parser reads beyond it | Bounded candidate stops at decode limit, with no Function. Appending return bytes outside requested span does not change result. Enlarging the selected span to include a valid return permits a derived terminated candidate only if semantic rules succeed. |
| BSS or initialized data used as destination | Mapping conflated with execution | BSS remains unresolved; initialized mapping without code declaration remains unresolved. No parser reads BSS. A missing mode remains `ModeUnknown`; BX unknown registers remain explicit. |
| Literal load/pool or jump-table entry outside hard span | Semantic helper bypasses parser bounds | No read beyond the span; retain unresolved fact or stop candidate. It never borrows adjacent autoload bytes to finish the candidate. |
| Known eight-byte startup and autoload0 observations | New API fabricates function extents from ranges | Explicit Arm mode allows the already-grounded instruction spans; report records selected span and policy but no required Function/entry/section claim. Autoload1 requires explicit independently grounded selection and mode. |
| ARM9 golden output before/after migration | Shared policy refactor changes existing behavior | Existing ARM9 tests and representative assembly/signature snapshots remain identical. Include secure/SWI construction, exception/constructor/main parsing, known-size imports, DS Protect path, and tail-call parser consumers. |

## Red-flag screen

- Interface depth: one checked ARM7 constructor hides byte ownership, arithmetic, alignment, fixed ISA, complete instruction consumption, and destination identity. Callers expose only facts they actually know.
- Information leakage: no public ParseFlags or mutable TargetPolicy controls ISA. `Function`, helpers, defs/uses, output, and signatures derive flags from one stored context.
- Temporal decomposition: input owns its validation; Function owns completion and semantic facts. There is no public staged setup protocol.
- Pass-through methods: the legacy adapter contributes preservation policy; the ARM7 bridge contributes checked ownership and strict completeness. Neither is only a rename of `Parser::new`.
- Scope concern: `AnalysisIdentity` must remain local to observations and shared Function use until a separate design extends Module/Config/relocations. This candidate deliberately exposes the broad existing-consumer migration cost.
