"""Independent committed .33 closure and real linked-artifact review."""
import copy,hashlib,json,pathlib,subprocess,sys
ROOT=pathlib.Path('/private/tmp/jus-arm7-arena-init-independent')
SCRATCH=pathlib.Path('/private/tmp/jus-arm7-arena-init-independent-proof')
PROOF=ROOT/'decomp/matching-notes/other-cpus/arm7-arena-init-proof'
sys.path.insert(0,str(SCRATCH));import cluster as c
sha=lambda b:hashlib.sha256(b).hexdigest()
def git(*args):return subprocess.run(['git',*args],cwd=ROOT,check=True,capture_output=True).stdout
assert git('rev-parse','HEAD').decode().strip()=='294ebf00320c39dc3a410ae30a19c4286a13cebb'
assert git('status','--porcelain')==b''
changed=git('diff','--name-status','2a44091','HEAD').decode().splitlines()
assert len(changed)==50 and all(line.startswith('A\tdecomp/matching-notes/other-cpus/arm7-arena-init') for line in changed)
for line in changed:
 p=line.split('\t')[1];assert sha((ROOT/p).read_bytes())==sha(git('show','HEAD:'+p))
PUB=json.loads((PROOF/'trial-proof.json').read_text())
FRESH=json.loads((SCRATCH/'public-replay/trial-proof.json').read_text())
OWN=json.loads((SCRATCH/'native-init-02/result.json').read_text())
a,b=copy.deepcopy(PUB),copy.deepcopy(FRESH)
for x in (a,b):
 for row in x['candidates']:
  argv=row['compile_command']['argv'];argv[9]=pathlib.Path(argv[9]).name;argv[11]=pathlib.Path(argv[11]).name
assert a==b
assert FRESH['status']=='actual_five_MW_arena_initializer_exact_original_images'
assert FRESH['source_credit_bytes']==0 and FRESH['original_names_types_ABI_extent_version_ownership_established'] is False and FRESH['inputs_unchanged']
assert FRESH['checked_layout_sha256']=='8a518abf785a1c24756d5485ee669f64e304af20a69b0d02a889fb60410d9fcc'
expect=[('lower_store','1db6873b1ce806d32c2edffedce7a9d657418bd29a65269fd0ebb4f9dafe8362','b0bd6f1c84e3710fc704f75a614a3c90532b44d1f274d236747cc0b752772af7','build82_O4s',20,0,0),('upper_store','a6457f199a58403507cc0262b1187ebccd1df05190d50771c6a9ae9eafa24abb','03aebe3ecc0c8fbbc1466d836bd2b659827b2a078f56c9eed1137d7abc426ccf','build114_O4p',20,0,0),('lower_getter','fe3711c03cb2f0e0ee50a0751604766984e4a285a369290f6f159b87019bd537','9704c69afb0dcc0a31dd008c8e4f6ce8b6f91537133238b9ecfec7c6958f076b','build82_O4s',80,8,2),('upper_getter','342ace7943b49cb8a8fc7e47497ce0ea2a33c88948b877333875744528f0cd0e','b392c58eb43db4427e075bf7757181dfc6ea5a16eb6ffb5686292d2c29fc50f1','build82_O4s',108,20,3),('initializer','b014099daa3d3dc1e2a14ca39a434726946067f448ff0e92ae5c2393bb44507e','47a79e6c15b3191c2a1d06f8124596ee94e2e42a6defdb4bf270b5820c2b5112','build82_O4s',160,4,13)]
for row,(role,source,obj,recipe,code,pool,relocs) in zip(FRESH['candidates'],expect,strict=True):
 assert (row['role'],row['source_sha256'],row['elf']['object_sha256'],row['recipe'],row['elf']['instruction_bytes'],row['elf']['pool_bytes'],len(row['elf']['relocations']))==(role,source,obj,recipe,code,pool,relocs)
 assert sha((PROOF/row['source']).read_bytes())==source
