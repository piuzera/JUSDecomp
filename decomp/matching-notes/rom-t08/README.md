# Verify the complete ROM

The strict verifier now requires ROM packing after every module check. Both the
source build and binary reference build reproduce the original 67,108,864-byte
ROM. Its SHA256 is
`a9c9bf89e6d99548b7c87e822b217c3fb74ef25186535b06193a6fb73d0d6d27`.

The [source report](source-report.json) passes all 19 stages at producer commit
`9495e76e86908510e8f6ddb11be63500404ae5c4`. The
[reference report](reference-report.json) passes all 15 stages at the same commit.
Both replace all 17 ARM9 payloads, totaling 2,141,728 bytes, with actual linked
module files. The original template supplies layout, tables, padding, ARM7,
assets, and embedded programs. Preserved content earns zero source credit.
The current parent ARM9 and overlays are uncompressed. A compressed parent
payload rejects until a matching encoder exists.

Run the [source command](../source-t03/README.md#run-the-source-pipeline) with a
fresh output directory. The command now writes private `rebuilt.nds` as well as
`report.json`. Omit the three source options to run the reference baseline.
The packer rechecks actual linked payloads, ELF layout, linker inputs, source
objects, ownership, and artifact hashes before writing the ROM. The verifier
then checks input immutability and output hashes again before granting credit.

The [negative source run](negative-report.json) changes the trampoline's pointer
target. Its compiled object changes, its reference object stays unchanged, and
the relocation-identity gate rejects it before linking or packing. Accepted
source bytes remain zero. Public fixtures also reject changes to headers,
overlay tables, filesystem order, compression, executable bytes, preserved
assets, and padding. They reject missing payloads and report-only success.
The [test log](tests.log) records 124 passing tests with the actual compiler
integration enabled and no skips.

The accepted source remains one game function with 24 bytes. It includes 20
instruction bytes and a four-byte literal pool. Full-project coverage remains
unknown because ARM7 and embedded programs are preserved, and proprietary
container scope remains unresolved.

Boot and scene-transition smoke cases are queued in `jus-bjry.7`. They require
the T06 pilot and the single emulator lease. No runtime capture has been made.
ROM identity proves byte preservation; it does not establish reconstructed
type layouts or object lifetimes.
