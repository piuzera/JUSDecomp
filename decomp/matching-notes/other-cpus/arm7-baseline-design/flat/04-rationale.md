# Rationale

## Problem

Produce a native-tool opaque ARM7 preservation baseline without deriving code,
functions or relocations. Parent and exact NitroFS child have equal stored ARM7
images but distinct complete identities. Existing checked inputs establish
physical regions and ARMv4T; the ARM9 linker assumes ARMv5TE, ARM9 entry, 32-byte
placement and analyzed LCF modules. Current checked views lose validated entry,
header/image and parameter metadata. [Grounding](grounding.md) explains those
constraints; [usage](01-usage.md) was written before the type sketch.

## Shape

One `PinnedArm7Input::load` consumes the exact sidecar/selector and creates a
checked domain input. One `FlatArm7Baseline::build` owns fresh native tools,
artifact structure, reconstruction, verification and report publication.
The immutable envelope retains original image and physical authority at the
existing validation boundary; later mutable sidecars cannot become authority.
This follows boundary-discipline and single-source-of-truth rather than exposing
validate/create-object/link/extract/check methods to callers.

The ELF contains one opaque nonallocated/nonexecutable stored-image section.
It attests exact native-link input/output preservation. It does not pretend
its ELF section address describes startup/autoload runtime locations. The
report keeps original checked entry apart from ELF entry zero and explicitly
labels runtime placement as independently checked metadata. Hard-to-misuse
receipt and zero-coverage types keep that weaker scope visible.

Interface depth: two operations hide selector/hash checks, native object and
attribute construction, actual linker provenance, structural verification,
exact reconstruction, physical consistency and freshness. The caller supplies
only original inputs, tool pins and an unused private output path. Stage evidence
is output metadata, not caller-coordinated temporal decomposition.

## Synthesis decision

Pending parent arena comparison with the three-VMA/LMA candidate. This package
is one complete alternative, not the synthesized design or an approval to
implement. Parent confirmed that entry zero is acceptable only for this
explicitly opaque storage-container scope. No cross-judge outcome is fabricated.

## Tradeoffs accepted

- Accept an ELF that does not attest runtime placement in exchange for one
  contiguous stored-image proof, no ELF load-gap reconstruction and no BSS bytes.
- Accept independent checked-envelope runtime verification in exchange for
  avoiding runtime/executable section claims unsupported by code classification.
- Accept inability to substitute individual runtime regions or original
  relocation-aware source in this artifact in exchange for a small opaque seam.
- Accept an additional objcopy pin and attributes-only object check in exchange
  for actual LLVM-produced ARM metadata instead of hand-invented attributes.

## Alternatives considered

| Whole shape | What it hides/proves | Cost exposed or retained |
| --- | --- | --- |
| Flat stored image, this candidate | One payload section; exact LLVM storage preservation; physical verification stays in immutable envelope | ELF runtime placement/BSS is not verified because it is not represented |
| Three runtime VMA sections with stored LMAs, plus original table and BSS metadata | ELF can attest startup/autoload placement; supports future region-specific replacement | Requires deliberate VMA/LMA/BSS/table accounting and reconstruction by stored order; automatic linker gap/align policies cannot leak into image |
| Call existing ARM9 native linker unchanged | Reuses commands already proven for ARM9 | Rejected: ISA, entry, alignment, LCF grammar and normalization encode unsupported ARM9 assumptions |
| Direct ROM-slice copy with an ELF wrapper after success | Simplest apparent output | Rejected: reconstructed output would not prove actual native linker participation |

Compared with three-VMA/LMA, the flat shape has fewer layout-bearing ELF fields
and a smaller verifier surface, but deliberately proves less. The other shape
may be preferable if runtime placement is part of the required baseline claim;
this candidate cannot gain that claim through report wording or a flat-address
symbol convention.

## Open questions and risks

- Does the arena require ELF-attested runtime placement rather than independent
  physical verification? If so, this whole shape should lose rather than grow
  hidden runtime structures behind its flat abstraction.
- Do the pinned LLVM binary-input conversion and native linker preserve exactly
  one zero-flag PROGBITS payload and ARMv4T attributes? A public synthetic probe
  must decide before private ROM use; no command success is presumed here.
- Can the envelope be retained without duplicate layout storage in old view
  getters? Its constructor/getter tests must demonstrate one immutable authority.

## Next implementation step

After synthesis, start with public synthetic tests for retained checked authority
and the actual data-only LLVM link/container structural contract, before ROM use.
