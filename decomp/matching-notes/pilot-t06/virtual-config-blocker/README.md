# Virtual object-configuration method: ordinary-source blocker

`func_0206ca8c` remains an exact reference input. This bounded attempt stops before source implementation: the observed failure paths consume incoming saved-register values that the established ordinary entry does not supply. There are zero source candidates, compiler trials, or source-credit bytes. Canonical production coverage stays at 304 bytes. Base: `6450c79933a987933e76a310a10930eda4802718`.

[evidence.json](evidence.json) pins the current canonical ELF, the current exact original reference TU, eight relevant function bodies, all 22 target relocations and their actual linked destinations/modes, all 19 virtual calls, the prepared direct-call register values, observed fields, and three initial data values. It supplements [the published contracts](../common-effect-contracts/README.md), whose table and caller evidence remain authoritative. Graph discovery found the target, but the snippet stopped at 50 lines and the graph had no call edges. Bounded original ASM and raw ELF supplied the remaining evidence.

## Interface and physical-view decision

The minimally observed entry preserves the original symbol, takes opaque `self` in `r0` and a numeric selector in `r1`, and returns the configured object pointer in `r0`. The existing nonzero global-byte guard returns zero. There is no evidence for additional arguments or a special saved-register convention. This is a candidate physical interface, not recovery of the original C++ signature, inheritance, or ownership.

A successful-path candidate could use partial records for self's `+0x44`, `+0x50`, `+0x64`, byte `+0x78`, and halfword `+0x80`; related's `+0x3c`, `+0x64`, and `+0x68`; wrapper `+4`; and created/configured vptr and components `+0x64`/`+0x68`. The exact field list and 19 receiver/slot pairs are in the evidence. Declaration-only virtual views would require reserved slots and layout guards, without instantiated views, defined helper methods, RTTI/data, or fabricated source inheritance. They cannot solve the entry-state problem below.

A call without a newly prepared argument does not prove that the callee consumes no extra arguments. At the indirect calls `0206cc44`, `0206cc60`, and `0206ce50`, `r1` itself holds the selected code pointer. Full virtual-call signatures remain unknown. Direct helper calls that receive an output address in `r0` could reflect an explicit parameter or a source-language return convention; the register contract alone does not establish which.

The target is ARM, 1,016 bytes: 1,004 instruction bytes and 12 pool bytes. Its 20 PC24 records resolve to 16 ARM calls and four Thumb calls to `func_02011990`, at `0206cd58`, `0206cd88`, `0206cda0`, and `0206ce14`. The current linked transfers to those four Thumb destinations are BLX; their native ELF symbol values carry the Thumb low bit. The two ABS32 pool references remain `data_020afc40` and `func_0206ceac`. The third pool word supplies the original numeric search identity. No instruction or literal payload is included here.

## Concrete failure-path dependencies

| Original address | Observed effect |
| --- | --- |
| `0206cacc`–`0206cad4` | Zero lookup skips `func_02011b38` and joins at `0206cadc`. |
| `0206cae0` | Load into `r4` occurs only when returned `r0` is nonzero. |
| `0206cae4` | Tests `r4` even when that load was skipped. |
| `0206cae8` | Zero `r4` branches to `0206cb8c`, skipping all assignments to `r5`–`r8`. |
| `0206caec`–`0206cb00` | Nonzero saved incoming `r4` instead becomes the created receiver, despite zero lookup. |
| `0206cb98` | The common tail tests saved incoming `r5` when flag mask `0x01` is clear. |
| `0206cbb0` | The common tail dereferences saved incoming `r8` when flag mask `0x02` is clear. |
| `0206cbe4`, `0206cbe8` | The nonzero byte `self+0x78` path uses saved incoming `r7` and `r6` as coordinates; alternate paths also read them. |
| `0206cdf8` | Later tail code unconditionally uses `r4` as the created receiver. |
| `0206ce6c` | The normal context-restored return copies `r8` into `r0`. |

Three outcomes must be excluded or explained before that ordinary interface can cover all observed paths: lookup zero, lazy resolver zero, and a nonzero wrapper with zero `+4`. In the last case `r4` is explicitly assigned zero, but `r5`–`r8` still reach the tail without initialization.

`func_0203b404` and `func_0206c498` do not modify `r4`–`r8`. `func_02010adc` saves/restores all of them; `func_02011b38` saves/restores `r4`. Thus the earlier direct calls do not initialize the missing state. Conventional Arm call rules treat `r0`–`r3` as argument/scratch registers and require preservation of `r4`–`r8`, `r10`, and `r11`. This explains the observed preservation but does not identify the original compiler or exact historical PCS variant. See Arm's [core-register rules](https://github.com/ARM-software/abi-aa/blob/2025Q1/aapcs32/aapcs32.rst#611core-registers).

An ordinary two-argument C/C++ entry has no defined access to arbitrary incoming callee-saved values. Additional CPU-state arguments would change the established entry. Uninitialized source locals would introduce undefined source behavior rather than define this machine behavior. Zero initialization, a null return, or a success precondition would change or exclude an observed path. No such source is implemented, and this finding does not claim that a compiler could never happen to emit similar code from undefined source.

## Nullable helpers and limits of reachability evidence

`func_02010adc` scans unsigned registered numeric ranges. If they do not produce an object, it calls Thumb `func_02010644`. A zero search result produces the explicit zero return at `02010b74`/`02010b78`. The Thumb search tests its chain head at `02010706`/`02010708`; a zero head returns zero at `0201070c`. `func_02011b38` lazily invokes virtual `+0x14` when its field `+0x18` is zero, then returns that field at `02011b58`. It does not assert or test successful construction before returning.

