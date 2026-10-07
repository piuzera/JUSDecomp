"""Independent frozen .34 public capsule and actual ELF closure."""
import copy,hashlib,json,pathlib,subprocess,sys
ROOT=pathlib.Path('/private/tmp/jus-arm7-indexed-loads-independent')
SCRATCH=pathlib.Path('/private/tmp/jus-arm7-indexed-loads-independent-proof')
PROOF=ROOT/'decomp/matching-notes/other-cpus/arm7-indexed-loads-proof'
sys.path.insert(0,str(SCRATCH));import cluster as c
sha=lambda b:hashlib.sha256(b).hexdigest()
def git(*args):return subprocess.run(['git',*args],cwd=ROOT,check=True,capture_output=True).stdout
assert git('rev-parse','HEAD').decode().strip()=='199e14ac0ca5b1effabbc37614ca0afb4056936a'
assert git('status','--porcelain')==b''
changed=git('diff','--name-status','1bc9488','HEAD').decode().splitlines()
assert len(changed)==57 and all(x.startswith('A\tdecomp/matching-notes/other-cpus/arm7-indexed-loads') for x in changed)
for line in changed:
 path=line.split('\t')[1];assert sha((ROOT/path).read_bytes())==sha(git('show','HEAD:'+path))
PUB=json.loads((PROOF/'trial-proof.json').read_text())
FRESH=json.loads((SCRATCH/'public-replay/trial-proof.json').read_text())
OWN=json.loads((SCRATCH/'native-seven-01/result.json').read_text())
a,b=copy.deepcopy(PUB),copy.deepcopy(FRESH)
for receipt in (a,b):
 for row in receipt['candidates']:
  argv=row['compile_command']['argv'];argv[9]=pathlib.Path(argv[9]).name;argv[11]=pathlib.Path(argv[11]).name
assert a==b
assert FRESH['status']=='actual_seven_MW_indexed_loads_exact_original_images'
assert FRESH['source_credit_bytes']==0 and FRESH['original_names_types_ABI_extent_version_ownership_established'] is False and FRESH['inputs_unchanged']
assert FRESH['checked_layout_sha256']=='8a518abf785a1c24756d5485ee669f64e304af20a69b0d02a889fb60410d9fcc'
objects={'lower_store':('1db6873b1ce806d32c2edffedce7a9d657418bd29a65269fd0ebb4f9dafe8362','b0bd6f1c84e3710fc704f75a614a3c90532b44d1f274d236747cc0b752772af7','build82_O4s',20,0,0),'upper_store':('a6457f199a58403507cc0262b1187ebccd1df05190d50771c6a9ae9eafa24abb','03aebe3ecc0c8fbbc1466d836bd2b659827b2a078f56c9eed1137d7abc426ccf','build114_O4p',20,0,0),'lower_getter':('fe3711c03cb2f0e0ee50a0751604766984e4a285a369290f6f159b87019bd537','9704c69afb0dcc0a31dd008c8e4f6ce8b6f91537133238b9ecfec7c6958f076b','build82_O4s',80,8,2),'upper_getter':('342ace7943b49cb8a8fc7e47497ce0ea2a33c88948b877333875744528f0cd0e','b392c58eb43db4427e075bf7757181dfc6ea5a16eb6ffb5686292d2c29fc50f1','build82_O4s',108,20,3),'lower_load':('2c264ddcef93585dbd3f0e938feef537eece386c50f899bf9db1b5aa0df92de1','f60e827b92c5839f179a1bf32ec1f9a21ec4355f69b4ec31b5b20412e82aea94','build82_O4s',20,0,0),'upper_load':('e6a1f9bb097ff25b1e91c9e14040a90cbebeeb1a0d14248124d116c05a4e0ce8','b39081472756bbcee780f3658dd8363f4da07a5bc4f86d3aa3aac3504a8e49c8','build82_O4s',20,0,0),'initializer':('b014099daa3d3dc1e2a14ca39a434726946067f448ff0e92ae5c2393bb44507e','47a79e6c15b3191c2a1d06f8124596ee94e2e42a6defdb4bf270b5820c2b5112','build82_O4s',160,4,13)}
assert [x['role'] for x in FRESH['candidates']]==list(objects)
for row in FRESH['candidates']:
 source,obj,recipe,code,pool,rels=objects[row['role']]
 assert (row['source_sha256'],row['elf']['object_sha256'],row['recipe'],row['elf']['instruction_bytes'],row['elf']['pool_bytes'],len(row['elf']['relocations']))==(source,obj,recipe,code,pool,rels)
 assert sha((PROOF/row['source']).read_bytes())==source
