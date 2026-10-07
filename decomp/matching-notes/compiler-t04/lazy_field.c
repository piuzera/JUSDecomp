/* Opaque layout hypothesis constrained to observed offsets 0 and 56. */
struct Object;
struct Table {
    void (*unknown[5])(void);
    void (*populate)(struct Object *);
};
struct Object {
    struct Table *table;
    unsigned int unknown[13];
    unsigned int field;
};
typedef char field_offset_check[sizeof(struct Table *) + sizeof(unsigned int[13]) == 56 ? 1 : -1];
extern struct Object *func_02035c90(unsigned int);
unsigned int func_ov000_0214d0dc(unsigned int key) {
    struct Object *object = func_02035c90(key);
    if (object->field == 0) object->table->populate(object);
    return object->field;
}
