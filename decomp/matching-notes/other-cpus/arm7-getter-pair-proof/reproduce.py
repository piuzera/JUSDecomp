"""One public operation: replay(absent_private_directory) -> receipt Path."""
import json
from pathlib import Path
import subprocess
import sys
import pair

HERE = Path(__file__).resolve().parent


def _compile_getter(row, contract, recipe, output):
    source = HERE/row['source']
    assert pair._sha(source.read_bytes()) == row['source_sha256']
    local_source = output/source.name
    local_source.write_bytes(source.read_bytes())
    object_path = output/(row['role']+'.o')
    argv = [recipe['runner'],recipe['compiler'],*recipe['flags'],str(local_source),'-o',str(object_path)]
    command = pair._run(argv,output,row['role']+'-compile.json')
    assert command['returncode'] == 0 and command['stdout'] == command['stderr'] == '',command
    elf = pair._inspect_object(object_path,row,contract)
    readobj = subprocess.run([recipe['llvm_readobj'],'--file-headers','--sections','--symbols','--relocations',str(object_path)],capture_output=True,text=True,check=True)
    assert readobj.stderr == ''
    (output/(row['role']+'-elf-readback.txt')).write_text(readobj.stdout.replace(str(object_path),object_path.name))
    code = bytes.fromhex(elf['text_hex'])[:row['code_bytes']]
    llvm = subprocess.run([recipe['llvm_mc'],'--disassemble','--triple=armv4t-none-eabi'],input=' '.join(f'0x{x:02x}' for x in code)+'\n',capture_output=True,text=True,check=True)
    assert llvm.stderr == '' and len(llvm.stdout.strip().splitlines()) == row['code_bytes']//4
    (output/(row['role']+'-compiled-llvm.txt')).write_text(llvm.stdout)
    return pair.VerifiedGetter(row,object_path,elf,command)


def replay(output: Path) -> Path:
    output = output.resolve()
    output.mkdir()
    pins_path = HERE/'evidence-pins.json'
    pins_bytes = pins_path.read_bytes()
    pins = json.loads(pins_bytes)['input_sha256']
    for name,pin in pins.items():
        assert pair._sha((HERE/name).read_bytes()) == pin,name
    contract = pair._load_contract()
    recipe = json.loads((HERE/'recipe.json').read_text())
    for path,pin in recipe['tools_sha256'].items():
        assert pair._sha(Path(path).read_bytes()) == pin,path
    originals = pair._load_originals(contract,recipe,output)
    low_row,high_row = contract['getters']
    low = _compile_getter(low_row,contract,recipe,output)
    high = _compile_getter(high_row,contract,recipe,output)
    bindings = pair.FourBindings(**{field:spec['value'] for field,spec in contract['bindings'].items()})
    getters = []
    for getter in (low,high):
        observed = [next(r for r in original['getter_reads'] if r['role']==getter.row['role']) for original in originals]
        explained = pair._diagnostic_bytes(getter,contract,bindings)
        assert all(explained == bytes.fromhex(original['bytes_hex']) for original in observed),getter.row['role']+' code/pool mismatch'
        getters.append({'role':getter.row['role'],'source':getter.row['source'],'source_sha256':getter.row['source_sha256'],
                        'vma':getter.row['vma'],'bytes':getter.row['bytes'],'original_bytes_sha256':observed[0]['bytes_sha256'],
                        'compile_command':getter.compile_command,'elf':getter.elf})
    programs = pair._produce_pair(low,high,output/'native',originals,contract,recipe)
    for path,pin in recipe['tools_sha256'].items():
        assert pair._sha(Path(path).read_bytes()) == pin,path
    assert pair._sha(pair.ROM.read_bytes()) == originals[0]['layout']['identity']['parent_rom_sha256']
    for name,pin in pins.items():
        assert pair._sha((HERE/name).read_bytes()) == pin,name
    assert pins_path.read_bytes() == pins_bytes
    receipt = {'status':'actual_two_MW_getter_pair_exact_original_images','getters':getters,'programs':programs,
               'originals':[{'identity':o['layout']['identity'],'image_sha256':o['layout']['image_sha256'],'getter_reads':o['getter_reads']} for o in originals],
               'checked_layout_sha256':pair._sha((HERE/'checked-layouts.json').read_bytes()),
               'input_sha256':pins,'tool_sha256':recipe['tools_sha256'],'inputs_unchanged':True,
               'source_credit_bytes':0,'original_names_types_ABI_extent_version_ownership_established':False}
    path = output/'trial-proof.json'
    path.write_text(json.dumps(receipt,indent=2)+'\n')
    return path


if __name__ == '__main__':
    print(replay(Path(sys.argv[1])))