assert [(w['label'],w['sha256']) for w in FRESH['originals'][0]['windows']]==[('preceding_lower_load','d714db36568f87382608e68dc45eb84a63bfe2d98e3869d5c1562567987e0c6e'),('preceding_upper_load','b9133a64c254987fd068341728344b7bc29c68411d2334e0744eab80a9dac262'),('guarded_initializer','83038b37535751d27c4d0d60b283dfd8f72b63f81fbb92549ade31979ac31f9b')]
metadata=[]
for i,(pub,own) in enumerate(zip(FRESH['programs'],OWN['programs'],strict=True)):
 assert pub['identity']==own['identity']
 pp=pub['positive'];op=own['positive']
 assert pp['linked_elf_sha256']=='75ae967dce740ec4e0131c6e5af8e0cd709c04c73f2af9fd6c305230ef81ac4e'
 assert op['elf_sha256']=='46ce79deda3e6b3aca33f3d0462d76b459f59d1a8c86eecf86758d45bf30feb6'
 assert pp['image_sha256']==op['image_sha256']=='0540bd6fba14f886c542b3bfa15b1c0391b23dd4eaa3688367e1813cbc021139'
 assert pp['image_bytes']==op['image_bytes']==165552 and pp['BSS_bytes']==op['BSS_bytes']==21424
 assert [(x['source'],int(x['word'],16),x['target']) for x in pp['initializer_calls']]==[(int(x['source'],16),int(x['word'],16),int(x['target'],16)) for x in op['calls']]
 assert pp['observed_bindings']=={'subpriv':0x027f9c08,'wram':0x0380bc90,'irq':0x400,'system':0x400,'guard':0x03808430}
 assert op['observed_bindings']=={'hyp_subpriv_arena_lo':0x027f9c08,'hyp_wram_arena_lo':0x0380bc90,'hyp_irq_stack_size':0x400,'hyp_system_stack_size':0x400,'hyp_arena_initialized':0x03808430}
 assert pub['wrong_guard']['image_mismatch_offsets']==own['wrong_guard']['mismatch_offsets']==[21116]
 assert len(pub['omitted'])==len(own['omissions'])==7 and all(x['returncode']==1 for x in pub['omitted'].values()) and all(x==1 for x in own['omissions'].values())
 assert pub['wrong_callee']['native_command']['returncode']==0 and pub['wrong_callee']['strict_rejection']
 assert own['swap_actual']['mismatch_offsets']==[20672,20692,21000,21020,21040,21060,21080,21100]
 assert pub['swapped_loads']['native_command']['returncode']==0 and pub['swapped_loads']['strict_rejection']
 assert own['loadswap_actual']['mismatch_offsets']==[20928,20948] and own['loadswap_actual']['calls']==op['calls']
 assert pub['wrong_placement']['returncode']==1 and own['wrong_placement_rejected']
 assert pub['malformed_load']['rejected'] and own['malformed_load_rejected']
 pubelf=SCRATCH/f'public-replay/native/program-{i}/positive.elf';ownelf=SCRATCH/f'native-seven-01/program-{i}/positive.elf'
 ph,ps,py,pg=c.parse_elf(pubelf.read_bytes());oh,os,oy,og=c.parse_elf(ownelf.read_bytes())
 assert ph==oh and pg==og
 allocated=lambda sections,data:[(s['name'],s['vma'],s['size'],s['flags'],sha(data[s['offset']:s['offset']+s['size']]) if s['type']==1 else None) for s in sections if s['flags']&2 and s['size']]
 assert allocated(ps,pubelf.read_bytes())==allocated(os,ownelf.read_bytes())
 pm={x['name']:x['value'] for x in py};om={x['name']:x['value'] for x in oy}
 for public,ownrole,addr,size in [('lower_store','lowstore',0x037fcf04,20),('upper_store','upperstore',0x037fcf18,20),('lower_getter','lowgetter',0x037fcf2c,88),('upper_getter','highgetter',0x037fcf84,128),('lower_load','lowload',0x037fd004,20),('upper_load','highload',0x037fd018,20),('initializer','init',0x037fd02c,164)]:
  assert pm[f'__{public}_start']==om[f'__{ownrole}_start']==addr
  assert pm[f'__{public}_end']==om[f'__{ownrole}_end']==addr+size
 assert (len(pubelf.read_bytes()),len(ownelf.read_bytes()))==(167948,167908)
 metadata.append({'identity':i,'public_elf_sha256':sha(pubelf.read_bytes()),'independent_elf_sha256':sha(ownelf.read_bytes()),'equal_entry_flags_six_loads_allocated_payloads':True,'linker_marker_names_differ':True})
receipt={'status':'accepted_no_flags','public_worker_commit':'b922173aa2d12103af896b3de0eb0a25a20369af','independent_cherry_commit':git('rev-parse','HEAD').decode().strip(),'new_git_blobs':57,'git_head_pins':56,'published_receipt_sha256':sha((PROOF/'trial-proof.json').read_bytes()),'fresh_public_replay_receipt_sha256':sha((SCRATCH/'public-replay/trial-proof.json').read_bytes()),'independent_native_receipt_sha256':sha((SCRATCH/'native-seven-01/result.json').read_bytes()),'programs':metadata,'source_credit_bytes':0,'remaining_boundary':'original names, types, ABI, extent, SDK, source ownership and runtime BX/call returns unproved'}
(SCRATCH/'final-review.json').write_text(json.dumps(receipt,indent=2)+'\n')
print(json.dumps(receipt,indent=2))
