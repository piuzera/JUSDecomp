# CommonEffect clone ABI entry

The ordinary C++ source for original ARM entry `func_0206cfc0` matches its entire
80-byte reference TU: 68 instruction bytes and a 12-byte relocated literal pool.
The pinned `2.0/base` package with `-O2` emits one allocated `.text` section,
the original function identity and all five original relocation identities.
No assembly, instruction words, symbol patching or generated-helper removal
is used.

The function allocates `0x84` bytes with `data_0209e040`, `data_0209dfc4` and
line word `0xa2`. These tag identities differ from the factory's tags. A null
allocation returns directly. Otherwise it calls `func_02015dd4(new, original)`,
ignores that call's result, installs `data_0209e114` at offset zero, copies the
original object's halfword at `+0x80` and returns the allocated pointer.
The source expresses this caller behavior without inferring ownership or the
base-copy function's original C++ return type.

`CommonEffectAbi` remains forward declared. A separately named
`CommonEffectCloneStorage` describes the observed ARM physical storage without
diverging from the constructor's or destructor's same-named definitions.
Assertions enforce 32-bit pointers, word/halfword widths, the `0x84` extent,
the vptr offset and the `+0x80` halfword offset. All other bytes remain opaque,
including the final two bytes. No shared header or production test knob is
introduced. This remains a physical ABI view, not a recovered native class.

Both tests failed before the source existed, then passed with the real compiler
and runner. Three canonical source-gate negatives reject the entire seven-unit
manifest with zero accepted units and zero linker overrides:

- A temporary source copy moves the halfword to `+0x7e`; its offset assertion
  fails and no object is emitted.
- A temporary source copy changes the base-copy callee to `func_02015d0c`;
  the extent remains 80 bytes but relocation identity comparison fails.
- The default compiler context emits 96 bytes and fails function extent checks.

Every negative preserves the original reference object hash. The accepted
production source has literal physical dimensions and no mutation macros.

The fresh canonical verifier for producer `87ec186` passes all 19 stages:
all 17 module payloads, addresses and BSS extents; both original DSD checks;
all 87,493 original relocation slots; actual source-input ownership and
freshness; and the entire 67,108,864-byte ROM round trip. The matching suite
passes all 216 tests with private pinned tools and reference fixtures enabled,
with zero skips. The rebuilt ROM retains SHA-256
`a9c9bf89e6d99548b7c87e822b217c3fb74ef25186535b06193a6fb73d0d6d27`.

[proof.json](proof.json) records metadata, hashes, relocation contracts and
negative results without private input paths or copyrighted payloads.
The candidate totals 304 verified source bytes: 260 instruction bytes and
44 literal bytes across seven functions. ARM7, embedded executables and
preserved assets receive no source credit. The initializer, configuration
method, native class model and runtime behavior remain outside this result.
