"""Replay the one frozen bounded high-getter candidate with its actual native pool.

Usage: python3 reproduce.py NEW_PRIVATE_OUTPUT_DIRECTORY
Every research input is in this package; only pinned ROM/layout/tools are external.
No previous private proof or object is an input.
"""
import hashlib
import json
from pathlib import Path
import struct
import subprocess
import sys
from verify import inspect_object, resolve_literals, check_pool
from native import run_native

HERE = Path(__file__).resolve().parent


def sha(data):
    return hashlib.sha256(data).hexdigest()


def replay(output):
    output.mkdir()
    recipe=json.loads((HERE/'recipe.json').read_text())
    source=HERE/recipe['source']
    assert sha(source.read_bytes())==recipe['source_sha256']
    package_before={name:sha((HERE/name).read_bytes()) for name in ('high_getter_trial.c','recipe.json','original-manifest.json','native-layout.json','donor-primary-audit.json','read_original.py','verify.py','native.py')}
    for path,pin in recipe['external_sha256'].items():
        assert sha(Path(path).read_bytes())==pin,path
    # Preserve the original candidate basename in a fresh output directory.
    local_source=output/'high_getter_trial.c'
    local_source.write_bytes(source.read_bytes())
    subprocess.run([sys.executable,str(HERE/'read_original.py'),str(output)],check=True)
    originals=json.loads((output/'original-read.json').read_text())
    payloads=[]
    for program in originals['programs']:
        code=b''.join(struct.pack('<I',int(word,16)) for selection in program['selections'] for word in selection['words'])
        pool=b''.join(struct.pack('<I',int(word['word'],16)) for word in program['literals'])
        assert len(code)==108 and len(pool)==20
        payloads.append(code+pool)
    assert len(payloads)==2 and payloads[0]==payloads[1]
    expected=payloads[0]
    compile_records=[]
    objects=[]
    for label,filename in [('experiment','compiled.o')]:
        selected=recipe[label]
        argv=[recipe['runner'],selected['compiler'],*selected['flags'],str(local_source),'-o',str(output/filename)]
        process=subprocess.run(argv,capture_output=True)
        (output/(label+'-stdout.log')).write_bytes(process.stdout)
        (output/(label+'-stderr.log')).write_bytes(process.stderr)
        assert process.returncode==0 and process.stdout==process.stderr==b''
        row=inspect_object(output/filename)
        assert row['object_sha256']==selected['object_sha256']
        assert row['instruction_bytes']==108 and row['pool_bytes']==20
        assert [(r['offset'],r['type'],r['symbol'],r['addend']) for r in row['relocations']]==[(112,2,'hyp_irq_stack_size',0),(120,2,'hyp_wram_arena_lo',0),(124,2,'hyp_system_stack_size',0)]
        compile_records.append({'role':label,'argv':argv,'returncode':process.returncode,'stdout_sha256':sha(process.stdout),'stderr_sha256':sha(process.stderr)})
        objects.append(row)
    bindings={'hyp_irq_stack_size':0x400,'hyp_wram_arena_lo':0x0380bc90,'hyp_system_stack_size':0x400}
    for row in objects:
        check_pool(row,bindings,expected[108:])
    explained=resolve_literals(objects[0],bindings)
    mismatches=[i for i in range(108) if explained[i]!=expected[i]]
    assert mismatches==[] and explained==expected
    readobj_argv=['/opt/homebrew/opt/llvm/bin/llvm-readobj','--file-headers','--sections','--symbols','--relocations',str(output/'compiled.o')]
    readobj=subprocess.run(readobj_argv,capture_output=True,text=True,check=True)
    assert readobj.stderr==''
    (output/'elf-readback.txt').write_text(readobj.stdout.replace(str(output/'compiled.o'),'compiled.o'))
    llvm_argv=['/opt/homebrew/opt/llvm/bin/llvm-mc','--disassemble','--triple=armv4t-none-eabi']
    disassembly=subprocess.run(llvm_argv,input=' '.join(f'0x{x:02x}' for x in explained[:108])+'\n',capture_output=True,text=True,check=True)
    assert disassembly.stderr==''
    (output/'compiled-llvm.txt').write_text(disassembly.stdout)
    native=run_native(output/'native',output/'compiled.o')
    summary={'status':native['status'],'programs':[{key:program[key] for key in ('identity','positive','wrong_binding','malformed_load_offset_rejected','malformed_elf_sha256')} for program in native['programs']]}
    for path,pin in recipe['external_sha256'].items():
        assert sha(Path(path).read_bytes())==pin,path
    assert all(sha((HERE/name).read_bytes())==pin for name,pin in package_before.items())
    proof={'status':'fixed_high_candidate_native_exact_original_images','experiment_recipe_count':1,
        'source_sha256':recipe['source_sha256'],'compile_records':compile_records,'external_sha256':recipe['external_sha256'],'package_input_sha256':package_before,
        'elf':objects[0],'hypothesis_bindings':bindings,
        'originals':[{'identity':program['identity'],'fixed_128_byte_sha256':sha(payload)} for program,payload in zip(originals['programs'],payloads,strict=True)],
        'comparison':{'instruction_mismatch_offsets':mismatches,'original_instruction_sha256':sha(expected[:108]),'compiled_instruction_sha256':sha(explained[:108]),'diagnostic_128_byte_sha256':sha(explained),'exact_128_bytes_both_programs':True},
        'native_proof_sha256':sha((output/'native/native-proof.json').read_bytes()),'native_summary':summary,
        'original_read_sha256':sha((output/'original-read.json').read_bytes()),'readback_commands':[readobj_argv,llvm_argv],
        'inputs_unchanged':True,'original_names_types_ABI_extent_version_ownership_established':False,'source_credit_bytes':0,
        'logs_sha256':{name:sha((output/name).read_bytes()) for name in ('experiment-stdout.log','experiment-stderr.log','elf-readback.txt','compiled-llvm.txt','llvm-original-high-getter.txt')}}
    (output/'trial-proof.json').write_text(json.dumps(proof,indent=2)+'\n')
    return proof


if __name__=='__main__':
    result=replay(Path(sys.argv[1]).resolve())
    print('Exact 108 instructions, five pool words with three native symbolic operands, both full original images; wrong binding and malformed load rejected. Source credit 0.')
