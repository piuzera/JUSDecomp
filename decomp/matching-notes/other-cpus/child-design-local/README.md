# Fresh child operation candidate

Design only, based on `4e81496`. Ground and sketch are complete. Agreement and
implementation belong to the parent architect run; scrap remains conditional on
implementation evidence. No production helper, pin, or approval is changed.

## Caller usage

The verifier requests one whole child operation. Callers cannot select internal
checks, import an old result, or inject a linked image. The examples are proposed
interfaces, not commands available today. Paths and native tool records come
from the current verifier invocation. Approval files are read and validated by
the helper, not trusted because a caller says they are approved.

```python
# tools/scripts/verify.py, inside the optional child stage action
operation = child_native_baseline.build_child(
    original=rom, output=output / 'child-arm9', root=root,
    build_id=report['build_id'], started_ns=report['started_ns'],
    native_tools=report['tools'], analyzer=child_analyzer,
    analyzer_approval=child_analyzer_approval,
    encoder=child_encoder, codec_approval=child_codec_approval,
)
return operation.report  # outer status passed; nested codec status preserved
```

```python
# tools/scripts/verify.py, after recording the child stage
report['child_arm9'] = child_stage_result
snapshot.update(operation.input_hashes)
# Freshness inventories every retained file below child-arm9 and checks it
# against the operation's captured artifact inventory before checkpointing.
roundtrip_rom(rom, output, regions, checkpoint, rebuilt_rom,
              arm7_operation=arm7_operation, child_operation=operation)
```

```python
# tools/scripts/rom_roundtrip.py, within the existing packing transaction
payload = child_operation.recheck(
    report['child_arm9'], build_dir, original, report['build_id'], report['started_ns'])
# Existing packer checks program/header bounds and shared occupied extents,
# then writes payload.data at payload.rom_offset before both ARM7 writes.
# _verify_build calls the same recheck again immediately before publication.
```

Without child selection the 19-stage parent path and optional 20-stage ARM7
path stay unchanged. Selecting child requires the existing ARM7 mode and adds
`child_arm9_native_roundtrip` after `arm7_native_baselines`, before `freshness`.
The source-enabled path has 19/20/21 stages for default/ARM7/child modes.
The corresponding reference-only path has 15/16/17 stages. Any selected
child mode missing its operation, report, stage, approval, or inventory fails.
The final stages remain `rom_roundtrip`, `rom_freshness`.

## Traced grounding and module map

Graph search in `JUSDecomp` for child/packer/verifier definitions returned zero
nodes, so grounding used exact current files. The governing contract is
[child-canonical-integration-contract.md](../child-canonical-integration-contract.md).

| Module | Existing ownership and proposed change |
| --- | --- |
| `verify.py` | `record_stage` accepts passed results; `verified_module_checkpoint` enforces stage order; `freshness` inventories actual files. Add one selected stage, separate analyzer/codec arguments, input snapshot union and child artifact inventory. Reuse `verify_link_record`; preserve canonical DSD pin. |
| New `child_native_baseline.py` | Own fresh child identity, strict analysis, native proof, encoding and immutable live authority as one operation. Calls existing checks directly. Own child ELF geometry because parent `direct_comparison` compares stored parent bytes. |
| `native_link.py` | Existing `main` normalizes reference objects, links with pinned LLVM, records argv and emits three images plus diagnostic ELF. No codec or approval knowledge. No change required. |
| `other_executables.py` | `verify_other_executables` checks actual FAT mapping and creates the selected row. `verify_extracted_arm9_modules` owns expanded comparison and the four-byte main pointer exception. No change required. |
| `relocation_check.py` | Existing `validate_relocations` reads original objects and canonical ELF. Helper checks child totals and module/type inventories. No fallback to source mode. |
| `child_rom_roundtrip.py` | `repack_child_arm9` receives fresh native paths, proves encoded and whole-child equality, and retains complete rebuilt child. Its temporary expanded/encoded files disappear; their input/output hashes and actual command remain in captured report. No API change required. |
| `rom_roundtrip.py` | Existing `_verify_build` checks current producer evidence before and after `rebuild_rom`. Add child live argument and shared occupied list for all writes; consume only child's compressed ARM9 range. |
| `arm7_native_baseline.py` | Existing `build_baselines` captures a live immutable report and rechecks before returning payloads. Reuse its ownership pattern, not its physical layout assumptions. No change required. |

