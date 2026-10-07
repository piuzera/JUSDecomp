// Public synthetic ABI method, not a language-generated virtual destructor.
typedef unsigned int Word;
typedef unsigned short Halfword;
extern "C" void public_base_destroy(void*);

class PublicAbi {
public:
    Word vptr;
    unsigned char unknown_04_7f[0x7c];
    Halfword member_80;
    unsigned char unknown_82_83[2];
    PublicAbi* Destroy();
};

typedef char PointerWidth[sizeof(void*) == 4 ? 1 : -1];
typedef char WordWidth[sizeof(Word) == 4 ? 1 : -1];
typedef char HalfwordWidth[sizeof(Halfword) == 2 ? 1 : -1];
typedef char ObjectExtent[sizeof(PublicAbi) == 0x84 ? 1 : -1];
typedef char VptrOffset[(unsigned long)&((PublicAbi*)0)->vptr == 0 ? 1 : -1];
typedef char MemberOffset[(unsigned long)&((PublicAbi*)0)->member_80 == 0x80 ? 1 : -1];

PublicAbi* PublicAbi::Destroy() {
    public_base_destroy(this);
    return this;
}
