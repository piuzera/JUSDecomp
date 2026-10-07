/* Experimental instruction-derived semantics; no source promotion. */
typedef char word_size_check[sizeof(unsigned int) == 4 ? 1 : -1];
typedef char pointer_size_check[sizeof(void *) == 4 ? 1 : -1];
struct Entry { unsigned short key, flags; };
extern void func_020517fc(void *, int, unsigned int);
void func_02078aa0(void *record) {
    struct Entry *entry = (struct Entry *)record;
    int count = 16;
    func_020517fc(record, 0, 92);
    do { entry->key = 0xffff; ++entry; } while (--count > 0);
}
