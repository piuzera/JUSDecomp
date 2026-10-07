# Bounded initializer source experiment

`func_0206c244` is a published 596-byte ARM target. Four saved ordinary C++
source shapes and 14 pinned compiler contexts produced 56 compiler outputs.
None passed the complete reference-object gate. This experiment adds zero
source credit and does not activate a canonical TU.

[report.json](report.json) records every trial, source and object hash, compiler
command, CPU and ABI context, dependency policy, allocated section inventory,
function extent, relocation identity, and masked mismatch position. It contains
metadata only. The original ROM, reference object, and compiled objects remain
in ignored private build directories.

## Source and ABI scope

The [target publication](../targets.json) predates this source attempt. The
[contract evidence](../common-effect-contracts/README.md) describes the original
code, fields, callers, and unresolved signatures. This candidate uses physical
records with offset-named fields. It preserves the four-entry loop, original
external table and string identities, original constructor calls, allocation
failure paths, and both observed vptr stores on the 40-byte flags record.
It adds no ownership model, class hierarchy, safe-null behavior, assembly,
instruction words, or binary array.

The initializer's `void` return is an experimental caller interface. The known
callers do not consume its return register, but that does not establish the
original C++ return type. Virtual dispatch uses an erased variadic slot and
passes the receiver plus explicitly observed values. It does not establish the
full callee signature. A call with no new second argument may still expose
prior argument-register values. Callback addresses pass as 32-bit words.
Their declaration-only symbols bind addresses and are never invoked through an
invented callback signature in this TU.

The candidate's declared constructor return for `func_0202c4ac` follows the
observed final `r0=self` in that target. Other fields and ownership remain
unknown. The inline virtual-dispatch helper in the final shape changes no
observed arguments. All four shapes are experiments, not accepted source.

## Test-first evidence

Four tests first failed because the candidate was absent. After implementation,
all four passed with the actual pinned compiler and runner. Three actual-tool
negatives prove these constraints:

- Adding four bytes to the record stride fails its physical layout guard.
- Changing the archive-name table symbol fails relocation-identity comparison.
- Changing the context-push function symbol fails relocation-identity comparison.

The destination mutants preserve the comparison object's hash and cannot pass
because they happen to use the same instruction shape. The mutated layout
produces no accepted object. The candidate also checks pointer width, word
width, global handle and manager offsets, resource field offset, object tag and
child offsets, flags extent, and the final flags-word offset.

## Saved source shapes

| File | Change within the same physical-record approach | `-O2` extent | Masked byte differences |
| --- | --- | ---: | ---: |
| [for_loop.cpp](for_loop.cpp) | Initial four-entry `for` loop | 600 | 404 |
| [do_while.cpp](do_while.cpp) | Bottom-tested fixed four-entry loop | 596 | 10 |
| [locals.cpp](locals.cpp) | Declare resource before selector; name the existing label and key addresses | 596 | 3 |
| [common_effect_init.cpp](common_effect_init.cpp) | Inline dispatch helper and grounded constructor result declaration | 596 | 3 |

The bottom-tested loop removes the initial branch introduced by the `for` loop.
The local declarations change register allocation without changing the field,
table, or call identities. No object or instruction patch follows compilation.

## Contexts and measured result

The compiler is archive package `2.0/base`, reporting version 3.0 build 114.
Its executable, three runtime DLLs, and Wibo runner match
`decomp/toolchain.lock.json`. CPU is `arm946e`. Every context uses
`-Cpp_exceptions off -nostdinc`, with no includes or headers. The dependency
policy is explicitly header-free. The sanitized compiler environment removes
inherited `MWC*` and `MWARM*` variables.

The optimization contexts are default, `-O1`, `-O2`, `-O2,p`, `-O3,p`, `-O4,p`,
and `-O4,s`, each with default interworking settings and with `-interworking`.
All flags and source hashes are saved in [contexts.json](contexts.json).
The initial runner preflight used a noncanonical explanatory ABI-settings
string and rejected all 56 requests before compilation. The corrected run
produced and inventoried all 56 actual outputs. Both results are accounted for
in the report.

| Strict object failure | Trials |
| --- | ---: |
| Relocation identities, offsets, types, symbols, or addends | 38 |
| Function identities, extents, or modes | 14 |
| Initialized section bytes | 4 |
| Exact object | 0 |

42 outputs have the correct 596-byte extent. The best local and helper shapes
at `-O2` and higher differ at masked TU byte offsets `0x66`, `0x1c1`, and
`0x1c5`. The corresponding original instruction addresses are `0206c2a8`,
`0206c404`, and `0206c408`.

The resource-vptr load uses register `r9`; the original load uses the still-live
return register `r0`. The constructor's argument-load order also differs. Its
literal-pool identities at offsets `0x244` and `0x248` are swapped:

| TU offset | Original destination | Candidate destination |
| --- | --- | --- |
| `0x244` | `data_0209e26c` | `data_0209e280` |
| `0x248` | `data_0209e280` | `data_0209e26c` |

All 31 original relocation destination identities remain present in these best
objects, but their placement is not exact. Both intermediate and final vptr
stores survive ordinary compilation without `volatile` or invented inheritance.
Four `-O1` local/helper trials have the exact relocation inventory but differ at
126 masked byte positions. Matching symbol sets, extent, and control-flow shape
therefore provide no source credit.

The bounded sweep stopped at the complete-object gate. There was no source
object eligible for linking, so no link or full 19-stage ROM candidate run was
performed. The original initializer's C++ call-lowering context and complete
virtual signatures remain unresolved. Further work requires a separately
bounded source-context investigation; this report does not infer a compiler or
original class type from the near miss.

## Reproduction

The reference is a complete dsd TU with the original function and its literal
pool. A disposable copy of an existing verified config contains this additional
entry in its main `delinks.txt`:

```text
src/main/common_effect_init.cpp:
    complete
    .text start:0x0206c244 end:0x0206c498
```

Its `rom_config` points to the existing verified extraction. This avoids ROM
re-extraction and does not mutate canonical metadata. Generate the reference
with the pinned dsd:

```bash
/path/to/dsd-macos-arm64 delink -c /private/disposable/config/config.yaml --main
```

`contexts.json` pins the resulting complete reference object's SHA256. From the
repository root, compile all saved source and context pairs into a fresh private
directory:

```bash
python3 decomp/matching-notes/pilot-t06/initializer/reproduce.py \
  --compiler /path/to/mwccarm/2.0/base/mwccarm.exe \
  --runner /path/to/wibo-macos \
  --reference-dir /private/disposable/delinks \
  --output build/initializer-reproduced
```

Run the actual layout and destination negatives with the same pinned tools:

```bash
JUS_INIT_MWCC=/path/to/mwccarm/2.0/base/mwccarm.exe \
JUS_INIT_WIBO=/path/to/wibo-macos \
python3 -m unittest discover -s tests/matching -p test_common_effect_initializer.py -v
```

The existing strict source-object gate compares the full allocated section
inventory, declared function identity and extent, every relocation identity,
and initialized bytes. The runner does not discard allocated sections or modify
compiler output. Source, tool, runtime, and reference pins are checked before
and after the actual sweep.
