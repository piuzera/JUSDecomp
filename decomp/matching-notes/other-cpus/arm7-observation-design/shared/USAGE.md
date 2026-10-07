# Shared Function analyzer candidate

Design only, against tool `bee60e2ee89308616933a391c387928e2dfb5c07`. None of the proposed APIs below exists yet. The observed eight-byte spans are instruction observations, not asserted functions.

## Caller usage first

A checked ARM7 input and an explicit mode and span are enough to request observations. The bridge selects ARM7TDMI/V4T itself. A caller separately declares destination context, whose physical mappings do not establish executable status. A complete function is returned only if the shared analyzer actually establishes its required termination within the span; exhaustion returns an incomplete observation report.

### Checked ARM7 bounded span

```rust
// Arm7Layout::checked(...) and Arm7View::module_inputs() are existing APIs.
let modules: Vec<_> = checked_view.module_inputs().collect();
let startup = modules.iter()
    .find(|m| m.identity().region() == &Arm7RegionKind::Startup)
    .expect("checked startup");
let addresses = AddressContext::arm7_physical(&checked_view, &[])?;
let input = AnalysisSpan::arm7(
    startup, InstructionMode::Arm, 0x02380000..0x02380008, &addresses,
)?;
let report = Function::analyze_span(input, SpanOptions::observations())?;
assert_eq!(report.context().isa(), InstructionSet::ArmV4T);
report.write_json(&mut output)?;
// If a future grounded span produces a Function, storage/reparse stays scoped:
if let Some(function) = report.function() {
    let checked_source = AnalysisSource::arm7(startup);
    let parser = function.parser(&checked_source, Presentation { ual: false })?;
}
// report.completion() is explicit. Do not assert that this is a complete function.
```

`AddressContext::arm7_physical` copies only checked physical region identities and initialized/BSS ranges. Its second argument contains externally supplied executable declarations, if any. The example supplies none. No header entry is inferred from mutable `Arm7Layout` metadata: `Arm7View` currently does not expose its checked header entry.

### Existing ARM9 import in Module::import_functions

```rust
// This is the existing import loop, migrated to an explicit shared context.
// A caller creates one Arm9Scope per Program/config load and shares it across modules.
let source = AnalysisSource::arm9_config(arm9_scope, module_kind,
    base_address, code)?;
let analysis = AnalysisContext::arm9_legacy(source.identity())?;
let parse_result = Function::parse_function(FunctionParseOptions {
    name: symbol.name.clone(), start_address: symbol.addr,
    base_address, module_code: code,
    known_end_address: Some(symbol.addr + sym_function.size),
    module_start_address: base_address, module_end_address: end_address,
    existing_functions: None, dsprot_encrypted_ranges: &[],
    check_defs_uses: false,
    parse_options: ParseFunctionOptions { thumb: sym_function.mode.into_thumb() },
    analysis: &analysis, // proposed required field, explicitly ARM9/V5TE
});
```

This preserves the ARM9 heuristic entry/mode selection, known-size reporting, and legacy destination behavior. It does not route ARM7 through `Config`, `ModuleKind`, `find_sections_arm9`, constructor/main discovery, or DS Protect discovery. `Arm9Scope` identifies a loaded legacy analysis session; it makes no claim to a verified parent/NitroFS identity. The ARM7 constructor cannot produce that identity variant.

### Existing assembly and signature consumers

```rust
// FunctionExt::write_assembly and Signatures::from_function are real consumers.
// The migration makes them use a source bound to the stored Function identity.
let source = module.analysis_source();
function.write_assembly(&mut assembly, &symbols, &source, ual)?;
let signatures = Signatures::from_function(&function, &module, &symbol_maps)?;

// Inside each consumer, no independent V5TE Parser::new call remains:
let cursor = function.parser(&source, Presentation { ual })?;
// Signature internals use the same binding with Presentation { ual: false }.
```

The returned `FunctionCursor` keeps the raw unarm parser private. It permits checked forward seeks and stored data/code transitions, with no ISA, endian, or arbitrary mode setter. Consumers use actual decoded byte lengths, including four-byte Thumb BL.

ARM7 observation JSON uses `SpanAnalysis::write_json`, which includes identity, ISA, mode, the requested span, decoded instruction sizes, completion, and unresolved target reasons. Existing ARM9 assembly and signatures retain their established symbol/relocation path. ARM7 reports do not acquire symbols, original relocation provenance, linkage, or source-match credit from this common parser.
