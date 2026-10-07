"""Private, reproducible direct-object ARM7 link experiment."""

import hashlib
import json
import shutil
import struct
import subprocess
import sys
from pathlib import Path


REPO = Path(__file__).resolve().parents[4]
NOTES = REPO / "decomp/matching-notes/other-cpus"
ROM = Path("/Users/djdjo/Documents/mine/rom/jus.nds")
BASELINES = Path("/private/tmp/jus-arm7-reachable-root-proof/native-actual")
MW_OBJECT = Path("/private/tmp/jus-arm7-leaf-worker-proof/reproduced/O4p/compiled.o")
WRONG_OBJECT = Path("/private/tmp/jus-arm7-leaf-worker-proof/reproduced/baseline/compiled.o")
MW_SHA = "03aebe3ecc0c8fbbc1466d836bd2b659827b2a078f56c9eed1137d7abc426ccf"
WRONG_SHA = "182ebed8e905dd0b2b1eb363d0efefa7864e03ded84db7c1804110c1eea52bff"
LEAF_SHA = "1286c0f7baaf3678f915ee9ef9830ab1a2243c5ea8d41e2a75c0b14fa35eaebe"
ROM_SHA = "a9c9bf89e6d99548b7c87e822b217c3fb74ef25186535b06193a6fb73d0d6d27"
LAYOUT_SHA = "8a518abf785a1c24756d5485ee669f64e304af20a69b0d02a889fb60410d9fcc"
IMAGE_SHA = "0540bd6fba14f886c542b3bfa15b1c0391b23dd4eaa3688367e1813cbc021139"
SOURCE_SHA = "a6457f199a58403507cc0262b1187ebccd1df05190d50771c6a9ae9eafa24abb"
EXPECTED_TOOL_SHA = {
    "clang": "d64d1ee59d8aff01397eb88adea263e490ac65766faefc8b5323b4a06d0438e5",
    "lld": "3c9298dbaf1389f490e72bc055e9595cfe5f125e078deff9bedb4c54ceb15a54",
}
READOBJ = Path("/opt/homebrew/opt/llvm/bin/llvm-readobj")
READOBJ_SHA = "cf8c2b665ea0a064bad08c2fe3f6ba3a21fd3fd368ea5643f0c35e12fcac5540"
STORED_PARTS = ["startup", "autoload0", "autoload1", "table"]