assert [w['label'] for w in FRESH['originals'][0]['windows']]==['preceding_lower_load','preceding_upper_load','guarded_initializer']
assert [w['sha256'] for w in FRESH['originals'][0]['windows']]==['d714db36568f87382608e68dc45eb84a63bfe2d98e3869d5c1562567987e0c6e','b9133a64c254987fd068341728344b7bc29c68411d2334e0744eab80a9dac262','83038b37535751d27c4d0d60b283dfd8f72b63f81fbb92549ade31979ac31f9b']
meta=[]
for i,(pub,own) in enumerate(zip(FRESH['programs'],OWN['programs'],strict=True)):
 assert pub['identity']==own['identity']
 pp=pub['positive'];op=own['positive']
 assert pp['linked_elf_sha256']=='ce8c2d2566962edb4df29af9bccae294d135656ddca4b46fab7d85163dbc5267'
 assert op['elf_sha256']=='5c3e9f36964f1bb9f40446fa68f5949f76a95472d35b84c169ceb56445ce2739'
 assert pp['image_sha256']==op['image_sha256']=='0540bd6fba14f886c542b3bfa15b1c0391b23dd4eaa3688367e1813cbc021139'
 assert pp['image_bytes']==op['image_bytes']==165552 and pp['BSS_bytes']==op['BSS_bytes']==21424
 assert len(pp['initializer_calls'])==len(op['calls'])==12
 assert [(x['source'],int(x['word'],16),x['target']) for x in pp['initializer_calls']]==[(int(x['source'],16),int(x['word'],16),int(x['target'],16)) for x in op['calls']]
 assert pub['wrong_guard']['image_mismatch_offsets']==own['wrong_guard']['mismatch_offsets']==[21116]
 assert all(v['returncode']==1 for v in pub['omitted'].values()) and all(v==1 for v in own['omissions'].values())
 assert pub['wrong_callee']['native_command']['returncode']==0 and pub['wrong_callee']['strict_rejection']
 assert own['swap_actual']['mismatch_offsets']==[20672,20692,21000,21020,21040,21060,21080,21100]
 assert pub['wrong_placement']['returncode']==1 and own['wrong_placement_rejected']
 assert pub['malformed_load']['rejected'] and own['malformed_load_rejected']
 pubelf=SCRATCH/f'public-replay/native/program-{i}/positive.elf';ownelf=SCRATCH/f'native-init-02/program-{i}/positive.elf'
 ah,asec,asym,aseg=c.parse_elf(pubelf.read_bytes());bh,bsec,bsym,bseg=c.parse_elf(ownelf.read_bytes())
 assert ah==bh and aseg==bseg
 allocated=lambda sec,data:[(s['name'],s['vma'],s['size'],s['flags'],sha(data[s['offset']:s['offset']+s['size']]) if s['type']==1 else None) for s in sec if s['flags']&2 and s['size']]
 assert allocated(asec,pubelf.read_bytes())==allocated(bsec,ownelf.read_bytes())
 pa={s['name']:s['value'] for s in asym};oa={s['name']:s['value'] for s in bsym}
 for public,ownrole,addr,size in [('lower_store','lowstore',0x037fcf04,20),('upper_store','upperstore',0x037fcf18,20),('lower_getter','lowgetter',0x037fcf2c,88),('upper_getter','highgetter',0x037fcf84,128),('initializer','init',0x037fd02c,164)]:
  assert pa[f'__{public}_start']==oa[f'__{ownrole}_start']==addr
  assert pa[f'__{public}_end']==oa[f'__{ownrole}_end']==addr+size
 assert len(pubelf.read_bytes())==167632 and len(ownelf.read_bytes())==167600
 meta.append({'identity':i,'public_elf_sha256':sha(pubelf.read_bytes()),'independent_elf_sha256':sha(ownelf.read_bytes()),'entry_flags_six_segments_allocated_payloads_equal':True,'different_linker_marker_names':True})
receipt={'status':'accepted_no_flags','public_worker_commit':'1f11e25d2d43300a22511c684d9f7210b05ab374','independent_cherry_commit':git('rev-parse','HEAD').decode().strip(),'new_git_blobs':50,'git_head_pins':49,'published_receipt_sha256':sha((PROOF/'trial-proof.json').read_bytes()),'fresh_public_replay_receipt_sha256':sha((SCRATCH/'public-replay/trial-proof.json').read_bytes()),'independent_native_receipt_sha256':sha((SCRATCH/'native-init-02/result.json').read_bytes()),'programs':meta,'source_credit_bytes':0,'remaining_boundary':'original names, types, ABI, extent, version, source ownership, call returns and BX unresolved'}
(SCRATCH/'final-review.json').write_text(json.dumps(receipt,indent=2)+'\n')
print(json.dumps(receipt,indent=2))
