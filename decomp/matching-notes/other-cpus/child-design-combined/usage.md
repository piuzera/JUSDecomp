# Usage first

This candidate makes one live operation own the complete child program proof and all auxiliary executable writes. The existing paired ARM7 producer remains unchanged. All examples are proposed calls, not runnable implementations.

## Canonical verifier

```python
from native_program_baseline import build_programs

# Existing arm7_native_baselines stage has already produced arm7_operation.
programs = build_programs(
    original=rom, build=build_context, approvals=child_approvals,
    arm7=arm7_operation,
)
record_stage(report, "child_native_programs", lambda: programs.report)
# Fold programs.input_snapshot and programs.artifact_inventory into freshness.
checkpoint = verified_module_checkpoint(report, child_enabled=True, arm7_enabled=True)
roundtrip_rom(rom, output, regions, checkpoint, rebuilt_rom,
              program_operation=programs)
```

Child mode requires paired ARM7 mode. Selecting child mode without its analyzer and codec approvals fails before build work. The paired stage remains mandatory. The combined operation is created and recorded before freshness. Default source mode remains 19 stages, paired ARM7 remains 20, and child mode adds one mandatory stage to paired mode.

## Parent packer

```python
# Internal to rom_roundtrip.py, before changing bytes.
auxiliary = program_operation.recheck(current_build, original_bytes)
# Exactly child ARM9, parent ARM7, child ARM7, in that order.
validate_all_writes(parent_arm9_writes, auxiliary.writes)
apply_writes(rebuilt, auxiliary.writes)
auxiliary.verify_child(bytes(rebuilt))
# Immediately before exclusive publication, repeat provenance and freshness checks.
program_operation.recheck(current_build, original_bytes)
publish_verified_rom(rebuilt)
```

The packer chooses one auxiliary authority: the old ARM7 operation in paired-only mode or the combined operation in child mode. Passing both fails. Reports describe operations; they cannot instantiate them or supply payloads.

## Audit consumer

```python
report = programs.report
save_json(build_context.directory / "child-program-audit.json", report)
assert report["source_bytes"] == 0
assert report["source_functions"] == 0
assert report["t10_complete"] is False
# Loading this JSON later supports inspection only. Repacking requires a fresh build.
```
