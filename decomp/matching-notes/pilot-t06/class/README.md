# CommonEffect destructor-entry experiment

The preferred candidate is `common_effect_destroy_bridge.cpp`. Pinned
Metrowerks `2.0/base` with `-O2` emits one ARM function named
`func_0206d010`, 20 bytes long, and one call relocation at offset 8 to
`func_02015ed8` with addend -8. It emits no other allocated sections,
out-of-line member definitions, vtables or generated destructor variants.
The existing complete-TU object gate passes against the unmodified reference.

The source models the observed destructor-entry ABI through an explicit inline
member and a C linkage entry. It does not declare a recovered native virtual
class or establish the base's ownership contracts. Only the 20-byte entry is a
promotion candidate. The other six published CommonEffect targets remain exact
fallback. This experiment earns zero canonical source credit until the complete
fresh-ROM verifier and root review pass.

The layout assertions precede the actual source experiment. They enforce
32-bit pointers and words, 16-bit halfwords, an object span of `0x84`, a vptr word
at offset zero, and the observed halfword at `+0x80`. Bytes `+4..+0x7f` and
`+0x82..+0x83` remain opaque. The last two bytes are not asserted to be padding.
The public synthetic virtual-class probe also checks the derived member offset.
Changing its expected offset to `0x7c` fails compilation and produces no object.

## Compiler and TU evidence

`shape.cpp` is a public synthetic constructor/destructor probe. Under compiler
defaults it produces ten separate allocated `.text` sections and three
allocated `.data` sections, including RTTI. With `-O2 -RTTI off -inline off`,
it still produces ten `.text` sections and one `.data` section. Derived D1/D2
variants are each 20 bytes and D0 is 28 bytes in that context. C1/C2 constructor
variants and all generated definitions remain present. The production gate
rejects both objects for duplicate allocated section names. No sections or
helpers were flattened or discarded.

`single_member.cpp` proves a one-function nonvirtual ABI method can avoid those
additional definitions. Compiler defaults produce 24 bytes; `-O2` produces 20.
The selected optimizer context applies only to this entry. It does not identify
the game's original compiler version.

The alternate `common_effect_destroy.cpp` emits the mangled name
`_ZN15CommonEffectAbi7DestroyEv`. Its raw object fails the original-name gate.
An explicit private metadata binding was tested separately: all 17 re-delinked
reference objects retain identical allocated payloads, symbol addresses, modes
and extents, and 87,493 relocation records. Only the vtable reference at
`0x0209e114` changes its symbol name. This alternate binding is unnecessary for
the preferred bridge and was not applied to canonical metadata.

The bridge was independently linked in a private class-only build. Original
`dsd check modules -f` and `dsd check symbols -f` pass, all 17 module payloads
equal the earlier verified baseline, and the independent checker validates all
87,493 original relocation destinations with zero failed or unresolved slots.
The raw compiler object remains unchanged. This is a module/link experiment,
not the canonical fresh full-ROM promotion pipeline. Combining it with the
runtime target's earlier main split needs the separately reported cross-object
branch-target normalization fix.

## Reproduce

Tool binaries and game/reference objects are private inputs and are never
committed. `reproduce.py` checks the compiler, runner and three DLL hashes
against `decomp/toolchain.lock.json`, clears ambient MW compiler variables,
requires a fresh output directory, and records commands, exit statuses,
source/object hashes, every allocated physical section, symbol definitions and
relocations. The inventory retains physical section indices when names repeat.

Run the public shape probes with explicit locally installed tools:

```sh
python3 decomp/matching-notes/pilot-t06/class/reproduce.py \
  --compiler "$JUS_CLASS_MWCC" --runner "$JUS_CLASS_WIBO" \
  --output build/class-probes-fresh
```

For the reference trials, create private copies of a previously verified config.
Point `rom_config` and module input paths at that verified baseline. Append a
complete 20-byte TU covering `0x0206d010..0x0206d024` under object identity
`src/main/common_effect_destroy.o`, then run pinned `dsd delink -M` for all
modules. Preserve that original-name reference directory. In a second private
copy, replace exactly the main-module `func_0206d010` function name with
`_ZN15CommonEffectAbi7DestroyEv`, preserving its ARM mode, address and size;
re-delink all modules. These reference directories are distinct private inputs:

```sh
python3 decomp/matching-notes/pilot-t06/class/reproduce.py \
  --compiler "$JUS_CLASS_MWCC" --runner "$JUS_CLASS_WIBO" \
  --output build/class-reference-trials-fresh \
  --reference-dir "$JUS_CLASS_REFERENCE_DIR" \
  --bound-reference-dir "$JUS_CLASS_BOUND_REFERENCE_DIR"

JUS_CLASS_MWCC="$JUS_CLASS_MWCC" JUS_CLASS_WIBO="$JUS_CLASS_WIBO" \
JUS_CLASS_REFERENCE_DIR="$JUS_CLASS_REFERENCE_DIR" \
JUS_CLASS_BOUND_REFERENCE_DIR="$JUS_CLASS_BOUND_REFERENCE_DIR" \
python3 -m unittest discover -s tests/matching -p test_class_pilot.py
```

The trials reject the unbound mangled identity, the 24-byte default build, and a
changed call destination. Rejected builds accept zero units and publish no
source object overrides. The changed-callee object hash differs while the
reference hash remains unchanged. Both the privately bound member and the
original-name bridge pass complete object checks. The latter requires no
symbol rename.

`candidate_context.json` describes the proposed canonical source path and
complete-TU declaration for root integration. It is an experiment record, not
the canonical source manifest. `evidence.json` contains public metadata only.
Remaining work includes the other six targets, a recovered virtual-class TU
strategy, base member types and ownership, combined-pipeline verification and
the T07 runtime checks.
