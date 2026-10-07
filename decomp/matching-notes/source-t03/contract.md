# Source promotion contract

The source-enabled strict command requires all 17 stages. It preserves the
original 15 whole-module reference objects independently from the candidate
TU/gap split. Those references still provide every original relocation slot for
validation against the final native ELF.

`source_build.py` compiles each declared TU with its CPU flags and include
context. It records source, compiler, runner, reference, and raw object hashes.
Allocated section inventories, sizes, flags, function identities, extents, and
instruction modes must match the TU reference. Relocation section, offset, type,
target symbol, and signed addend must agree before instruction fields are masked.
Missing, additional, or unsupported relocations reject. Extra BSS and COMMON
definitions reject. The current compiler contract supports dsd-compatible ARM
RELA; native GNU REL objects remain unsupported.

`native_link.py` selects exact LCF inputs and replaces each selected TU reference
with its compiled object. Only the legacy ELF normalization applies to that
compiled object. It preserves allocated source bytes. Actual argv, input hashes,
and the lld map are recorded. Unused objects cannot enter the link through a
directory glob.

`source_accounting.py` checks that the map assigns the original TU's sections to
the selected compiled object at the exact address, size, and module. The original
TU reference must be absent from actual linker inputs. Raw, normalized, and linked
function identities and extents must agree. Equal-address overlays remain distinct.

All original module checks, direct ROM comparisons, symbol checks, and 87,493
relocation validations must pass. Source, tools, original references, generated
configuration, and output artifacts must stay accounted for through freshness.
Coverage receives credit only after every required stage succeeds. Failed builds
report zero credited bytes, even if compilation or some module checks succeeded.

Coverage unions intervals by module and section, so aliases earn credit once.
Instruction bytes and embedded literal bytes are separate. Standalone rodata,
initialized data, BSS, generated padding, binary fallback, and unknown scope are
reported separately. Function extents include literal pools and cannot supply an
instruction-byte denominator.

ARM7 and embedded executables remain unbuilt. Proprietary containers have not
been recursively classified. The full-project percentage remains unset.
Metrowerks build 114 is selected for this TU only; its tiny match does not identify
the compiler for other game or SDK objects.

The changed-call fixture replaces `data_020a0e18` with `data_020a0e1c` in the C
source. Compilation changes the raw object. The TU reference remains identical,
and verification rejects the changed relocation identity before masking or linking.
The restored source must pass the complete pipeline.
