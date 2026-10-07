# Separate bounded ARM7 observation analyzer

## Problem

ARM9 discovery embeds startup conventions, V5TE parsing and an address guard incompatible with ARM7 autoload0. The checked ARM7 input already supplies immutable bytes, full program/CPU/region identity and complete explicit-mode V4T decoding. Extending ARM9's Function output would give the eight-byte ARM7 sample spans unsupported function and extent meaning.

## Usage (caller's view)

The three examples in `01-usage.md` precede and define `02-shape.rs.txt`. Call `observe(input, selection, context)` and consume immutable instruction/transfer observations. The caller supplies the facts the analyzer cannot invent: selected span/mode, same-program mappings and any independently evidenced executable or exchange facts.

## Shape

Add `lib/src/analysis/arm7_observation.rs` and its export in `analysis/mod.rs`. Keep checked ownership and full-span decoding in `rom/arm7_modules.rs`; keep control-transfer interpretation, identity checks, address classification, mode reconciliation and declaration validation together in the new analysis module. Existing ARM9 Function, Module, Config and CLI paths stay untouched. The longest call chain is caller, observation analyzer, checked input decoder.

This is a deep operation per boundary-discipline. It replaces caller work involving branch arithmetic, complete instruction boundaries, mapping and BSS distinctions, mode constraints, identity scoping and conditional transfer semantics. It does not merely rename decode_span. Rich result variants carry uncertainty without returning unarm's wire representation. Selection establishes decoding only; independent declarations establish claimed executability. Per single-source-of-truth, the analyzer derives identity and V4T from Arm7ModuleInput and never accepts caller flags.

## Synthesis decision

Candidate for the orchestrator to compare. No winning candidate is claimed here.

## Tradeoffs accepted

- We accept a separate ARM7 observation type in exchange for leaving ARM9 function discovery and output compatibility intact.
- We accept explicit exchange evidence in exchange for useful known-mode exchange reporting without inventing a symbolic executor or assuming observed values hold globally.
- We accept bounded syntactic transfer coverage in exchange for honest output before function discovery and source reconstruction have evidence.

## Alternatives considered

Thread target policy through the existing Function parser. This centralizes ISA eventually, but retains function-extent and ARM9 startup assumptions and requires an audit of every reconstructed parser and helper. It exposes too many discovery decisions for this first deliverable.

Return decode_span tuples directly. This hides decoding, but makes every caller reproduce identity checks, branch semantics, address ownership and mode reconciliation. It loses on interface depth.

## Open questions and risks

Can later execution evidence establish enough indirect targets and executable spans to justify a separate reachability analysis? Can a later checked-view extension retain the validated header entry before entrypoint-driven discovery begins? Neither answer blocks these observations.

## Next implementation step

Implement one library observation operation with complete decode, direct B/BL classification, honest fallthrough/indirect reporting, optional scoped BX facts and the acceptance fixtures in `04-validation.md`; defer ARM7 Function/Module/Config/source/link migration.
