# Initializer source-context audit

At repository base `691e578`, this read-only audit finds no justified new
compiler trial for original ARM `func_0206c244` (596 bytes). Direct static/global
`Flags` construction and ordinary native `new Flags(key, label)` were **not
tried** in the saved diagnostics. Static/global construction lacks original
storage/caller evidence; ordinary-new allocation failure policy and original
C++ constructor identity remain unproved. No compilation, source promotion,
canonical metadata change, or new success precondition follows. Source credit
remains seven functions / 304 bytes.

Graph discovery found the target but returned only 50 source lines and no
caller edges. Original ASM and pinned raw ELF/RELA records supplied the missing
evidence. The existing [contracts](common-effect-contracts/contracts.json)
record the private input paths and exact identities.

The 15 original reference objects contain five inbound target relocations:
two ARM PC24 calls and three Thumb THM_PC22 calls, all from overlay `.text`.
There is no ABS32 target reference. Their call addresses are `02155df4`,
`0215b6fc`, `02166a70`, `02167aa0`, and `0214d3f8`. The incoming `r0` values are
zero or object fields; the target stores that argument at `data_020afc40+4`.
See original ASM `_dsd_gap@main_5.s:163335–163344`,
`_dsd_gap@ov000_4.s:10559–10561,16965–16966`,
`_dsd_gap@ov001_5.s:40885–40886,42745–42746`, and
`_dsd_gap@ov006_5.s:825–828` under `decomp/asm/`.

Across those objects, 71 `.ctor` RELA records in 11 modules contain no target
reference. Main's four linked table words at `02092eb0..02092ebc` resolve to
`0208c5e4`, `0208d1f8`, `0208d20c`, and Thumb `0208d3fd`; see
`_dsd_gap@main_5.s:211148–211156`. This establishes recorded static references,
not an exhaustive dynamic caller set.

The target allocates 40 bytes through `func_0201a21c` at `0206c3f8`. Its original
outer null test is at `0206c3fc`, with the zero branch at `0206c400`. On the
nonzero path, that allocation is the receiver of `func_0202c4ac` at `0206c40c`.
The final manager call receives the allocation, including zero when that branch
skips construction. Replacing it with fixed static/global storage changes this
observed contract. See `_dsd_gap@main_5.s:163443–163472`.

| Saved matrix | Sources × contexts | Completed outputs |
| --- | ---: | ---: |
| `initializer/contexts.json` | 4 × 14 | 56 |
| `initializer-virtual-view/contexts.json` | 3 × 14 | 42 |
| `initializer-virtual-view/constructor-contexts.json` | 1 × 14 | 14 |
| `initializer-virtual-view/constructor-inline-contexts.json` | 1 × 4 | 4 |
| `initializer-member-bridge/contexts.json` | 1 × 3 | 3 |
| `initializer-external-constructor/contexts.json` | 1 × 2 | 2 |
| Total | 10 distinct hash-verified source files | 121 |

