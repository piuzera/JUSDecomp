// Experimental physical ABI records. Unknown virtual signatures remain unresolved.
typedef unsigned int Word;
struct Object;
struct Wrapper { Word unknown_00; Object* field_04; };
typedef Word (*ObservedSlot)(Object*, ...);
struct Object {
    ObservedSlot* vptr;
    char unknown_04[0x34];
    Wrapper* field_38;
    Word field_3c;
    char unknown_40[0x10];
    Object* field_50;
    Word field_54;
    char unknown_58[0x10];
    Object* field_68;
};
struct Archive { Word unknown_00; Word unknown_04; Object* field_08; };
struct ContextOwner { char unknown_00[0x88]; void* field_88; };
struct Global { unsigned char byte_00; unsigned char byte_01; char unknown_02[2]; Wrapper* field_04; Object* field_08; };
struct Record {
    Wrapper* first;
    Archive* archive;
    Wrapper* wrapper;
#ifdef JUS_INIT_RECORD_PAD
    char changed_layout[JUS_INIT_RECORD_PAD];
#endif
};
struct Flags {
    ObservedSlot* vptr;
    char unknown_04[0x10];
    Word field_14, field_18, field_1c, field_20, field_24;
};
typedef char PointerWidth[sizeof(void*) == 4 ? 1 : -1];
typedef char WordWidth[sizeof(Word) == 4 ? 1 : -1];
typedef char RecordStride[sizeof(Record) == 12 ? 1 : -1];
typedef char GlobalHandleOffset[(Word)&((Global*)0)->field_04 == 4 ? 1 : -1];
typedef char GlobalManagerOffset[(Word)&((Global*)0)->field_08 == 8 ? 1 : -1];
typedef char ResourceFieldOffset[(Word)&((Object*)0)->field_38 == 0x38 ? 1 : -1];
typedef char ObjectTagOffset[(Word)&((Object*)0)->field_54 == 0x54 ? 1 : -1];
typedef char ObjectChildOffset[(Word)&((Object*)0)->field_68 == 0x68 ? 1 : -1];
typedef char FlagsExtent[sizeof(Flags) == 0x28 ? 1 : -1];
typedef char FlagsWordOffset[(Word)&((Flags*)0)->field_24 == 0x24 ? 1 : -1];
extern "C" {
extern Global data_020afc40;
extern Record data_020afc4c[];
extern const char* data_0209e050[];
extern Word data_020923b4[];
extern char data_0209dff0[], data_0209dfbc[], data_0209e258[], data_0209e244[];
extern char data_0209e26c[], data_0209e280[];
extern ObservedSlot data_0209e068[], data_02099640[];
Archive* func_02010238();
void func_0201024c(Archive*, const char*, Word);
ContextOwner* func_0203b404();
void func_0206c498(void*);
Object* func_02035e88(Word);
Object* func_02032a4c(Object*);
Wrapper* func_02011b38(Object*);
Word func_02023894(Object*, Word, Word);
void func_0206c4d4(Wrapper*, Word*);
void func_0206c514(Wrapper*, Wrapper*);
void func_020107f4(Word, Word, Word, Wrapper*);
void func_0206c54c();
void func_02023cd0(Word, Word);
void* func_0201a21c(Word, const void*, const void*, Word);
Object* func_0202f8a4(Object*, Word);
void func_0202c4ac(Flags*, const char*, const char*);
// These declarations bind code addresses only. No callback invocation type is claimed.
void func_02074540();
void func_0206c57c();
}
#define CALL0(o, slot) ((o)->vptr[(slot) / 4](o))
#define CALL1(o, slot, a) ((o)->vptr[(slot) / 4](o, a))

extern "C" void func_0206c244(Wrapper* handle) {
    data_020afc40.byte_00 = 0;
    data_020afc40.field_04 = handle;
    Record* record = data_020afc4c;
    int i = 0;
    do {
        Archive* archive = func_02010238();
        record->archive = archive;
        func_0201024c(archive, data_0209e050[i], 0);
        func_0206c498(func_0203b404()->field_88);
        Word identifier = data_020923b4[i];
        Object* resource = func_02035e88(identifier);
        if (!resource->field_38)
            CALL0(resource, 0x14);
        record->first = resource->field_38;
        Object* first = record->first->field_04;
        CALL1(first, 0x50, 1);
        Object* constructed = func_02032a4c(record->first->field_04);
        record->wrapper = func_02011b38(constructed);
        Object* contained = record->wrapper->field_04;
        contained->field_54 = 0x31305053;
        func_02023894(record->wrapper->field_04, identifier, 0);
        Object* child = record->wrapper->field_04->field_68;
        CALL0(child, 0xdc);
        Word word = 0x80000;
        func_0206c4d4(record->wrapper, &word);
        contained = record->wrapper->field_04;
        CALL1(contained, 0xdc, -1);
        contained = record->wrapper->field_04;
        CALL1(contained, 0x94, 0x100);
        if (data_020afc40.field_04)
            func_0206c514(record->wrapper, data_020afc40.field_04);
        func_020107f4(reinterpret_cast<Word>(&func_02074540), identifier, 0x400, record->wrapper);
        func_0206c54c();
        Object* archive_child = record->archive->field_08;
        CALL0(archive_child, 0x50);
        ++i;
        ++record;
    } while (i < 4);
    func_02023cd0(0x20204e47, reinterpret_cast<Word>(&func_0206c57c));
    Object* manager = static_cast<Object*>(func_0201a21c(0x20, data_0209dff0, data_0209dfbc, 0x111));
    if (manager)
        manager = func_0202f8a4(manager, 0);
    data_020afc40.field_08 = manager;
    Flags* flags = static_cast<Flags*>(func_0201a21c(0x28, data_0209e258, data_0209e244, 0x67));
    if (flags) {
        func_0202c4ac(flags, data_0209e280, data_0209e26c);
        flags->vptr = data_0209e068;
        flags->field_14 = 0;
        flags->field_18 = 0;
        flags->field_1c = 0;
        flags->field_20 = 0;
        flags->field_24 = 0x80;
        flags->vptr = data_02099640;
    }
    manager = data_020afc40.field_08;
    CALL1(manager, 0x3c, flags);
}