The native path currently binds `link.map` only when source mode is enabled.
The child helper adds the missing reference-mode map argv/hash check locally.
The existing codec's `binary_roundtrip_verified` cannot be returned directly
from `record_stage`. The helper wraps it in an outer passed result after every
native and closure check succeeds.

The analyzer is independently approved SHA256
`3f18db59e173ca17e14d29755ac51ce36682896d4df5ca500abcd619f4fd52c1`.
Canonical DSD remains
`2225874387adb0a5b2b4c4912337786efd736aca93b9f92617c95abba61d04f5`.
Codec approval is separate and covers actual binary and all consumed source
context; the old codec build is not implicitly approved by this analyzer pin.
Existing ARM7 approval and all 16 source artifacts named by it stay byte-identical.

## Operation invariants

1. Refuse an existing or symlinked output directory. Validate original parent
   hash and inventory, exact child path `ChildRom/JSS2Child.srl`, file ID 79,
   FAT `[0x23b800,0x4464c8)` and full child hash. Choose the full identity plus
   ARM9 from fresh `verify_other_executables`, never the first ARM9 in a ledger.
2. Extract child to a contained fresh file; bind its bytes to the parent slice.
   Run approved analyzer `rom extract`, strict `init`, `delink`, and `lcf`.
   Record actual argv/cwd/status/logs. Correct only the single expected generated
   `delinks_path` field and retain before/after bytes and hashes. Strict missing
   call errors remain enabled.
3. Run existing native linker with verified clang/lld and reference objects only.
   Require exactly the three original gap objects with raw hashes from
   `child-arm9-native-baseline.json`. Recheck native inputs, normalized objects,
   attributes, LCF, script, actual selected argv, map and canonical ELF. Require
   `-Map` to name the captured actual map even in this reference-only path.
4. DSD checks consume emitted images and diagnostic `dsd-check.elf`. Independent
   geometry checks use canonical `linked.elf`: ARM9 base `0x02000000`, initialized
   2,624,320, BSS 105,760; ITCM base `0x01ff8000`, initialized 3,968, BSS 0; DTCM
   base `0x027c0000`, initialized 96, BSS 32. Require exact section set, initialized
   prefixes, symbol boundaries and emitted metadata. Reuse expanded comparison
   for all three. ELF entry `0x02000000` is separate from ROM entry `0x02000850`.
5. Read original unnormalized objects and canonical ELF for all 35,092 relocations.
   Types 1/2/10 must be 10,755/20,440/3,897; ARM9/ITCM/DTCM totals must be
   34,992/78/22. Failed and unresolved are zero. Diagnostic ELF and normalized
   objects never substitute as authorities.
6. Invoke unchanged codec packer using exact fresh row and three actual native
   images. Require exact stored ARM9 and whole-child equality. Reread retained
   output, check contract size/hash, then capture immutable output expectations.
   Source bytes/functions remain zero; global percentage remains unknown; T10 open.

Each recheck first compares the supplied report to the capture before opening
any artifact. It verifies full input/tool/source closure, build identity, current
program mapping, actual commands, reference objects, ELF geometry, original
relocations and rebuilt child. Captured expectations are never refreshed from
current mutable files. Every retained file is present, contained, nonsymlinked,
fresh and hash-equal. Required-file inventory is exact, including extraction,
config before/after, symbols, sections, relocations, delinks, LCF, native inputs,
map/logs, both ELFs, emitted metadata/images and rebuilt child. Copied images for
DSD checks must equal canonical emitted images. Input closure includes original
ROM, inventory, baseline pin documents, approvals, tool binaries, interpreter and
all executed Python source/dependency files, and complete approved analyzer and
codec source inputs. Recheck the same closure immediately before publication.

Packing derives local ARM9 `[0x4000,0x1e1874)` from checked header and FAT;
only parent `[0x23f800,0x41d074)` is written. Independent child ARM7 writes parent
`[0x41d200,0x4458b0)`. One occupied list includes all 17 parent ARM9 writes, the child ARM9 write,
and both ARM7 writes. Validate all 20 extents before applying any bytes. Reject duplicate, overlapping, header-crossing or out-of-program
ranges. Preserve the 396-byte gap and all original child metadata and assets.
Check whole child after both writes; retain existing whole parent proof.
Never replace the complete child and then overlap it with an ARM7 write.
