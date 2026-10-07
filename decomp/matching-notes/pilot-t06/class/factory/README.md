# Factory entry

`func_0206c57c` matches its complete 56-byte ARM9/main TU under pinned
Metrowerks `2.0/base` with `-O2`: 44 instruction bytes and a 12-byte literal
pool. It keeps the original C entry and all five relocation identities. Calls
at offsets 20 and 36 target `func_0201a21c` and `func_0206ca4c`; pool words at
44, 48 and 52 reference `data_0209e000`, `data_0209dfd0` and `func_02024a30`.
The compiler emits one function and one allocated `.text` section, with no
aliases, extra helpers, vtables, data or BSS.

The source is header-free. It forward-declares `CommonEffectAbi` and asserts
32-bit pointers and words, introducing no layout or competing class definition.
The allocation call preserves size `0x84`, both tag addresses and argument word
`0x95`. A zero allocation result returns without constructing. Otherwise the
constructor receives that pointer and the callback address token; the factory
returns the constructor's result. This models the observed register interface,
not a native allocation or lifetime policy.

This entry takes only the callback's address. Its opaque pointer declaration
agrees with the observed callback body's one-word input and allocated-pointer
result, but does not identify its original C++ types. The callback is not invoked
by this factory. The constructor's input address token remains unresolved as a
C++ callback type. Future constructor reconstruction must forward that incoming
`r1` token unchanged to `func_02015d0c` and supply zero in `r2`; it must not zero
`r1`.

Tests first rejected the missing source. One source body then passed the actual
compiler's complete-object checks. The default context emits 72 bytes and fails
the 56-byte extent contract. Changing the callback to `func_02024a68` retains
the 56-byte shape but fails relocation identity checks before masking. The
reference hash stays unchanged while the raw compiler object hash changes.
Both rejected trials accept zero units and publish no source overrides from
the five-unit candidate manifest. Public metadata is retained in `proof.json`.

At source commit `fcec3aa`, the fresh canonical verifier passes all 19 stages:
five raw source objects, actual linker inputs, both dsd checks, all 17 module
payloads and BSS layouts, every original relocation destination, ownership and
freshness, and exact whole-ROM reconstruction. All 87,493 relocation slots
validate with zero failed or unresolved. The rebuilt 67,108,864-byte ROM has
SHA-256 `a9c9bf89e6d99548b7c87e822b217c3fb74ef25186535b06193a6fb73d0d6d27`.

The candidate now credits 160 source bytes across five functions, separated
into 136 instruction bytes and 24 literal bytes. This factory adds 44
instruction bytes and 12 literal bytes. ARM7 and preserved assets receive no
source credit, and no global percentage is inferred. The matching suite passes
208 tests; six unrelated private-input checks are skipped. The two new factory
tests exercise the real compiler when `JUS_CLASS_MWCC` and `JUS_CLASS_WIBO` are
set. Reproduce the full proof with the normal `verify.py` CLI, this source
manifest, explicit pinned tools and a fresh output directory. Private reports,
objects and rebuilt ROM remain under ignored `build/verify-t06-factory`.

Measured work comprised two bounded compiler contexts, one source-body revision
and one fresh full-pipeline attempt. `proof.json` records the measured verifier
runtime; total human effort was not independently timed. Constructor, clone,
initializer and virtual object-configuration source remain fallback. Native
virtual-class ownership, base member types, callback C++ interfaces and T07
runtime checks remain unresolved. T06 is not complete.

Independent root reproduction at producer `4457e49` passes all 19 stages
and exact whole-ROM comparison. The [root report](root-canonical-report.json)
records five actual source inputs and 160 credited bytes; the
[root test log](root-tests.log) records 208 passing tests without skips.
Independent review also reruns both rejected five-unit compiler trials against
the actual original reference, with zero source overrides published.