The current original initial data contains:

| Field | Exact address | Width | Initial value |
| --- | --- | --- | --- |
| `data_020a1534 + 0x10`, range count | `020a1544` | 2 bytes | 0 |
| `data_020a1c34 + 0x1cc`, fallback chain head | `020a1e00` | 4 bytes | 0 |
| `data_020a0c34 + 0x2ec`, context-owner pointer | `020a0f20` | 4 bytes | 0 |

These are static initial values, not a captured runtime state. In particular, the context owner is also initially zero, and the method accesses it before lookup. Initial zero range/head values do not prove a live invocation at that time.

The authoritative original relocation inventory contains one inbound ABS32 reference to the target, derived vtable slot `data_0209e114+0x124` at `0209e238`, and no direct call. Generic `func_0204b0ec` unwraps incoming `r0+4`, forwards its existing `r1` through virtual slot `+0x124`, and leaves `r4`–`r8` untouched. Its dispatch does not prove that the live vptr selects this derived table or establishes a successful selector domain. No dynamic caller set, universal success invariant, or actual failing game execution is proved.

The next required evidence is a proven caller invariant excluding every problematic outcome, or a newly established actual entry convention that supplies the missing state. Keep the original method while that fact is unresolved. This bounded approach is finished.

## Recheck private artifacts

The following read-only check verifies function hashes/modes, exact reference relocation records, all linked destinations, initial data values, and the decisive conditional load/test/branch. It emits no original payload. Private paths are recorded in the evidence and must exist locally.

```sh
python3 - <<'PY'
import hashlib, json, struct, sys
from pathlib import Path
sys.path.insert(0, 'tools/scripts')
from native_link import Elf32
r = json.loads(Path('decomp/matching-notes/pilot-t06/virtual-config-blocker/evidence.json').read_text())
p = r['provenance']
paths = [('linked_elf_private_path', 'linked_elf_sha256'),
         ('target_reference_private_path', 'target_reference_sha256')]
for path, digest in paths:
    assert hashlib.sha256(Path(p[path]).read_bytes()).hexdigest() == p[digest]
e = Elf32(Path(p['linked_elf_private_path']).read_bytes())
symbols = {e.symbol_name(s): s for s in e.symbols()}
def read(address, width=4):
    sec = next(s for s in e.sections if s[1] == 1 and s[2] & 2 and s[3] <= address and address+width <= s[3]+s[5])
    return e.content(sec)[address-sec[3]:address-sec[3]+width]
def word(address): return int.from_bytes(read(address), 'little')
def branch(address):
    w = word(address)
    assert (w >> 25) & 7 == 5
    d = w & 0xffffff
    if d & 0x800000: d -= 0x1000000
    return address + 8 + (d << 2) + (((w >> 24) & 1) << 1 if w >> 28 == 15 else 0)
for name, f in r['functions'].items():
    s = symbols[name]
    assert (s[1] & ~1, s[2]) == (int(f['address'], 16), f['extent_bytes'])
    assert ('Thumb' if s[1] & 1 else 'ARM') == f['mode']
    assert hashlib.sha256(read(s[1] & ~1, s[2])).hexdigest() == f['payload_sha256']
o = Elf32(Path(p['target_reference_private_path']).read_bytes())
os = o.symbols()
f = next(s for s in os if o.symbol_name(s) == r['target']['identity'] and s[5])
base = int(r['functions'][r['target']['identity']]['address'], 16) - f[1]
actual = []
for sec in o.sections:
    if sec[1] == 4 and sec[7] == f[5]:
        for off, info, addend in struct.iter_unpack('<IIi', o.content(sec)):
            if f[1] <= off < f[1]+f[2]:
                actual.append({'address': f'0x{base+off:08x}', 'type': info & 255,
                               'symbol': o.symbol_name(os[info >> 8]), 'addend': addend})
assert actual == r['target']['relocations']
for rel in actual:
    address, target = int(rel['address'], 16), symbols[rel['symbol']][1]
    if rel['type'] == 1:
        assert branch(address) == target & ~1
        assert word(address) >> 28 == (15 if target & 1 else 14)
    else: assert word(address) == target + rel['addend']
for value in r['initial_scalars']:
    b = read(int(value['address'], 16), value['width_bytes'])
    assert int.from_bytes(b, 'little') == value['initial_value']
    assert hashlib.sha256(b).hexdigest() == value['field_bytes_sha256']
w = word(0x0206cae0)
assert (w >> 28, (w >> 26) & 3, (w >> 25) & 1, (w >> 20) & 1, (w >> 16) & 15, (w >> 12) & 15, w & 0xfff) == (1,1,0,1,0,4,4)
w = word(0x0206cae4)
assert (w >> 28, (w >> 25) & 1, (w >> 21) & 15, (w >> 16) & 15, w & 0xfff) == (14,1,10,4,0)
assert word(0x0206cae8) >> 28 == 0 and branch(0x0206cae8) == 0x0206cb8c
print('Eight hashes/modes, 22 reference and linked relocations, three initial fields, and decisive failure-path instructions match.')
PY
```

## Independent verification

Root runs the documented read-only check against the pinned original artifacts.
The independent reviewer also reads the complete bounded target/helper code,
the virtual-call records and inbound reference inventory.
[Root verification](root-verification.json) records the verified static
blocker and the unresolved live reachability and caller invariant. No source
candidate or compiler trial is introduced; canonical coverage stays 304 bytes.
