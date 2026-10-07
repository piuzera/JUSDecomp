// Public synthetic classes. These bodies do not reconstruct game functions.
#ifndef T06_EXPECT_MEMBER_OFFSET
#define T06_EXPECT_MEMBER_OFFSET 0x80
#endif

typedef unsigned int Word;
typedef unsigned short Halfword;
typedef char PointerWidth[sizeof(void*) == 4 ? 1 : -1];
typedef char WordWidth[sizeof(Word) == 4 ? 1 : -1];
typedef char HalfwordWidth[sizeof(Halfword) == 2 ? 1 : -1];

extern "C" void public_base_construct(void*, void*);
extern "C" void public_base_destroy(void*);

class PublicBase {
public:
    PublicBase(void* token);
    virtual ~PublicBase();
    unsigned char unknown_04_7f[0x7c];
};

class PublicDerived : public PublicBase {
public:
    PublicDerived(void* token);
    virtual ~PublicDerived();
    Halfword member_80;
    unsigned char unknown_82_83[2];
};

typedef char BaseExtent[sizeof(PublicBase) == 0x80 ? 1 : -1];
typedef char DerivedExtent[sizeof(PublicDerived) == 0x84 ? 1 : -1];
typedef char MemberOffset[(unsigned long)&((PublicDerived*)0)->member_80
                         == T06_EXPECT_MEMBER_OFFSET ? 1 : -1];

PublicBase::PublicBase(void* token) { public_base_construct(this, token); }
PublicBase::~PublicBase() { public_base_destroy(this); }
PublicDerived::PublicDerived(void* token) : PublicBase(token), member_80(0) {}
PublicDerived::~PublicDerived() {}
