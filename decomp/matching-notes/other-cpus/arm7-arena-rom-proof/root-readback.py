"""Read actual task35 ROM, write inputs, ELF loads and captured provenance."""
import hashlib, json, struct, sys
from pathlib import Path
if not __debug__: raise ValueError('readback requires Python assertions')
sha = lambda data: hashlib.sha256(data).hexdigest()

def read(path, layout, program):
 data = path.read_bytes()
 h = struct.unpack_from('<16sHHIIIIIHHHHHH', data)
 assert h[1:3] == (2,40) and h[4] == layout['entry']
 sections = [struct.unpack_from('<IIIIIIIIII',data,h[6]+i*h[11]) for i in range(h[12])]
 strings_sec = sections[h[13]]
 strings = data[strings_sec[4]:strings_sec[4]+strings_sec[5]]
 def name(s,o): return s[o:s.index(b'\0',o)].decode()
 named = {name(strings,s[0]):s for s in sections}
 assert len([s for s in sections if s[2]&2 and s[5]])==6
 assert not any('.exceptix' in n for n,s in named.items() if s[2]&2 and s[5])
 symtab = named['.symtab']; symstr_sec = sections[symtab[6]]
 symstr = data[symstr_sec[4]:symstr_sec[4]+symstr_sec[5]]
 symbols = {}
 for o in range(symtab[4],symtab[4]+symtab[5],16):
  s=struct.unpack_from('<IIIBBH',data,o); symbols[name(symstr,s[0])] = s
 bindings = {key:symbols[key][1] for key in ['hyp_subpriv_arena_lo','hyp_wram_arena_lo','hyp_irq_stack_size','hyp_system_stack_size','hyp_arena_initialized']}
 assert {k:v for k,v in bindings.items() if k!='hyp_arena_initialized'} == {'hyp_subpriv_arena_lo':0x027f9c08,'hyp_wram_arena_lo':0x0380bc90,'hyp_irq_stack_size':1024,'hyp_system_stack_size':1024}
 expected=program[layout['image_offset']:layout['image_offset']+layout['image_bytes']]
 reconstructed=bytearray(len(expected)); coverage=bytearray(len(expected)); loads=[]
 bss=0
 for i in range(h[10]):
  seg=struct.unpack_from('<IIIIIIII',data,h[5]+i*h[9]); typ,off,vma,lma,files,mem,flags,align=seg
  assert typ==1 and align==4 and files<=mem and off+files<=len(data)
  matches=[(n,s) for n,s in named.items() if s[2]&2 and s[5] and s[3]==vma and s[5]==mem]
  assert len(matches)==1
  n,s=matches[0]; assert s[4]==off and s[8]==4
  if files:
   assert s[1]==1 and files==mem
   target=lma-layout['base']; assert 0<=target and target+files<=len(expected)
   assert not any(coverage[target:target+files])
   coverage[target:target+files]=bytes([1])*files
   reconstructed[target:target+files]=data[off:off+files]
  else:
   assert s[1]==8; bss+=mem
  loads.append({'section':n,'record':seg,'section_flags':s[2],'payload_sha256':sha(data[off:off+files])})
 assert h[10]==6 and bss==21424 and all(coverage)
 region=layout['regions'][1]; stored=region['stored_extent']['start']; runtime=region['runtime_base']
 def physical(vma): return stored+vma-runtime
 init=bytes(reconstructed[physical(0x037fd02c):physical(0x037fd0d0)])
 calls=[]
 for o in [32,44,52,64,72,84,92,104,112,124,132,144]:
  word=struct.unpack_from('<I',init,o)[0];assert word>>24==0xeb
  d=word&0xffffff;d=d-(1<<24) if d&(1<<23) else d
  calls.append({'source':0x037fd02c+o,'word':hex(word),'target':0x037fd02c+o+8+4*d})
 assert struct.unpack_from('<I',init,160)[0]==bindings['hyp_arena_initialized']
 assert reconstructed[:physical(0x037fcf04)]==expected[:physical(0x037fcf04)]
 assert reconstructed[physical(0x037fd0d0):]==expected[physical(0x037fd0d0):]
 differences=[i for i,(a,b) in enumerate(zip(expected,reconstructed)) if a!=b]
 funcs={k:{'address':symbols[k][1],'bytes':symbols[k][2],'type':symbols[k][3]&15} for k in ['arm7_low_store_trial','arm7_store_trial','arm7_low_getter_trial','arm7_high_getter_trial','arm7_low_load_trial','arm7_high_load_trial','arm7_arena_init_trial']}
 return {'elf_sha256':sha(data),'image_sha256':sha(reconstructed),'image_bytes':len(reconstructed),'image_differences':differences,'entry':h[4],'flags':h[7],'loads':loads,'BSS_bytes':bss,'bindings':bindings,'functions':funcs,'initializer_calls':calls,'noncandidate_bytes_unchanged':True,'fixed_load_words':[hex(struct.unpack_from('<I',reconstructed,physical(a))[0]) for a in [0x037fd010,0x037fd024]]}


output=Path(sys.argv[1]).resolve()
target=Path(sys.argv[2])
receipt=json.loads((output/'trial-proof.json').read_bytes())
original=Path('/Users/djdjo/Documents/mine/rom/jus.nds').read_bytes()
rebuilt=(output/'research.nds').read_bytes()
assert rebuilt==original and len(rebuilt)==67108864
assert sha(rebuilt)==receipt['rom']['sha256']=='a9c9bf89e6d99548b7c87e822b217c3fb74ef25186535b06193a6fb73d0d6d27'
assert [s['name'] for s in receipt['stages']]==['parent_verification','arm7_native_baselines','child_arm9_native_roundtrip','research_trial','integrated_input_gate','research_pack','final_freshness']
assert all(s['status']=='passed' for s in receipt['stages'])
assert receipt['source_credit']=={'canonical':304,'arm7':0,'global_percent':None}
for name,digest in receipt['artifact_hashes'].items():
 path=output/name
 assert path.is_file() and not path.is_symlink() and path.resolve().is_relative_to(output)
 assert path.stat().st_mtime_ns>=receipt['started_ns'] and sha(path.read_bytes())==digest
