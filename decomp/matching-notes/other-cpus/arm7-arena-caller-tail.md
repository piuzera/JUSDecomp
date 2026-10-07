# Bounded ARM7 arena caller continuation

The original parent and FAT 79 child ARM7 images both contain the same fixed 80-byte ARM continuation `[0x037fd070,0x037fd0c0)` and three-instruction epilogue `[0x037fd0c0,0x037fd0cc)`. This research extends the [arena hypothesis](arm7-sdk-arena-hypothesis.md) only at those addresses. The former eight-byte epilogue selection is replaced rather than overlapped. The initialized literal at `0x037fd0cc` is read as data and is not selected as an instruction.

The selected continuation supplies two further four-call groups. The immediate loaded into `r0` is 7 for the first group and 8 for the second. Each first and third call is followed by `mov r1, r0`; the caller then reloads the same immediate into `r0` before the second and fourth call. Raw ARM BL sign extension, the checked ARMv4T observer, and native LLVM agree on all eight destinations:

| Caller immediate | First call | Second call | Third call | Fourth call |
| ---: | --- | --- | --- | --- |
| 7 | `d074 → cf84` | `d080 → cf18` | `d088 → cf2c` | `d094 → cf04` |
| 8 | `d09c → cf84` | `d0a8 → cf18` | `d0b0 → cf2c` | `d0bc → cf04` |

All addresses in the table have prefix `0x037f`. The first and third destinations remain outside this selection. The second and fourth destinations join the previously checked setter-shaped spans at `0x037fcf18` and `0x037fcf04`. The continuation's SHA256 is `2682fcfd18c0bdc36ed6547ad546bef1d300ab2a3eea24c1e3c1a2ca7dde3f33` in each program; the expanded epilogue's is `97e49fab5b2490c4b4977ff23d65446f267880f107a387035c5cf63b97d1d2ad`.

This numeric ordering matches the high-before-low initialization groups for arena IDs 1, 7, and 8 in the pinned [community Pokémon Diamond ARM7 reconstruction](https://github.com/pret/pokediamond/blob/38f3650189f8989aed91618745aa74029fa60247/arm7/lib/src/OS_arena.c). Its [shared enum](https://github.com/pret/pokediamond/blob/38f3650189f8989aed91618745aa74029fa60247/include/nitro/OS_arena_shared.h) assigns those IDs. The comparison corroborates an arena-family hypothesis; it does not establish original JUS function names, types, signatures, SDK version, source ownership, or runtime effects. The getter case bodies were not selected.

The epilogue decodes as `add sp, sp, #4` at `d0c0`, `ldm sp!, {lr}` at `d0c4`, and `BX lr` at `d0c8`. The graph retains the earlier `NE` branch to `d0c0` and its condition-failed fallthrough, every `call_returned` continuation as an assumption, and `BX lr` as an unknown indirect frontier. It does not resolve the literal at `d0cc` into code or prove that any call returns at runtime.

## Exact bounded result and replay

The independent original reader checks both full program identities, the parent NDS header, the child's FNT/FAT path, each ARM7 image digest, module parameters, loader table, autoload0 initialized mapping, exact 23 selected words, all eight raw BL targets, and LLVM ARMv4T output. Both program graphs have eight observations, 55 nodes, 70 original transfers, 55 visited nodes, 70 edge examinations, 59 selected edges, and 11 frontiers. The eight outside-selection frontiers include unresolved candidate getters and earlier continuations. The three indirect frontiers are the two setter `BX lr` sites and `d0c8`. Source and guard fields, root predecessors, and every frontier witness remain in the [compact graph summary](arm7-arena-caller-tail-proof/graph-summary.json).

The packaged [request](arm7-arena-caller-tail-proof/requests.json) is 3,897 bytes, SHA256 `53ace3a3795712f684b2292c14a614ac946a29a7a38274cc38e5f7f26da56e5a`. The full private report is 924,613 bytes, SHA256 `06933defa677dcbc353c10face1c13e18afce46dfad3715c302bce233c1498ba`, at `/private/tmp/jus-arm7-arena-caller-tail-worker-proof/actual-01/report.json`. The [original readback](arm7-arena-caller-tail-proof/original-read.json), [continuation LLVM output](arm7-arena-caller-tail-proof/llvm-continuation.txt), and [epilogue LLVM output](arm7-arena-caller-tail-proof/llvm-epilogue.txt) contain no ROM image or extracted binary.

The [reproducer](arm7-arena-caller-tail-proof/reproduce.py) uses its packaged request and local checked layout with the pinned external ROM, producer, and LLVM tool. It creates a fresh private report, reruns the original reader and graph checker, and byte-compares the resulting public evidence. Run from the repository root with a new private output directory:

```sh
python3 decomp/matching-notes/other-cpus/arm7-arena-caller-tail-proof/reproduce.py NEW_PRIVATE_OUTPUT_DIRECTORY
```

The fresh replay passed. The [source manifest](arm7-arena-caller-tail-proof/external-sources.json) records pinned community and libnds references; no external source copy, ROM, extracted binary, private full report, or source-cache change is committed. This research adds zero ARM7 source bytes. The accepted canonical count stays 304 bytes, and T10 remains open.
