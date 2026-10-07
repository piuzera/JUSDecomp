# Child ARM9 integration worker proof

Commit `320ea2a` passes the complete 21-stage source pipeline with independent
ARM7 and child ARM9 operations. The actual run is
`/private/tmp/jus-child-native-worker-proof-5/report.json`. Its `source_commit`
contains every executed candidate script. [worker-proof.json](worker-proof.json)
records the report digest and normalizes only the repository, build, and ROM
path prefixes. Independent root verification and gpt-6.1-sol review of source `320ea2a`
and proof/trail `8b7cc6a` report No flags. See [root-proof.json](root-proof.json)
and [accepted-review.json](accepted-review.json) for accepted evidence.

The run produces 20 disjoint physical writes: 17 parent ARM9 modules, one child
compressed ARM9 slice, and two independently produced ARM7 images. The child
ARM9 range is parent `[0x23f800,0x41d074)`. Child ARM7 occupies
`[0x41d200,0x4458b0)`. Whole child and parent bytes equal their original inputs.
The parent SHA256 is
`a9c9bf89e6d99548b7c87e822b217c3fb74ef25186535b06193a6fb73d0d6d27`.

Fresh strict initialization uses the separately approved `3f18db59…` analyzer.
Canonical parent DSD remains `22258743…`. Encoding uses the separately approved
clean-upstream `5c04f266…` codec. All three fresh original gap objects retain the
independent baseline digests. All 35,092 original relocations pass, with zero
failed, unresolved, or source-mode fallback slots. Each initialized ELF prefix,
BSS boundary, emitted image, and exact codec result passes its existing check.
The child operation captures 59 retained artifacts.

[tests.log](tests.log) records 257 passing tests with no skips, including the
available private compiler and reference fixtures. Nine new tests use public
invented bytes and paths. They cover selected stage requirements, detached and
forged operations, pending approvals, report-stage disagreement, physical write
bounds and overlap, immutable captures, snapshot merge conflicts, and initial
child source capture.

A separate fresh real child operation rejected 21 mutations recorded in
[live-mutations.json](live-mutations.json). Each of nine artifact mutations also
failed after its detached report digest was rewritten. An extra file, a stale
encoded child, and detached JSON failed too. After restoration, the original live
operation passed and returned the exact compressed child slice. These mutations
changed only the separate proof directory.

## Review findings fixed before the final run

The initial snapshot union used `dict.update`, which could replace an earlier
parent script digest with a later child digest. `merge_snapshot` now validates
all overlaps before updating the snapshot. Both ARM7 and child use it. Its test
first failed, then passed with conflicting hashes rejected and the original
snapshot untouched.

The initial source inventory omitted the two child scripts, their two role
approvals, and the child baseline reference. The selected child mode now captures
all five before parent work begins. The initial source count is 80, compared with
75 for the existing source-plus-ARM7 run. The regression test first failed, then
passed by reading the source inventory from a verifier run that rejects a missing
invented ROM before any native work.

## Scope

The existing parent source credit remains 304 bytes and seven functions. Child
source bytes and functions remain zero. Global coverage is unknown, and T10 stays
open. The proof establishes native reference payloads and exact storage bytes;
it does not establish original compiler matching or a bootable child ELF.
All 16 source artifacts in the existing ARM7 approval retain their approved
hashes. That approval and the canonical toolchain lock remain unchanged.