for name,digest in receipt['input_sha256'].items():
 assert sha(Path(name).read_bytes())==digest
assert {name:receipt['artifact_hashes']['trial/'+name] for name in receipt['trial_artifact_sha256']}==receipt['trial_artifact_sha256']
for name,digest in receipt['trial_artifact_sha256'].items(): assert sha((output/'trial'/name).read_bytes())==digest
parent=json.loads((output/'parent/report.json').read_bytes())
assert len(parent['stages'])==19 and parent['source_coverage']['matched_source_bytes']==304
for name,digest in receipt['parent_outputs'].items(): assert sha((output/'parent'/name).read_bytes())==digest
checkpoint=json.loads((output/'module-checkpoint.json').read_bytes())
assert len(checkpoint['stages'])==19 and 'finished_ns' not in checkpoint and 'rom_roundtrip' not in checkpoint
layout_data=Path(sys.argv[3]).read_bytes()
assert sha(layout_data)=='8a518abf785a1c24756d5485ee669f64e304af20a69b0d02a889fb60410d9fcc'
layouts=json.loads(layout_data)
child_start,child_end=0x23b800,0x4464c8
child=original[child_start:child_end]
assert sha(child)=='1f68f8a95818ca23e359aa24ab21b7353b6e3515964957f0f519caaaa6ec4986'
writes=receipt['research_pack']['writes']
assert len(writes)==20
spans=sorted((w['rom_offset'],w['rom_offset']+w['size_bytes'])for w in writes)
assert all(a[1]<=b[0]for a,b in zip(spans,spans[1:]))
for w in writes:
 assert sha(rebuilt[w['rom_offset']:w['rom_offset']+w['size_bytes']])==w['sha256']
for w in writes[:17]:
 assert sha((output/w['input_file']).read_bytes())==w['sha256']
child_write=writes[17]
child_image=Path(child_write['input_file']).read_bytes()
assert sha(child_image)==child_write['image_sha256']==sha(child)
slice_start=child_write['image_slice_offset']
assert sha(child_image[slice_start:slice_start+child_write['size_bytes']])==child_write['sha256']
assert child_start+slice_start==child_write['rom_offset']
assert sha((output/'parent/child-arm9/native-link/linked.elf').read_bytes())==child_write['elf_sha256']
expected_functions={'arm7_low_store_trial':(0x037fcf04,20),'arm7_store_trial':(0x037fcf18,20),'arm7_low_getter_trial':(0x037fcf2c,88),'arm7_high_getter_trial':(0x037fcf84,128),'arm7_low_load_trial':(0x037fd004,20),'arm7_high_load_trial':(0x037fd018,20),'arm7_arena_init_trial':(0x037fd02c,164)}
native=[]
candidates=receipt['research_pack']['trial']['candidates']
assert len(candidates)==7 and sum(c['bytes'] for c in candidates)==460
for c in candidates:
 object_data=(output/'trial'/(c['role']+'.o')).read_bytes()
 assert sha(object_data)==c['elf']['object_sha256'] and len(object_data)==c['elf']['object_bytes']
 object_header=struct.unpack_from('<16sHHIIIIIHHHHHH',object_data)
 assert object_header[1:3]==(1,40) and object_header[7]==c['elf']['flags']==0x02100000
 assert sha((output/'trial'/Path(c['source']).name).read_bytes())==c['source_sha256']
 assert json.loads((output/'trial'/(c['role']+'-compile.json')).read_bytes())==c['compile_command']
 assert c['compile_command']['returncode']==0 and not c['compile_command']['stdout'] and not c['compile_command']['stderr']
for index,(layout,program,write)in enumerate(zip(layouts,[original,child],writes[18:],strict=True)):
 assert write['identity']==layout['identity'] and write['native_program_index']==index
 assert write['rom_offset']==(0 if index==0 else child_start)+layout['image_offset']
 assert write['native_readback']==f'/research_pack/trial/programs/{index}/actual_readback'
 row=read(output/write['input_file'],layout,program)
 assert row['elf_sha256']==write['elf_sha256']==receipt['research_pack']['trial']['programs'][index]['elf_sha256']
 assert row['image_sha256']==write['sha256'] and row['image_differences']==[]
 assert row['flags']==0x05000200 and row['bindings']['hyp_arena_initialized']==0x03808430
 assert row['fixed_load_words']==['0xe5900da0','0xe5900dc4']
 assert [c['target']for c in row['initializer_calls']]==[0x037fcf84,0x037fcf18,0x037fcf2c,0x037fcf04]*3
 assert {k:(v['address'],v['bytes'])for k,v in row['functions'].items()}==expected_functions
 assert all(v['type']==2 for v in row['functions'].values())
 native.append(row)
result={'status':'actual_fresh_artifact_readback_passed','rom_sha256':sha(rebuilt),'rom_bytes':len(rebuilt),'child_sha256':sha(child),'experiment_stages':7,'parent_stages':19,'module_checkpoint_stages':19,'writes':writes,'output_artifacts_checked':len(receipt['artifact_hashes']),'inputs_checked':len(receipt['input_sha256']),'parent_outputs_checked':receipt['parent_outputs'],'native_elf_readback':native,'source_credit':receipt['source_credit']}
target.write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:v for k,v in result.items()if k not in ('writes','native_elf_readback','parent_outputs_checked')},indent=2))
