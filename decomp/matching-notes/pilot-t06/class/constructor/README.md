# CommonEffect constructor ABI entry

The ordinary C++ source for original ARM entry `func_0206ca4c` matches its entire
64-byte reference TU: 56 instruction bytes and an 8-byte relocated literal pool.
The pinned `2.0/base` package with `-O2` emits one allocated `.text` section, the
original function name and all four original relocation identities. No assembly,
instruction words, name patching or generated-helper removal is used.

This TU keeps `CommonEffectAbi` forward declared, consistent with the factory.
Its separately named `CommonEffectStorage` is a view of observed ARM physical
storage: a word at offset zero, a halfword at `0x80`, and opaque bytes elsewhere
within the observed `0x84` allocation. Compile-time assertions enforce those
offsets, sizes and 32-bit pointers. The last two bytes remain opaque; their
semantic role is unknown. This view does not add a native virtual-class model or
redefine the existing destructor's `CommonEffectAbi` definition.

The base constructor receives `self`, the unchanged incoming callback/address
token and a zero third word. The function then installs `data_0209e114`, clears
the halfword at `+0x80`, calls `func_0202f81c(self, data_020afc40[2])` and returns
the original `self`. Both callee results are ignored. The declarations express
that caller behavior; they do not establish the callees' original C++ return
types, ownership rules or the callback's full type.

The test was first run before the source existed and failed both assertions.
The implemented source passes both tests with the actual pinned compiler and
runner. Three real canonical source-gate negatives publish zero accepted units
and zero linker overrides across the six-unit manifest:

- Moving the observed halfword to `+0x7e` fails its compile-time offset assertion
  and emits no object.
- Replacing the base constructor with `func_02015d70` keeps the 64-byte extent but
  fails relocation identity comparison; the reference hash remains unchanged.
- The default compiler context emits 88 bytes and fails function extent checks.

The fresh canonical verifier for producer commit `18aa5ab` passes all 19 stages:
all 17 module payloads, addresses and BSS extents; both original DSD checks; all
87,493 original relocation slots; actual source-input ownership and freshness;
and the complete 67,108,864-byte ROM round trip. The rebuilt ROM retains original
SHA-256 `a9c9bf89e6d99548b7c87e822b217c3fb74ef25186535b06193a6fb73d0d6d27`.
The matching suite ran 210 tests successfully, with six unrelated private-tool
or fixture checks skipped in this worker environment.

[proof.json](proof.json) records hashes, exact relocation contracts, negative
results and stage statuses without private input paths or copyrighted payloads.
The candidate totals 224 verified source bytes: 192 instruction bytes and 32
literal bytes across six functions. ARM7, embedded executables and preserved
assets receive no source credit. The clone, initializer, configuration method,
native class model and runtime behavior remain outside this result.

## Reviewed cleanup and root reproduction

The worker report above records the original candidate. Producer `1a89d19`
removes its test-only `T06_UNKNOWN_BASE_BYTES` macro and uses literal physical
span `0x7c`. The rejection test mutates a temporary source copy to span `0x7a`
while retaining the production layout assertions. The [red test](layout-cleanup-red.log)
and [green test](layout-cleanup-green.log) demonstrate the mutation check.

The [fresh root report](root-canonical-report.json) passes all 19 stages and
exact whole-ROM comparison at the new source hash. The raw constructor object
hash remains unchanged. [Root negative trials](root-negative-trials.json)
reject the literal offset mutation, changed base callee, and default optimizer
context against the full six-unit manifest, each publishing zero overrides.
The original prototype's macro-based trial record remains historical.
