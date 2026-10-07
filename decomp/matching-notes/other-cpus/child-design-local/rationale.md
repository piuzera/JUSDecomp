# Child operation rationale

## Problem

Child ARM9 has a native reference proof and an exact codec proof, but neither is
a fresh canonical producer. The verifier must own their combined provenance
through parent publication. Compressed child bytes also cannot use the parent's
direct stored-module comparison. ARM7 already provides the live-operation pattern
and an independent physical write that the child operation must preserve.

## Usage (caller's view)

The [usage examples](README.md#caller-usage) build one operation in the verifier,
merge its input snapshot, then pass it alongside ARM7 into the existing packer.
The packer calls `recheck` to obtain one immutable payload buffer. Audit JSON is
useful for review but has no constructor path back to an operation.

## Shape

One new Python helper owns the complete child proof. `build_child` hides analysis,
config correction, native commands, ELF checks, relocation proof and codec work.
`ChildOperation` holds a frozen private capture and exposes report copies,
snapshot copies and recheck. A typed payload binds exact program/CPU identity,
source-file digest, slice offset and linked ELF to bytes. This concentrates the
child policy behind two behaviors, per boundary-discipline and interface depth.
Existing native and codec checks stay where they are; parent physical collision
checks stay with packing, per single-source-of-truth. Rechecks use immutable
expectations and live files rather than rebuilding an expected digest from a
mutable report. The helper adds the reference-mode map check missing from the
existing `verify_link_record` branch. No new generic pipeline is needed.

## Synthesis decision

This is the local Python candidate for the parent arena. Its proposed base is a
whole-operation helper because only it owns enough context to issue and recheck
child authority. Cross-candidate selection belongs to the parent synthesis.

## Tradeoffs accepted

- We accept a substantial helper in exchange for callers never coordinating
  extraction, native checks and codec stages themselves.
- We accept repeated file and relocation checks in exchange for current evidence
  at publication. Captured buffers keep the actual parent write deterministic.
- We accept a child-specific ELF geometry check in exchange for preserving the
  current parent direct-comparison semantics and avoiding an unrelated refactor.
- We accept rerunning after interruption in exchange for rejecting stale or
  partially resumed proof. Distinct builds use distinct output directories.

## Alternatives considered

A new Rust producer could own analysis, linking and packing behind one subprocess
boundary. It offers comparable caller depth, but must reproduce Python's native
provenance checks or expose several subordinate receipts that Python still needs
to interpret. That additional approval and checking boundary has no required
capability here. Prefer it only if an already approved whole-child producer exists.

A generalized verifier pipeline could represent child and parent as plan nodes.
It hides process execution but exposes compression, reference-object and geometry
policies to plan builders. Callers would assemble the proof that this helper can
own. Its flexibility increases the number of invalid plans without simplifying
this single required path.

A JSON-only producer report makes persistence easy but cannot distinguish a fresh
operation from loaded evidence. Replaying all work during import would recreate
this helper behind an unsafe-looking API. Reject it.

## Open questions and risks

Will the approved `3f18…` analyzer emit the exact three original gap-object digests
under fresh strict child init? The first implementation proof must answer this;
a mismatch fails and requires reviewed evidence, never silent pin replacement.
Will separately reviewed codec source closure approve the historical `99f896…`
binary or a new build? Neither analyzer acceptance nor this sketch decides it.

## Next implementation step

Build the helper's fresh-directory and approval boundary with rejection tests for
loaded reports, altered output and wrong program identity, then run the actual
strict child operation against the approved analyzer and independent codec pin.
