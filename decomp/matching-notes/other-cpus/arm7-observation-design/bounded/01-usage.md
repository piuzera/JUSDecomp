# Bounded ARM7 observations

Candidate only, grounded at bee60e2ee89308616933a391c387928e2dfb5c07. No implementation or execution proof is supplied.

Analyze an explicitly selected instruction span. The result describes decoded instructions and potential transfers in those bytes. It never asserts an entrypoint, function, executable extent, reachability, function end, original relocation, original source coverage, or linkable module. Mapping and executable evidence are independent. The report preserves the checked input's full identity and fixed ARMv4T policy.

## Startup observation for the parent

```rust
use ds_decomp::analysis::arm7_observation::{observe, Selection, Context};
use ds_decomp::config::symbol::InstructionMode;

let inputs: Vec<_> = checked_parent.module_inputs().collect();
let report = observe(
    &inputs[0],
    Selection { span: 0x02380000..0x02380008, mode: InstructionMode::Arm },
    Context { modules: &inputs, executable: &[], exchanges: &[] },
)?;
write_observation(report); // instruction and transfer records, no Function conversion
```

The checked startup selection is eight bytes, not a function extent. A direct transfer to an external RAM address retains its numeric address and required mode, with unresolved byte ownership. A mapped destination carries initialized/BSS ownership separately from executable evidence. The same transfer classifier handles B and BL.

## Autoload0 inspection with explicit executable evidence

```rust
let inputs: Vec<_> = checked_parent.module_inputs().collect();
let report = observe(
    &inputs[1],
    Selection { span: 0x037f8468..0x037f8470, mode: InstructionMode::Arm },
    Context {
        modules: &inputs,
        executable: &reviewed_code_declarations,
        exchanges: &[],
    },
)?;
write_observation(report);
```

`reviewed_code_declarations` are independently evidenced declarations created by the caller for this checked program. Passing no declarations remains useful. No declaration is manufactured from the selected span or module's initialized range. The analyzer accepts the checked autoload address without the ARM9 hard-coded address guard. An outgoing B preserves ARM mode even if a declaration says its destination is Thumb; the report records the conflict instead of changing modes.

## Child-program exchange inspection

```rust
let inputs: Vec<_> = checked_child.module_inputs().collect();
let report = observe(
    &inputs[0],
    child_selection, // caller-supplied initialized span and explicit ARM/Thumb mode
    Context {
        modules: &inputs,
        executable: &child_code_declarations,
        exchanges: &child_observed_exchange_targets,
    },
)?;
write_observation(report);
```

An exchange fact names a BX instruction site, its source mode, its observed raw register value, full module identity, and evidence reference. The analyzer verifies that the site decodes as BX, derives target mode from bit 0, canonicalizes the destination according to ARMv4T, and records that the edge depends on the fact. It does not assume the observation holds for every execution. Without a fact, BX has an unresolved register target and unknown target mode. Parent facts or modules are rejected even when the child bytes are identical. Declaration of a Thumb destination alone never resolves an unknown BX register value.
