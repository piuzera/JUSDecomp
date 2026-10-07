# Selected native ARM7 physical baseline

The physical design is the implementation base. Both complete packages were
read at frozen commits. Parent scores are physical 14 and flat 10; independent
gpt-6-sol scores are physical 15 and flat 12. The difference is concrete: the
flat ELF preserves stored bytes but has no runtime VMA/LMA/BSS representation.
The selected physical ELF must prove those fields in its actual sections and
program headers, then reconstruct bytes in the original stored order.

See [parent scores](parent-scores.md), [cross-judge](cross-judge.json), the
[physical package](physical/01-usage.md) and the
[flat alternative](flat/01-usage.md). This choice is design agreement, not a
passed native artifact. The first implementation gate uses invented bytes and
the actual pinned LLVM tools.

The selected interface remains one Rust operation,
`build(&Arm7View, &NativePins, empty_output)`. The checked view privately retains
the already validated entry, image, header, parameter and table envelope.
Existing region descriptions remain authoritative; the envelope does not
duplicate them. The runner owns tool pinning, opaque input objects, linker
script, actual ELF verification and reconstruction. It accepts no later
mutable layout, arbitrary script or ARM9 Config/Module.

Three initialized regions retain checked runtime VMAs and packed initial-load
LMAs. The original loader table is separate. BSS uses distinct NOBITS sections
and zero-file-size segments. PT_LOAD order follows runtime VMA while byte
reconstruction follows checked stored offsets. File padding and generated
attributes are artifact metadata. No executable flags, original functions,
instruction modes or relocation model are manufactured.

Grafted from the flat design:

- The example checks exact consumed sidecar bytes and digest and rejects
  duplicate selected identities. Each per-program result retains complete
  parent/selector/program identity and the consumed sidecar pin.
- A negative test mutates actual linked ELF bytes while originals stay intact.
  Reconstruction must fail rather than copy the original input over a bad link.
- The library owns immutable input snapshots. Its file-reading example owns
  the stronger before/after original-file freshness assertion.

Rejected additions are the flat storage ELF, extra objcopy pin/cleaning stage,
public pinned-input facade and single-value report wrapper types. They add
boundaries without improving the required actual native placement proof.

One acceptance sentence is clarified. A different valid checked program view
is a legitimate input and produces its own identity. Substitution negatives
target mismatched pins, selection and artifacts; they do not require rejecting
every other valid view without a separate expected-program argument.

Implementation is isolated in `/private/tmp/jus-arm7-physical-baseline-dsd`,
starting at shared decoder producer `33ba849`. The separate preparation
inventory review fix must be incorporated before its final producer. Public
API tests have failed on the missing native module before implementation.
Pinned native fixture behavior and final code review remain pending. Any real
linker contradiction must be recorded before changing the selected layout.

The scoped result will establish opaque physical preservation only. Source
bytes remain zero, functions and executability remain unknown, original ARM7
relocations remain unknown, and T10 remains open. Production tool pins stay
unchanged until an independently reviewed compatibility proof.