The 60-output view sweep comprises 42 resource-view outputs and 18 inline
physical-constructor outputs. Its constructor uses preallocation plus
placement new, not a global/static object or ordinary allocating new; see
[flags_constructor.cpp:147–149](initializer-virtual-view/flags_constructor.cpp#L147).
The later external native constructor also uses preallocation plus placement
new; see [external_constructor.cpp:137–148](initializer-external-constructor/external_constructor.cpp#L137).
Its two outputs remain rejected at 604 versus 596 bytes. Documented preliminary
inspections and aborted reports are separate from the 121 completed matrix
outputs. No saved source declares a static/global `Flags` object.

The allocator is a veneer (`0201a21c`) to `0201a228`. For size 40, the latter
selects `0201a6d8` when its owner byte `+0x414` enables the small pool, otherwise
`0201a418`, and returns the delegate's `r0`. It does not convert failure to null.
The heap search can reach `0201a454` with `r1=0`, then dereferences `[r1+0xc]`.
Small-pool growth calls `0201afa8` at `0201b0b4` and dereferences the result at
`0201b0bc`. See `_dsd_gap@main_5.s:44729–44758,44926–44933,45121–45156,45850–45853`.
These machine paths establish neither failure→NULL, a C++ throwing/nothrow
allocation policy, nor universal success. The caller's null guard alone does
not establish the callee's failure behavior.

`func_0202c4ac` consumes storage/key/optional label in `r0/r1/r2`, writes the
header and vptr, and returns storage in `r0`; see
`_dsd_gap@main_5.s:68444–68468`. This grounds a machine interface, not the
original C++ class name, complete class layout, or mangled constructor binding.
An unbound ordinary-new diagnostic is distinct from past placement trials,
but its allocation policy is not established here. The requested gate therefore
stops before proposing or compiling another source shape.

## Reproduce the read-only counts and pins

Run from the repository root with the private artifacts available. This creates
no files, disables Python bytecode writes, and performs no compilation. The
inventory digest hashes sorted `relative-path<TAB>file-SHA256<LF>` rows, binding
all 15 paths and contents. The linked artifact is the older private contract
reference; its initializer payload matches the pre-source target publication.

```sh
python3 - <<'PY'
import collections, hashlib, json, struct, sys
from pathlib import Path
sys.dont_write_bytecode = True
sys.path.insert(0, 'tools/scripts')
from native_link import Elf32
sha = lambda data: hashlib.sha256(data).hexdigest()
root = Path('/private/tmp/jus-track-a/build/verify-t04-t08-final-source/delinks')
objects = sorted(root.rglob('*.o'))
inventory = ''.join(f'{p.relative_to(root)}\t{sha(p.read_bytes())}\n' for p in objects)
assert len(objects) == 15
assert sha(inventory.encode()) == 'd7cc571d4b53dacca5657d9a0c6180464d81d744ea87c7076382f1db077473ee'
assert sha((root/'_dsd_gap@main_5.o').read_bytes()) == '248e6844754b8c07c9d8b037ca7c01600dfc7566ec61a168aab69c8d238696c3'
inbound, ctors = [], collections.Counter()
for path in objects:
    elf = Elf32(path.read_bytes())
    symbols = elf.symbols()
    for section in elf.sections:
        if section[1] != 4: continue
        input_name = elf.section_name(elf.sections[section[7]])  # RELA sh_info
        for offset, info, addend in struct.iter_unpack('<IIi', elf.content(section)):
            target = elf.symbol_name(symbols[info >> 8])
            if input_name == '.ctor':
                ctors[path.name] += 1
                assert target != 'func_0206c244'
            if target == 'func_0206c244':
                inbound.append((path.name, input_name, hex(offset), info & 255, addend))
assert len(inbound) == 5 and all(row[1] == '.text' for row in inbound)
assert collections.Counter(row[3:] for row in inbound) == {(1, -8): 2, (10, -4): 3}
assert (sum(ctors.values()), len(ctors)) == (71, 11)
base = Path('decomp/matching-notes/pilot-t06')
sources, outputs = {}, 0
for folder in ['initializer', 'initializer-virtual-view', 'initializer-member-bridge', 'initializer-external-constructor']:
    for path in (base/folder).glob('*contexts.json'):
        data = json.loads(path.read_text())
        outputs += len(data['sources']) * len(data['contexts'])
        for source in data['sources']:
            assert sha(Path(source['path']).read_bytes()) == source['sha256']
            sources[source['path']] = source['sha256']
assert (outputs, len(sources)) == (121, 10)
linked = Path('/private/tmp/jus-track-a/build/pilot-canonical-final/native-link/linked.elf')
assert sha(linked.read_bytes()) == '339e504eb878975e437e59b5e78f445d6a7561d45827b563b782fa07834c87f6'
elf = Elf32(linked.read_bytes())
symbols = {elf.symbol_name(s): s for s in elf.symbols()}
symbol = symbols['func_0206c244']; section = elf.sections[symbol[5]]
payload = elf.content(section)[symbol[1]-section[3]:symbol[1]-section[3]+symbol[2]]
assert symbol[2] == 596
assert sha(payload) == 'c11efb830d6e8467c37b044646381c6481bf35e05860b259dcdb792cb0dc396f'
section = elf.sections[symbols['.p__sinit_0208c5e4'][5]]
words = struct.unpack_from('<4I', elf.content(section), 0x02092eb0-section[3])
assert words == (0x0208c5e4, 0x0208d1f8, 0x0208d20c, 0x0208d3fd)
print({'objects': len(objects), 'inbound_calls': inbound, 'ctor_records': sum(ctors.values()),
       'ctor_modules': len(ctors), 'saved_outputs': outputs, 'hashed_sources': len(sources)})
PY
```
