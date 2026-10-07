"""One public operation: replay(absent_private_directory) -> receipt Path."""
import json
from pathlib import Path
import subprocess
import sys
import loads

HERE = Path(__file__).resolve().parent


def _compile_candidate(row, contract, recipe, output):
    source = HERE/row['source']
    assert loads._sha(source.read_bytes()) == row['source_sha256']
    local_source = output/source.name
    local_source.write_bytes(source.read_bytes())
    object_path = output/(row['role']+'.o')
    selected = recipe['recipes'][row['recipe']]
    argv = [recipe['runner'],selected['compiler'],*selected['flags'],str(local_source),'-o',str(object_path)]
    command = loads._run(argv,output,row['role']+'-compile.json')
    assert command['returncode'] == 0 and command['stdout'] == command['stderr'] == '',command
    elf = loads._inspect_object(object_path,row,contract)
    readobj = subprocess.run([recipe['llvm_readobj'],'--file-headers','--sections','--symbols','--relocations',str(object_path)],capture_output=True,text=True,check=True)
    assert readobj.stderr == ''
    (output/(row['role']+'-elf-readback.txt')).write_text(readobj.stdout.replace(str(object_path),object_path.name))
    code = bytes.fromhex(elf['text_hex'])[:row['code_bytes']]
    llvm = subprocess.run([recipe['llvm_mc'],'--disassemble','--triple=armv4t-none-eabi'],input=' '.join(f'0x{x:02x}' for x in code)+'\n',capture_output=True,text=True,check=True)
    assert llvm.stderr == '' and len(llvm.stdout.strip().splitlines()) == row['code_bytes']//4
    (output/(row['role']+'-compiled-llvm.txt')).write_text(llvm.stdout)
    return loads.VerifiedCandidate(row,object_path,elf,command)


def replay(output: Path) -> Path:
    output = output.resolve()
    output.mkdir()
    pins_path = HERE/'evidence-pins.json'
    pins_bytes = pins_path.read_bytes()
    pins = json.loads(pins_bytes)['input_sha256']
    for name,pin in pins.items():
        assert loads._sha((HERE/name).read_bytes()) == pin,name
    contract = loads._load_contract()
    recipe = json.loads((HERE/'recipes.json').read_text())
    for path,pin in recipe['tools_sha256'].items():
        assert loads._sha(Path(path).read_bytes()) == pin,path
    originals = loads.read_original(output)
    candidates = tuple(_compile_candidate(row,contract,recipe,output) for row in contract['candidates'])
    bindings = loads.FiveBindings(**{field:spec['value'] for field,spec in contract['bindings'].items()})
    candidate_records = []
    for getter in candidates:
        observed = [next(r for r in original['candidate_reads'] if r['role']==getter.row['role']) for original in originals]
        explained = loads._diagnostic_bytes(getter,contract,bindings)
        assert all(explained == bytes.fromhex(original['bytes_hex']) for original in observed),getter.row['role']+' code/pool mismatch'
        candidate_records.append({'role':getter.row['role'],'source':getter.row['source'],'source_sha256':getter.row['source_sha256'],
                        'vma':getter.row['vma'],'bytes':getter.row['bytes'],'recipe':getter.row['recipe'],'original_bytes_sha256':observed[0]['bytes_sha256'],
                        'compile_command':getter.compile_command,'elf':getter.elf})
    programs = loads._produce_loads(candidates,bindings,originals,contract,recipe,output/'native')
    for path,pin in recipe['tools_sha256'].items():
        assert loads._sha(Path(path).read_bytes()) == pin,path
    assert loads._sha(loads.ROM.read_bytes()) == originals[0]['layout']['identity']['parent_rom_sha256']
    for name,pin in pins.items():
        assert loads._sha((HERE/name).read_bytes()) == pin,name
    assert pins_path.read_bytes() == pins_bytes
    receipt = {'status':'actual_seven_MW_indexed_loads_exact_original_images','candidates':candidate_records,'programs':programs,
               'originals':[{'identity':o['layout']['identity'],'image_sha256':o['layout']['image_sha256'],'candidate_reads':o['candidate_reads'],'windows':o['windows'],'literal':o['literal'],'guard':o['guard'],'calls':o['calls'],'unknown_bx_sources':o['unknown_bx_sources']} for o in originals],
               'checked_layout_sha256':loads._sha((HERE/'checked-layouts.json').read_bytes()),
               'input_sha256':pins,'tool_sha256':recipe['tools_sha256'],'inputs_unchanged':True,
               'source_credit_bytes':0,'original_names_types_ABI_extent_version_ownership_established':False}
    path = output/'trial-proof.json'
    path.write_text(json.dumps(receipt,indent=2)+'\n')
    return path


if __name__ == '__main__':
    print(replay(Path(sys.argv[1])))
