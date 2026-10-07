# CommonEffect initializer and virtual-method contracts

These notes describe `func_0206c244` and `func_0206ca8c` from the original
program. Both remain reference inputs. This research adds zero source credit.
Research began at the 104-byte source checkpoint, comprising 72 game bytes
and 32 SDK bytes. See the [current source checkpoint](../README.md#current-verified-source-coverage)
for later promotions. The private ELF inspected here is an earlier
76-byte checkpoint. Its two researched function bodies match the hashes in the
[pre-source target publication](../targets.json).

[contracts.json](contracts.json) contains every original RELA slot, every
observed virtual call with receiver and slot, all inbound target relocations,
and all 76 entries of the derived vtable with execution modes and parent values.
Addresses and symbol identities are metadata. These files contain no original
instruction payload, extracted object, ROM, or reconstructed source.

## Evidence and limits

The original repository pin is `6a061e3897f10a8800bf7ec9afde82fa8c9dbe1b`.
Original raw objects come from dsd 0.12.0. The inspected object and linked ELF
paths and SHA256 hashes are recorded in the JSON. Assembly evidence is in
`decomp/asm/_dsd_gap@main_5.s`, between each exact function label and its
`arm_func_end`. Function extents include literal pools.

MCP graph discovery returned these functions but truncated their source after
50 lines. The graph had no call edges for them. Bounded assembly reads and ELF
parsing supplied the missing bodies, calls, relocations, and vtable entries.

| Symbol | Mode | Extent | Instructions | Pool | Final payload SHA256 |
| --- | --- | ---: | ---: | ---: | --- |
| `func_0206c244` | ARM | 596 | 532 | 64 | `c11efb830d6e8467c37b044646381c6481bf35e05860b259dcdb792cb0dc396f` |
| `func_0206ca8c` | ARM | 1016 | 1004 | 12 | `c819f1db4782c70cf9b168e735dd7b795ccd02b83ed5c208051e6ab72aeeca13` |

The initializer has 17 direct-call relocation slots, 14 ABS32 pool references,
and seven virtual calls. Its two remaining pool words are integer constants.
The virtual method has 20 direct-call relocation slots, two ABS32 pool
references, 19 virtual calls, and one integer pool constant. All outgoing
relocations here use original PC24 type 1 with addend -8, or ABS32 type 2 with
addend 0. Incoming Thumb calls to the initializer use THM_PC22 type 10 with
addend -4. Relocation identities distinguish destinations even when their
current bytes or addresses coincide.

## Observed ABI

The initializer consumes incoming `r0`, stores it at `data_020afc40+4`, and
later conditionally passes it to `func_0206c514`. That helper unwraps its `+4`
field. It is an optional wrapper-like handle. The five known callers do not
consume the return register. A `void` caller interface is a candidate, not proof
of the original C++ return type. The final virtual call can leave a value in
`r0`.

The virtual method preserves incoming `r0` as `self` and incoming `r1` as a
numeric selector. It passes the selector to `func_02010adc(0, selector)`, whose
unsigned comparisons test registered numeric ranges. It returns the configured
object in `r0`. A nonzero byte at `data_020afc40+1` causes an early zero return.
No observation establishes semantic selector names or ownership.

Both routines save `r3` through `r11` and `lr`. The initializer uses the saved
`r3` stack slot for a word temporary. The virtual method also reserves `0x50`
bytes of locals. No additional incoming register or stack argument is proved.

The virtual-call records identify values explicitly prepared in `r1`.
"None explicitly prepared" means the routine did not prepare a new argument.
It does not prove the callee has no additional arguments. Existing values in
`r1`, `r2`, `r3`, or stack memory may still matter. Full signatures remain
unresolved unless callee evidence supplies them.

## Offset-named records

Within these notes, `global` is `data_020afc40`, `record` is one of the four
triples at `data_020afc4c`, and `related` is `[self+0x44]`. `created` is the
`+4` field of the lazily resolved lookup result. `configured` is the result of
created-object virtual slot `+0xb0`, falling back to `created` when that result
is zero. Dot-separated fields describe pointer dereferences, not embedded
subobjects.

| Base | Observed fields and access |
| --- | --- |
| `global` | Byte `+0` cleared during initialization. Byte `+1` guards the virtual method. Word `+4` holds the optional incoming handle. Word `+8` holds the constructed manager. |
| Four `record` entries | Stride 12. Word `+0` receives resource `+0x38`. Word `+4` receives an archive object. Word `+8` receives a constructed wrapper. |
| Resource from `func_02035e88` | Vptr `+0`. Word `+0x38` tested, then read again after virtual `+0x14` if zero. |
| Archive object | Word `+8` supplies the receiver of virtual `+0x50`. |
| Wrapper | Word `+4` supplies the contained virtual object. |
| Constructed wrapper's contained object | Word `+0x54` receives `0x31305053`. Word `+0x68` supplies another virtual receiver. |
| `self` in `func_0206ca8c` | Vptr `+0`. Word `+0x44` supplies `related`. Word `+0x50` supplies the coordinate component through helpers. Word `+0x64` supplies a component. Byte `+0x78` selects a configuration path. Halfword `+0x80` supplies flags. |
| `related` | Word `+0x3c` is masked with `0x7fffffff`. Word `+0x64` supplies a component whose byte `+0x48` is read. Word `+0x68` supplies another virtual object. |
| `created` and `configured` | Vptr `+0`. Words `+0x64` and `+0x68` supply virtual component receivers. |
| Coordinate component `[object+0x50]` | Words `+0x0c` and `+0x10` read by `02024d44` and `02024d54`, and written by `0206ca28`. |
| Component read by `02011990` | Unsigned halfword `+6`, shifted left 4 into an output word. |
| Component read by `0206ce84` | Unsigned halfword `+0x26`. Its calculation calls `0200d12c`. |
| The 40-byte flags allocation | Vptr `+0`. Words `+0x14`, `+0x18`, `+0x1c`, `+0x20` cleared. Word `+0x24` receives `0x80`. Constructor `0202c4ac` also initializes its header. |

These observations do not establish complete record extents, semantic types,
field ownership, or a source-language class hierarchy.

## Initializer sequence and dependencies

The initializer clears global byte `+0` and saves the incoming handle. It then
runs a four-iteration loop over `record`, the archive-name pointer table
`data_0209e050`, and the identifier table `data_020923b4`.

The archive names, in order, are `efc/comm_a.aar`, `efc/comm_b.aar`,
`efc/comm_c.aar`, and `efc/comm_g.aar`. Their existing symbol identities and
identifier values are in the JSON. These dependencies remain original data.

Each iteration performs this sequence:

1. Construct an archive object through `func_02010238()` and save it in
   `record+4`. This function ignores incoming `r0` and allocates 12 bytes.
2. Call `func_0201024c(archive, archive_name[i], 0)`.
3. Enter a context through `func_0206c498(func_0203b404()->field_88)`.
4. Resolve `func_02035e88(identifier[i])`. If its `+0x38` is zero, invoke
   virtual `+0x14`. Save its resulting `+0x38` in `record+0`.
5. Invoke `record.first.field_04` virtual `+0x50` with `r1=1`.
6. Call `func_02032a4c(record.first.field_04)`, then lazily resolve its result
   through `func_02011b38`. Save that wrapper in `record+8`.
7. Write `0x31305053` to the wrapper's contained object at `+0x54`.
8. Call `func_02023894(contained, identifier[i], 0)`.
9. Invoke contained `+0x68` virtual `+0xdc` without preparing a new `r1`.
10. Call `func_0206c4d4(wrapper, &word_80000)`.
11. Invoke contained virtual `+0xdc` with `-1`, then `+0x94` with `0x100`.
12. If the incoming global handle is nonzero, call
    `func_0206c514(wrapper, global.field_04)`.
13. Register `func_020107f4(func_02074540, identifier[i], 0x400, wrapper)`.
14. Leave context through `func_0206c54c()`.
15. Invoke archive `+8` virtual `+0x50`, then advance the record by 12.

After the loop it registers `func_02023cd0(0x20204e47, func_0206c57c)`.
It allocates 32 bytes with `func_0201a21c`, passing existing debug identities
`ALPropSetImp.h`, `Create`, and line `0x111`. On success it calls
`func_0202f8a4(pointer, 0)` and saves the result at global `+8`.

The second allocation is 40 bytes, with existing debug identities
`CommonEffect.cpp`, `CommonEffect_Init`, and line `0x67`. On success it calls
`func_0202c4ac(pointer, EffectFlags, the existing Japanese label)`, writes
intermediate vptr `data_0209e068`, initializes the fields listed above, and
writes final vptr `data_02099640`. The intermediate vptr write is part of the
observed sequence, even though another write follows it.

The final call invokes global manager virtual `+0x3c` with that allocation,
including zero on allocation failure. `func_0202f8a4` installs final vptr
`data_02095200`, whose `+0x3c` slot identifies `func_020300e0`. That target
saves register arguments for its variadic body. This evidence does not define
all arguments consumed by the call.

`func_0201a21c` is a veneer to `func_0201a228`; the latter consumes allocation
size from `r0`. The caller still prepares the debug arguments recorded above.
The context helpers push and restore `data_020a0dd0` through the index at
`data_02093c08` and storage at `data_020a16d0`.

## Virtual method sequence and callback identities

`func_0206ca8c` is derived vtable slot `+0x124`. It does not populate a callback
table. On the successful lookup path it obtains `created`, forwards the masked
related `+0x3c` through virtual `+0x94`, and searches through virtual `+0xb0`
using `0x31305053`. The search result, or `created` when zero, is `configured`.

Its self virtual `+0xb4` is `func_020161d8`, proved by the complete vtable.
That helper registers `func_020160f0` through
`func_0202788c(created, 1, callback, 0)` at `020161f4`, then calls
`func_020246c8(self, created)` at `02016200`. The callback literal is at
`02016208`. This is a transitive registration.

The method reads two signed coordinate words from self through `02024d44` and
`02024d54`, divides each by 4096 with truncation toward zero, and calls
`func_02023894(created, selector, 0)`. Halfword `self+0x80` controls these paths:

| Mask | Observed effect |
| --- | --- |
| `0x01` | When clear, a nonzero related component byte `+0x48` negates the first coordinate. |
| `0x02` | When clear, forward that byte to configured component virtual `+0x5c`. |
| `0x08` | Select coordinate offsets 128 and 96, and modify the component-derived value. |
| `0x10` | On the nonzero `self+0x78` path, register `func_0206ceac` through `func_02028384`. |

The `+0x78` byte selects another configuration path. Coordinate writes delegate
to `0206ca28`. The method forwards a component-derived value unless it equals
`0x80000`, and forwards `0206ce84`'s output unless it equals `0x1000`. It then
passes `-1` to created virtual `+0xdc`, adjusts a value read from related `+0x68`,
updates created `+0x68`, invokes configured virtual `+0xd8` with 1, restores the
context, and returns `configured`. The JSON gives all 19 virtual-call addresses,
receivers, slots, and explicitly prepared `r1` values.

The direct callback literal in this method is only `func_0206ceac`. The
initializer supplies `func_02074540` and factory `func_0206c57c` explicitly.
A historical research claim that `0206ca8c` installs twelve callbacks confuses
indirect method calls with callback registration. Concrete callback identities
beyond the direct and transitive evidence above remain unresolved.

## Vtable and callers

The derived table `data_0209e114` spans 304 bytes and contains 76 entries through
slot `+0x12c`. The JSON records all entries. Its parent table `data_0209c30c`
differs at exactly four slots:

| Slot | Derived original identity | Parent identity |
| --- | --- | --- |
| `0x00` | `func_0206d010` | `func_02015e54` |
| `0x04` | `func_0206cfa4` | `func_02015e88` |
| `0x18` | `func_0206cfc0` | `func_0204b0c8` |
| `0x124` | `func_0206ca8c` | `func_02015fb0` |

The JSON uses original identities, including `func_0206d010`; later canonical
aliases do not change its address. Slots `0x08` and `0x10` are Thumb. The other
74 are ARM. Table hashes match the target publication.

The original full-module object inventory contains five direct calls to the
initializer and one ABS32 reference to the virtual method, the vtable slot at
`0209e238`. It contains no direct call to the virtual method.

| Caller | Call address | Incoming `r0` evidence |
| --- | --- | --- |
| ov000 `func_ov000_02155cb4` | `02155df4` | Explicit zero |
| ov000 `func_ov000_0215b084` | `0215b6fc` | `[r10+4]` |
| ov001 `func_ov001_02166778` | `02166a70` | `[r5+0x34]` |
| ov001 `func_ov001_02167724` | `02167aa0` | `[r5+0x28]` |
| ov006 `func_ov006_0214cd20` | `0214d3f8` | A global object's `+4` |

Generic dispatch sites load virtual slot `+0x124` in several other objects.
For example, `0204b0ec` unwraps `+4`, forwards its existing `r1` to virtual
`+0x124`, and feeds the result to `02011b38`. Such sites are potential dispatch
paths. An equal slot offset does not prove their runtime vptr selects this
derived table. No complete dynamic caller set is established.

## Uninitialized-register path

The lookup-success invariant is unresolved. At `0206cacc` the method tests the
lookup result. Its zero branch at `0206cad4` reaches `0206cadc` without calling
`02011b38`. The conditional load at `0206cae0` writes `r4` only when `r0` is
nonzero. The next instruction at `0206cae4` tests `r4`, even on lookup failure.
The routine has not initialized `r4` on that path.

If `r4` is zero, the branch at `0206cae8` reaches `0206cb8c` without initializing
`r5`, `r6`, `r7`, or `r8`. Later paths read those registers. Under ordinary ARM
ABI, their saved incoming values are callee-preserved state, not additional
arguments. The observed code does not establish another convention.

Neither static callers nor existing research prove that every dispatch lookup
succeeds. There is no reconstructed source here, no added null return, and no
claim that the uncertain path is harmless. Full source semantics and ABI types
remain unresolved.

## Recheck against private inputs

From the repository root, this command checks target extents and hashes, counts,
and all recorded outgoing RELA identities against the pinned private inputs.
It reads the inputs and prints a result. The private paths are in the JSON and
must exist locally.

```bash
python3 - <<'PY'
import hashlib, json, struct, sys
from pathlib import Path
sys.path.insert(0, 'tools/scripts')
from native_link import Elf32
p = Path('decomp/matching-notes/pilot-t06/common-effect-contracts/contracts.json')
r = json.loads(p.read_text())
e = Elf32(Path(r['provenance']['linked_elf_private_path']).read_bytes())
sy = {e.symbol_name(s): s for s in e.symbols()}
o = Elf32(Path(r['provenance']['reference_object_private_path']).read_bytes())
os = o.symbols()
for name, f in r['functions'].items():
    s = sy[name]
    sec = e.sections[s[5]]
    b = e.content(sec)[s[1]-sec[3]:s[1]-sec[3]+s[2]]
    assert len(b) == f['extent_bytes']
    assert hashlib.sha256(b).hexdigest() == f['payload_sha256']
    ref = next(s for s in os if o.symbol_name(s) == name)
    base = int(f['address'], 16) - ref[1]
    actual = []
    for sec in o.sections:
        if sec[1] == 4 and sec[7] == ref[5]:
            for off, info, addend in struct.iter_unpack('<IIi', o.content(sec)):
                if ref[1] <= off < ref[1] + ref[2]:
                    actual.append({'address': f'0x{base+off:08x}', 'type': info & 255,
                                   'symbol': o.symbol_name(os[info >> 8]), 'addend': addend})
    assert actual == f['relocations']
assert len(r['vtable']['entries']) == 76
assert len(r['inbound_relocations']) == 6
print('Both target payloads and all 53 outgoing relocation records match.')
PY
```