def digest(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def pinned(path: Path, expected: str) -> bytes:
    data = path.read_bytes()
    actual = digest(data)
    if actual != expected:
        raise ValueError(f"hash mismatch: {path}: {actual}")
    return data


def split_autoload0(original: bytes) -> tuple[bytes, bytes, bytes]:
    if len(original) != 66120:
        raise ValueError("autoload0 must have its accepted stored length")
    return original[:20248], original[20248:20268], original[20268:]


def build_link_script(baseline: str) -> str:
    old = ".arm7.autoload0 58687488  : AT(37224880) { autoload0.o(.arm7.autoload0) } :p4"
    if baseline.count(old) != 1:
        raise ValueError("accepted autoload0 linker selector absent or duplicated")
    new = (
        ".arm7.autoload0 58687488  : AT(37224880) {\n"
        "  prefix.o(.arm7.autoload0.prefix)\n"
        "  __leaf_start = .;\n"
        "  compiled.o(.text)\n"
        "  __leaf_end = .;\n"
        "  suffix.o(.arm7.autoload0.suffix)\n"
        "} :p4\n"
        'ASSERT(__leaf_start == 0x037fcf18, "leaf start")\n'
        'ASSERT(__leaf_end == 0x037fcf2c, "leaf end")\n'
        'ASSERT(__leaf_end - __leaf_start == 20, "leaf size")'
    )
    bss_old = "autoload0.o(.arm7.bss.autoload0)"
    if baseline.count(bss_old) != 1:
        raise ValueError("accepted autoload0 BSS selector absent or duplicated")
    return baseline.replace(old, new).replace(bss_old, "bss0.o(.arm7.bss.autoload0)")


def run_command(argv: list[str], cwd: Path, log: Path) -> subprocess.CompletedProcess[str]:
    result = subprocess.run(argv, cwd=cwd, text=True, capture_output=True)
    log.write_text(
        json.dumps({"argv": argv, "return_code": result.returncode}, indent=2)
        + "\nSTDOUT\n"
        + result.stdout
        + "\nSTDERR\n"
        + result.stderr
    )
    return result


def parse_elf(path: Path) -> tuple[dict, list[dict], list[dict], list[dict]]:
    data = path.read_bytes()
    header = struct.unpack_from("<16sHHIIIIIHHHHHH", data)
    assert header[0][:7] == b"\x7fELF\x01\x01\x01" and header[2] == 40
    assert header[3] == 1 and header[9] == 32 and header[11] == 40
    phoff, phnum, shoff, shnum, shstr = header[5], header[10], header[6], header[12], header[13]
    assert phoff == 52 and shoff + shnum * 40 <= len(data)
    sections_raw = [struct.unpack_from("<IIIIIIIIII", data, shoff + i * 40) for i in range(shnum)]
    names_section = sections_raw[shstr]
    names = data[names_section[4] : names_section[4] + names_section[5]]

    def section_name(offset: int) -> str:
        end = names.index(0, offset)
        return names[offset:end].decode("ascii")

    sections = [
        {
            "name": section_name(s[0]),
            "type": s[1],
            "flags": s[2],
            "vma": s[3],
            "offset": s[4],
            "size": s[5],
            "link": s[6],
            "entry_size": s[9],
            "align": s[8],
        }
        for s in sections_raw
    ]
    segments = []
    for i in range(phnum):
        p = struct.unpack_from("<IIIIIIII", data, phoff + i * 32)
        segments.append(
            dict(zip(("type", "offset", "vma", "lma", "file_bytes", "memory_bytes", "flags", "align"), p))
        )
    symbols = []
    for section in sections:
        if section["type"] != 2:
            continue
        strings = sections[section["link"]]
        string_data = data[strings["offset"] : strings["offset"] + strings["size"]]
        for pos in range(section["offset"], section["offset"] + section["size"], 16):
            name, value, size, info, other, shndx = struct.unpack_from("<IIIBBH", data, pos)
            end = string_data.index(0, name)
            symbols.append(
                {"name": string_data[name:end].decode("ascii"), "vma": value, "size": size, "section": shndx}
            )
    return {"entry": header[4], "flags": header[7], "bytes": len(data)}, sections, segments, symbols


def verify_elf(path: Path, original_image: bytes, baseline: dict) -> dict:
    header, sections, segments, symbols = parse_elf(path)
    assert header["entry"] == baseline["entry"]
    assert len(segments) == len(baseline["segments"]) == 6
    allocated = [s for s in sections if s["flags"] & 2 and s["size"]]
    assert len(allocated) == 6, allocated
    expected_sections = {s["section"]: s for s in baseline["segments"]}
    actual_sections = {s["name"]: s for s in allocated}
    assert set(actual_sections) == set(expected_sections)
    for actual, expected in zip(segments, baseline["segments"]):
        for a, b in (("vma", "vma"), ("lma", "lma"), ("file_bytes", "file_bytes"), ("memory_bytes", "memory_bytes"), ("flags", "flags")):
            assert actual[a] == expected[b], (a, actual, expected)
        assert actual["type"] == 1
        assert actual["align"] <= 1 or actual["vma"] % actual["align"] == actual["offset"] % actual["align"]
    for name, expected in expected_sections.items():
        actual = actual_sections[name]
        assert actual["vma"] == expected["vma"] and actual["size"] == expected["memory_bytes"]
        assert actual["type"] == (8 if expected["file_bytes"] == 0 else 1)
        assert actual["flags"] == (6 if name == ".arm7.autoload0" else (3 if expected["file_bytes"] == 0 else 2))
        assert actual["align"] == 4
    data = path.read_bytes()
    segment_by_name = dict(zip(expected_sections, segments))
    for name, section in actual_sections.items():
        segment = segment_by_name[name]
        if segment["file_bytes"]:
            assert segment["offset"] == section["offset"]
            assert segment["offset"] + segment["file_bytes"] <= len(data)
            assert section["offset"] + section["size"] <= len(data)
            assert data[segment["offset"] : segment["offset"] + segment["file_bytes"]] == data[section["offset"] : section["offset"] + section["size"]]
    image = bytearray()
    part_hashes = {}
    for name in STORED_PARTS:
        segment = segment_by_name[f".arm7.{name}"]
        part = data[segment["offset"] : segment["offset"] + segment["file_bytes"]]
        assert len(part) == segment["file_bytes"]
        image.extend(part)
        part_hashes[name] = digest(part)
    assert len(image) == len(original_image) == 165552
    assert bytes(image) == original_image and digest(image) == IMAGE_SHA
    leaf = image[0x50C8 : 0x50C8 + 20]
    assert digest(leaf) == LEAF_SHA
    original_autoload0 = original_image[432 : 432 + 66120]
    linked_autoload0 = image[432 : 432 + 66120]
    assert linked_autoload0[:20248] == original_autoload0[:20248]
    assert linked_autoload0[20268:] == original_autoload0[20268:]
    assert sum(s["memory_bytes"] for s in segments if s["file_bytes"] == 0) == 21424
    trial_symbol = [s for s in symbols if s["name"] == "arm7_store_trial"]
    assert len(trial_symbol) == 1 and trial_symbol[0]["vma"] == 0x037FCF18 and trial_symbol[0]["size"] == 20
    start = [s for s in symbols if s["name"] == "__leaf_start"]
    end = [s for s in symbols if s["name"] == "__leaf_end"]
    assert len(start) == len(end) == 1 and start[0]["vma"] == 0x037FCF18 and end[0]["vma"] == 0x037FCF2C
    return {
        "linked_elf_sha256": digest(data),
        "elf_header": header,
        "sections": allocated,
        "segments": segments,
        "leaf_symbols": trial_symbol + start + end,
        "image_bytes": len(image),
        "image_sha256": digest(image),
        "part_sha256": part_hashes,
        "BSS_bytes": 21424,
        "exact_original_ELF_only": True,
    }


def prepare_link_dir(directory: Path, baseline_dir: Path, baseline: dict, object_bytes: bytes, clang: str) -> dict:
    directory.mkdir()
    artifacts = {a["name"]: a for a in baseline["artifacts"]}
    for name in ("startup.o", "table.o", "autoload1.o"):
        src = baseline_dir / name
        shutil.copyfile(src, directory / name)
        pinned(directory / name, artifacts[name]["sha256"])
    autoload0 = pinned(baseline_dir / "autoload0.bin", artifacts["autoload0.bin"]["sha256"])
    prefix, leaf, suffix = split_autoload0(autoload0)
    assert digest(leaf) == LEAF_SHA
    (directory / "prefix.bin").write_bytes(prefix)
    (directory / "suffix.bin").write_bytes(suffix)
    for part in ("prefix", "suffix"):
        source = (
            '.cpu arm7tdmi\n.section .arm7.autoload0.'
            + part
            + ',"a",%progbits\n.balign 4\n.incbin "'
            + part
            + '.bin"\n'
        )
        (directory / f"{part}.s").write_text(source)
        argv = [clang, "--target=arm-none-eabi", "-mcpu=arm7tdmi", "-c", f"{part}.s", "-o", f"{part}.o"]
        result = run_command(argv, directory, directory / f"clang-{part}.log")
        assert result.returncode == 0, result.stderr
    (directory / "bss0.s").write_text(
        '.cpu arm7tdmi\n.section .arm7.bss.autoload0,"aw",%nobits\n.balign 4\n.space 14920\n'
    )
    argv = [clang, "--target=arm-none-eabi", "-mcpu=arm7tdmi", "-c", "bss0.s", "-o", "bss0.o"]
    result = run_command(argv, directory, directory / "clang-bss0.log")
    assert result.returncode == 0, result.stderr
    (directory / "compiled.o").write_bytes(object_bytes)
    script = pinned(baseline_dir / "physical.ld", artifacts["physical.ld"]["sha256"]).decode("ascii")
    (directory / "physical.ld").write_text(build_link_script(script))
    return {
        "prefix_bytes": len(prefix),
        "prefix_sha256": digest(prefix),
        "suffix_bytes": len(suffix),
        "suffix_sha256": digest(suffix),
        "opaque_objects_sha256": {name: digest((directory / name).read_bytes()) for name in ("startup.o", "table.o", "autoload1.o", "prefix.o", "suffix.o", "bss0.o")},
        "MW_object_sha256": digest(object_bytes),
        "linker_script_sha256": digest((directory / "physical.ld").read_bytes()),
    }


def main(output: Path) -> int:
    if output.exists():
        assert output.is_dir() and not any(output.iterdir()), "output directory must be empty"
    else:
        output.mkdir(parents=True)
    layout_path = NOTES / "arm7-checked-layouts.json"
    pins_path = NOTES / "arm7-physical-baseline/native-pins.json"
    report_path = NOTES / "arm7-reachable-proof/native-actual-report.json"
    source_path = NOTES / "arm7-leaf-c-trial-proof/store_trial.c"
    pinned(layout_path, LAYOUT_SHA)
    pinned(source_path, SOURCE_SHA)
    parent = pinned(ROM, ROM_SHA)
    optimized = pinned(MW_OBJECT, MW_SHA)
    wrong = pinned(WRONG_OBJECT, WRONG_SHA)
    pins = json.loads(pins_path.read_text())
    for tool, expected in EXPECTED_TOOL_SHA.items():
        assert pins[tool]["sha256"] == expected
        pinned(Path(pins[tool]["executable"]), expected)
    pinned(READOBJ, READOBJ_SHA)
    baseline_report = json.loads(report_path.read_text())
    layouts = json.loads(layout_path.read_text())
    assert len(baseline_report["programs"]) == len(layouts) == 2
    fat = struct.unpack_from("<I", parent, 0x48)[0]
    child_start, child_end = struct.unpack_from("<II", parent, fat + 79 * 8)
    child = parent[child_start:child_end]
    assert digest(child) == layouts[1]["identity"]["program_sha256"]
    result = {
        "status": "in_progress",
        "scope": "private_direct_MW_ELF_object_link_experiment",
        "source_credit_bytes": 0,
        "canonical_update": False,
        "input_sha256": {"ROM": ROM_SHA, "layout": LAYOUT_SHA, "C_hypothesis": SOURCE_SHA, "MW_optimized_object": MW_SHA, "MW_wrong_object": WRONG_SHA, "native_report": digest(report_path.read_bytes()), "pins": digest(pins_path.read_bytes()), "script": digest(Path(__file__).read_bytes())},
        "tool_sha256": {**EXPECTED_TOOL_SHA, "llvm-readobj": READOBJ_SHA},
        "programs": [],
    }
    argv = [pins["lld"]["executable"], "-m", "armelf", "--nmagic", "-T", "physical.ld", "-Map", "physical.map", "-o", "linked.elf", "startup.o", "table.o", "autoload1.o", "prefix.o", "compiled.o", "suffix.o", "bss0.o"]
    for index, program in enumerate((parent, child)):
        baseline = baseline_report["programs"][index]
        assert baseline["identity"] == layouts[index]["identity"]
        baseline_dir = BASELINES / f"program-{index}"
        header_offset, _, _, image_size = struct.unpack_from("<IIII", program, 0x30)
        image = program[header_offset : header_offset + image_size]
        assert len(image) == 165552 and digest(image) == IMAGE_SHA
        assert pinned(baseline_dir / "arm7.bin", IMAGE_SHA) == image
        positive_dir = output / f"program-{index}" / "positive"
        positive_dir.parent.mkdir()
        prepared = prepare_link_dir(positive_dir, baseline_dir, baseline, optimized, pins["clang"]["executable"])
        linked = run_command(argv, positive_dir, positive_dir / "lld.log")
        entry = {"identity": baseline["identity"], "prepared": prepared, "link_argv": argv, "LLD_exit_code": linked.returncode, "LLD_log_sha256": digest((positive_dir / "lld.log").read_bytes())}
        result["programs"].append(entry)
        if linked.returncode != 0:
            result["status"] = "LLD_rejected_actual_MW_object"
            result["blocking_log"] = str(positive_dir / "lld.log")
            (output / "result.json").write_text(json.dumps(result, indent=2) + "\n")
            return 2
        entry["readback"] = verify_elf(positive_dir / "linked.elf", image, baseline)
        map_bytes = (positive_dir / "physical.map").read_bytes()
        assert b"compiled.o:(.text)" in map_bytes
        entry["readback"]["map_sha256"] = digest(map_bytes)
        readobj = run_command(
            [str(READOBJ), "--file-headers", "--sections", "--segments", "--symbols", "--relocations", "linked.elf"],
            positive_dir,
            positive_dir / "llvm-readobj.log",
        )
        assert readobj.returncode == 0, readobj.stderr
        entry["readback"]["llvm_readobj_log_sha256"] = digest((positive_dir / "llvm-readobj.log").read_bytes())
        tampered = bytearray((positive_dir / "linked.elf").read_bytes())
        phoff = struct.unpack_from("<I", tampered, 28)[0]
        old_offset = struct.unpack_from("<I", tampered, phoff + 4)[0]
        struct.pack_into("<I", tampered, phoff + 4, old_offset + 4)
        tampered_path = positive_dir / "tampered-load-offset.elf"
        tampered_path.write_bytes(tampered)
        try:
            verify_elf(tampered_path, image, baseline)
        except AssertionError:
            entry["readback"]["tampered_load_offset_rejected"] = True
            entry["readback"]["tampered_load_offset_elf_sha256"] = digest(tampered)
        else:
            raise AssertionError("tampered PT_LOAD offset accepted")
        negative_dir = output / f"program-{index}" / "negative"
        negative = prepare_link_dir(negative_dir, baseline_dir, baseline, wrong, pins["clang"]["executable"])
        negative_link = run_command(argv, negative_dir, negative_dir / "lld.log")
        assert negative_link.returncode != 0 and ("leaf end" in negative_link.stderr or "leaf size" in negative_link.stderr or "size" in negative_link.stderr), negative_link.stderr
        entry["wrong_object_negative"] = {"prepared": negative, "LLD_exit_code": negative_link.returncode, "LLD_stderr": negative_link.stderr, "log_sha256": digest((negative_dir / "lld.log").read_bytes())}
        artifacts = {a["name"]: a for a in baseline["artifacts"]}
        for name in ("startup.o", "table.o", "autoload1.o", "autoload0.bin", "physical.ld", "arm7.bin"):
            pinned(baseline_dir / name, artifacts[name]["sha256"])
        for directory, snapshot in ((positive_dir, prepared), (negative_dir, negative)):
            for name, expected in snapshot["opaque_objects_sha256"].items():
                pinned(directory / name, expected)
            pinned(directory / "compiled.o", snapshot["MW_object_sha256"])
            pinned(directory / "physical.ld", snapshot["linker_script_sha256"])
            pinned(directory / "prefix.bin", snapshot["prefix_sha256"])
            pinned(directory / "suffix.bin", snapshot["suffix_sha256"])
    pinned(layout_path, LAYOUT_SHA)
    pinned(source_path, SOURCE_SHA)
    pinned(ROM, ROM_SHA)
    pinned(MW_OBJECT, MW_SHA)
    pinned(WRONG_OBJECT, WRONG_SHA)
    for tool, expected in EXPECTED_TOOL_SHA.items():
        pinned(Path(pins[tool]["executable"]), expected)
    pinned(READOBJ, READOBJ_SHA)
    assert digest(report_path.read_bytes()) == result["input_sha256"]["native_report"]
    assert digest(pins_path.read_bytes()) == result["input_sha256"]["pins"]
    assert digest(Path(__file__).read_bytes()) == result["input_sha256"]["script"]
    result["status"] = "actual_MW_object_linked_exact_original_images"
    result["inputs_unchanged"] = True
    (output / "result.json").write_text(json.dumps(result, indent=2) + "\n")
    return 0


if __name__ == "__main__":
    if len(sys.argv) != 2:
        raise SystemExit("usage: python3 run.py EMPTY_PRIVATE_OUTPUT_DIRECTORY")
    raise SystemExit(main(Path(sys.argv[1])))
