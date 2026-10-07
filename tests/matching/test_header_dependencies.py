"""Public dependency records and controlled compiler-stage rejection fixtures."""
import hashlib
import importlib.util
import json
import os
import subprocess
import tempfile
import unittest
from pathlib import Path
from unittest.mock import patch

ROOT = Path(__file__).resolve().parents[2]
SCRIPT = ROOT / 'tools/scripts/header_dependencies.py'


def load():
    spec=importlib.util.spec_from_file_location('header_dependencies',SCRIPT)
    api=importlib.util.module_from_spec(spec);spec.loader.exec_module(api)
    return api


def digest(path): return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def win(path): return 'Z:' + str(path).replace('/', '\\').replace(' ', '\\ ')


class HeaderDependenciesTests(unittest.TestCase):
    def setUp(self):
        self.assertTrue(SCRIPT.exists(),'compiler dependency capture missing')
        self.api=load();self.tmp=tempfile.TemporaryDirectory();self.addCleanup(self.tmp.cleanup)
        self.root=Path(self.tmp.name).resolve();(self.root/'src').mkdir();(self.root/'inc space').mkdir()
        self.source=self.root/'src/public.c';self.source.write_text('#include "local.h"\n#include MACRO_HEADER\nint public_probe(void) { return VALUE + MACRO_VALUE + FORCED_VALUE; }\n')
        self.headers=[self.root/'src/local.h',self.root/'inc space/macro.h',self.root/'src/forced.h']
        for path,text in zip(self.headers,('#define VALUE 1\n','#define MACRO_VALUE 2\n','#define FORCED_VALUE 4\n')):path.write_text(text)
        self.compiler=self.root/'compiler';self.compiler.write_text('public compiler fixture')
        self.runner=self.root/'runner';self.runner.write_text('public runner fixture')
        self.output=self.root/'fresh/public.o';self.output.parent.mkdir()
        self.unit={'cpu':'arm946e','flags':['-Cpp_exceptions','off','-nostdinc','-cwd','source','-DMACRO_HEADER="macro.h"'],
                   'include_paths':['inc space'],'forced_headers':['src/forced.h'],
                   'headers':{str(p.relative_to(self.root)):digest(p) for p in self.headers}}
        self.consumed=[self.source,self.headers[2],self.headers[0],self.headers[1]]

    def record(self,paths=None,target=None):
        values=[win(p) for p in (paths or self.consumed)]
        return win(target or self.output)+': '+(' \\\r\n\t'.join(values))+' \r\n'

    def capture(self,action=None):
        def stage(command,**kwargs):
            if '-M' in command:
                return subprocess.CompletedProcess(command,0,self.record(),'')
            self.output.write_bytes(b'public object')
            self.output.with_suffix('.d').write_text(self.record())
            if action:action(command,kwargs)
            return subprocess.CompletedProcess(command,0,'','')
        with patch.object(self.api.subprocess,'run',side_effect=stage):
            return self.api.capture_and_compile(self.unit,self.root,self.source,self.output,self.compiler,self.runner,{'PATH':'public'})

    def test_windows_record_order_source_relative_macro_forced_and_spaces(self):
        parsed=self.api.parse_dependencies(self.record(),self.root,self.output,self.source)
        self.assertEqual(parsed,self.consumed)
        record='fresh\\public.o: src\\public.c \\\r\n\t'+win(self.headers[0])+'\r\n'
        self.assertEqual(self.api.parse_dependencies(record,self.root,self.output,self.source),[self.source,self.headers[0]])

    def test_capture_binds_before_after_and_exact_context(self):
        result=self.capture()
        self.assertEqual(result['status'],'passed')
        self.assertEqual(result['ordered_dependencies'],[str(p.relative_to(self.root)) for p in self.consumed])
        self.assertEqual(result['before_sha256'],result['after_sha256'])
        self.assertEqual(result['stages'][0]['returncode'],0)
        self.assertIn('-M',result['stages'][0]['command'])
        self.assertIn('-MD',result['stages'][1]['command'])
        self.assertIn('-gccdepends',result['stages'][1]['command'])
        self.assertEqual(result['include_paths'],['inc space'])
        self.assertEqual(result['forced_headers'],['src/forced.h'])
        self.assertEqual(result['source_credit'],0)

    def test_system_delimiter_is_bound_before_ordered_include_paths(self):
        self.unit['flags']=['-nostdinc','-I-','-DMACRO_HEADER="macro.h"']
        self.unit['include_paths']=['src','inc space']
        result=self.capture()
        self.assertEqual(result['status'],'passed',result.get('failure'))
        command=result['stages'][0]['command']
        self.assertLess(command.index('-I-'),command.index('-i'))
        dirs=[command[i+1] for i,value in enumerate(command) if value=='-i']
        self.assertEqual(dirs,[str(self.root/'src'),str(self.root/'inc space')])

    def test_binary_precompiled_headers_are_outside_text_dependency_scope(self):
        self.headers[0].write_bytes(b'public\x00precompiled-header')
        self.unit['headers']['src/local.h']=digest(self.headers[0])
        result=self.capture()
        self.assertEqual(result['status'],'failed')
        self.assertEqual(result['stages'],[])

    def test_declared_hash_is_checked_before_any_compiler_invocation(self):
        self.headers[0].write_text('changed before preflight')
        with patch.object(self.api.subprocess,'run') as run:
            result=self.api.capture_and_compile(self.unit,self.root,self.source,self.output,self.compiler,self.runner,{})
        run.assert_not_called();self.assertEqual(result['status'],'failed')

    def test_header_mutation_after_compilation_fails(self):
        result=self.capture(lambda *_:self.headers[0].write_text('mutated header'))
        self.assertEqual(result['status'],'failed')
        self.assertIn('changed',result['failure'])
        self.assertEqual(result['source_credit'],0)

    def test_dependency_record_change_fails_even_when_object_exists(self):
        result=self.capture(lambda *_:self.output.with_suffix('.d').write_text(self.record(list(reversed(self.consumed)))))
        self.assertEqual(result['status'],'failed')

    def test_undeclared_and_out_of_root_dependency_fail(self):
        for path in (self.root/'src/untracked.h',self.root.parent/'ambient-public.h'):
            path.write_text('ambient')
            self.addCleanup(path.unlink,missing_ok=True)
            with patch.object(self.api.subprocess,'run',return_value=subprocess.CompletedProcess([],0,self.record(self.consumed+[path]),'')):
                result=self.api.capture_and_compile(self.unit,self.root,self.source,self.output,self.compiler,self.runner,{})
            self.assertEqual(result['status'],'failed')
            self.assertEqual(len(result['stages']),1)

    def test_malformed_ambiguous_wrong_target_and_drive_fail(self):
        for record in ('',self.record()+self.record(),self.record(target=self.root/'wrong.o'),
                       self.record(self.consumed+[self.headers[0]]),'public.o: C:\\ambient\\header.h\n',
                       'public.o: $(AMBIENT)\n','public.o other.o: src/public.c\n'):
            with self.subTest(record=record),self.assertRaises(ValueError):
                self.api.parse_dependencies(record,self.root,self.output,self.source)

    def test_missing_depfile_or_preexisting_output_never_reuses(self):
        result=self.capture(lambda *_:self.output.with_suffix('.d').unlink())
        self.assertEqual(result['status'],'failed')
        self.output.write_bytes(b'old')
        with patch.object(self.api.subprocess,'run') as run:
            result=self.api.capture_and_compile(self.unit,self.root,self.source,self.output,self.compiler,self.runner,{})
        self.assertEqual(result['status'],'failed');run.assert_not_called()

    def test_ambient_environment_and_raw_command_overrides_fail(self):
        for extra in (['-Iambient'],['-i','ambient'],['-prefix','ambient'],['-MMD'],['-gccdep'],['-o','other.o'],['@args.rsp'],['-stdinc']):
            with self.subTest(flags=extra):
                self.unit['flags']=['-nostdinc',*extra]
                self.assertEqual(self.capture()['status'],'failed')
        self.unit['flags']=['-nostdinc']
        result=self.api.capture_and_compile(self.unit,self.root,self.source,self.output,self.compiler,self.runner,{'MWCIncludes':'ambient'})
        self.assertEqual(result['status'],'failed')

    def test_symlink_header_escapes_and_missing_declaration_fail(self):
        outsider=self.root.parent/'outside-public.h';outsider.write_text('outside');self.addCleanup(outsider.unlink,missing_ok=True)
        self.headers[0].unlink();self.headers[0].symlink_to(outsider)
        self.assertEqual(self.capture()['status'],'failed')
        self.headers[0].unlink();self.headers[0].write_text('#define VALUE 1\n')
        del self.unit['headers']['src/local.h']
        self.assertEqual(self.capture()['status'],'failed')

    def test_source_build_header_unit_uses_capture_and_atomic_failure(self):
        spec=importlib.util.spec_from_file_location('source_build',ROOT/'tools/scripts/source_build.py')
        api=importlib.util.module_from_spec(spec);spec.loader.exec_module(api)
        fixtures=importlib.util.spec_from_file_location('fixture_source',ROOT/'tests/matching/test_source_build.py')
        helper=importlib.util.module_from_spec(fixtures);fixtures.loader.exec_module(helper)
        refs=self.root/'refs';refs.mkdir();(refs/'public.o').write_bytes(helper.fixture())
        unit=dict(self.unit,module='ov000',object='public.o',source='src/public.c',functions=['public_func'],category='game',
                  compiler={'package':'public','sha256':digest(self.compiler),'runner_sha256':digest(self.runner)},
                  abi={'language':'C','instruction_mode':'arm','endianness':'little','pointer_bits':32,'settings':'pinned compiler defaults'})
        manifest={'schema_version':1,'translation_units':[unit]}
        def stage(command,**kwargs):
            target=Path(command[command.index('-o')+1])
            record=self.record(target=target)
            if '-M' not in command:
                target.write_bytes(helper.fixture());target.with_suffix('.d').write_text(record)
            return subprocess.CompletedProcess(command,0,record if '-M' in command else '','')
        with patch.object(api.subprocess,'run',side_effect=stage):
            result=api.build_sources(manifest,self.root,self.root/'source-good',refs,self.compiler,self.runner)
        self.assertEqual(result['status'],'passed',result.get('failure'))
        self.assertEqual(result['units'][0]['dependencies']['status'],'passed')
        self.assertIn(str(self.headers[0]),result['input_hashes'])
        original_hash=digest(refs/'public.o')
        def mutating(command,**kwargs):
            result=stage(command,**kwargs)
            if '-MD' in command:self.headers[0].write_text('changed during compile')
            return result
        with patch.object(api.subprocess,'run',side_effect=mutating):
            failure=api.build_sources(manifest,self.root,self.root/'source-bad',refs,self.compiler,self.runner)
        self.assertEqual(failure['status'],'failed');self.assertEqual(failure['accepted_units'],0);self.assertEqual(failure['objects'],{})
        self.assertEqual(digest(refs/'public.o'),original_hash)

    def test_preflight_mutation_and_context_mutation_reject(self):
        def mutate_preflight(command,**kwargs):
            self.headers[0].write_text('changed by preflight')
            return subprocess.CompletedProcess(command,0,self.record(),'')
        with patch.object(self.api.subprocess,'run',side_effect=mutate_preflight):
            result=self.api.capture_and_compile(self.unit,self.root,self.source,self.output,self.compiler,self.runner,{})
        self.assertEqual(result['status'],'failed');self.assertEqual(len(result['stages']),1)
        self.headers[0].write_text('#define VALUE 1\n')
        result=self.capture(lambda *_:self.unit['flags'].append('-DCHANGED=1'))
        self.assertEqual(result['status'],'failed');self.assertIn('context',result['failure'])

    def test_unused_declared_header_and_symlink_depfile_are_rejected(self):
        unused=self.root/'src/unused.h';unused.write_text('unused')
        self.unit['headers']['src/unused.h']=digest(unused)
        self.assertEqual(self.capture()['status'],'failed')
        del self.unit['headers']['src/unused.h']
        def symlink_depfile(*_):
            dep=self.output.with_suffix('.d');dep.unlink();dep.symlink_to(self.source)
        self.assertEqual(self.capture(symlink_depfile)['status'],'failed')

    @unittest.skipUnless(os.environ.get('JUS_MW_COMPILER') and os.environ.get('JUS_MW_RUNNER'),'private pinned MW tools not requested')
    def test_actual_mw_header_bearing_public_fixture(self):
        result=self.api.capture_and_compile(self.unit,self.root,self.source,self.output,Path(os.environ['JUS_MW_COMPILER']),Path(os.environ['JUS_MW_RUNNER']),
                 {k:v for k,v in os.environ.items() if not k.upper().startswith(('MWC','MWARM'))})
        self.assertEqual(result['status'],'passed',result.get('failure'))
        self.assertEqual(result['ordered_dependencies'],[str(p.relative_to(self.root)) for p in self.consumed])
        self.assertTrue(self.output.is_file())
        self.assertEqual(result['before_sha256'],result['after_sha256'])

    @unittest.skipUnless(os.environ.get('JUS_MW_COMPILER') and os.environ.get('JUS_MW_RUNNER'),'private pinned MW tools not requested')
    def test_actual_header_source_gate_and_changed_context_zero_acceptance(self):
        spec=importlib.util.spec_from_file_location('source_build',ROOT/'tools/scripts/source_build.py')
        api=importlib.util.module_from_spec(spec);spec.loader.exec_module(api)
        compiler,runner=Path(os.environ['JUS_MW_COMPILER']),Path(os.environ['JUS_MW_RUNNER'])
        refs=self.root/'reference';refs.mkdir();reference=refs/'public.o'
        command=[str(runner),str(compiler),'-c','-proc','arm946e',*self.unit['flags'],'-i',str(self.root/'inc space'),
                 '-include','Z:'+self.headers[2].as_posix(),'-o',str(reference),str(self.source)]
        completed=subprocess.run(command,cwd=self.root,capture_output=True,text=True)
        self.assertEqual(completed.returncode,0,completed.stdout+completed.stderr)
        before=digest(reference)
        unit=dict(self.unit,module='ov000',object='public.o',source='src/public.c',functions=['public_probe'],category='game',
                  compiler={'package':'2.0/base','sha256':digest(compiler),'runner_sha256':digest(runner)},
                  abi={'language':'C','instruction_mode':'arm','endianness':'little','pointer_bits':32,'settings':'pinned compiler defaults'})
        manifest={'schema_version':1,'translation_units':[unit]}
        good=api.build_sources(manifest,self.root,self.root/'actual-good',refs,compiler,runner)
        self.assertEqual(good['status'],'passed',good.get('failure'))
        unit['flags']=[flag.replace('macro.h','missing.h') for flag in unit['flags']]
        bad=api.build_sources(manifest,self.root,self.root/'actual-bad',refs,compiler,runner)
        self.assertEqual(bad['status'],'failed');self.assertEqual(bad['accepted_units'],0);self.assertEqual(bad['objects'],{})
        self.assertEqual(digest(reference),before)

    @unittest.skipUnless(os.environ.get('JUS_MW_COMPILER') and os.environ.get('JUS_MW_RUNNER'),'private pinned MW tools not requested')
    def test_actual_mw_angle_include_with_declared_system_order(self):
        self.source.write_text('#include <local.h>\n#include MACRO_HEADER\nint public_probe(void) { return VALUE + MACRO_VALUE + FORCED_VALUE; }\n')
        self.unit['flags']=['-Cpp_exceptions','off','-nostdinc','-I-','-DMACRO_HEADER=<macro.h>']
        self.unit['include_paths']=['src','inc space']
        result=self.api.capture_and_compile(self.unit,self.root,self.source,self.output,Path(os.environ['JUS_MW_COMPILER']),Path(os.environ['JUS_MW_RUNNER']),
                 {k:v for k,v in os.environ.items() if not k.upper().startswith(('MWC','MWARM'))})
        self.assertEqual(result['status'],'passed',result.get('failure'))
        self.assertEqual(result['ordered_dependencies'],[str(p.relative_to(self.root)) for p in self.consumed])


if __name__=='__main__':unittest.main()
