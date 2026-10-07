"""Reproduce a real ROM mutation at final receipt close against a fresh replay."""
from pathlib import Path
import hashlib, json, sys
from unittest.mock import patch
sys.dont_write_bytecode=True
capsule=Path(sys.argv[1]).resolve()
output=Path(sys.argv[2]).resolve()
result_path=Path(sys.argv[3])
sys.path.insert(0,str(capsule))
import reproduce
actual=Path.open
class Stream:
    def __init__(self,stream): self.stream=stream
    def __enter__(self): self.stream.__enter__();return self
    def write(self,payload): return self.stream.write(payload)
    def __exit__(self,*args):
        result=self.stream.__exit__(*args)
        path=output/'research.nds';data=bytearray(path.read_bytes());data[-1]^=1;path.write_bytes(data)
        return result
def intercept(path,*args,**kwargs):
    stream=actual(path,*args,**kwargs)
    return Stream(stream) if path==output/'trial-proof.json' and args and args[0]=='xb' else stream
with patch.object(Path,'open',intercept):
    try: receipt_path=reproduce.replay(output)
    except ValueError as error:
        assert 'research.nds' in str(error) or 'ROM' in str(error),str(error)
        result={'status':'actual_final_receipt_ROM_mutation_rejected','receipt_returned':False,'error':str(error),'actual_changed_rom_sha256':hashlib.sha256((output/'research.nds').read_bytes()).hexdigest()}
    else: raise AssertionError('changed ROM received a successful returned receipt '+str(receipt_path))
result_path.write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result,indent=2))
