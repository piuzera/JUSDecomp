/* ARM32 lookup context prefix is preserved; only the two observed bounds are set. */
typedef struct RuntimeExceptionTableBounds {
    unsigned int reserved[3];
    unsigned char *start;
    unsigned char *end;
} RuntimeExceptionTableBounds;

typedef char runtime_word_width[sizeof(unsigned int) == 4 ? 1 : -1];
typedef char runtime_pointer_width[sizeof(void *) == 4 ? 1 : -1];
typedef char runtime_bounds_size[sizeof(RuntimeExceptionTableBounds) == 20 ? 1 : -1];

extern unsigned char __exception_table_start__[];
extern unsigned char __exception_table_end__[];

int __FindExceptionTable(RuntimeExceptionTableBounds *bounds)
{
    unsigned char *start = __exception_table_start__;
    unsigned char *end = __exception_table_end__;
    bounds->start = start;
    bounds->end = end;
    return 1;
}
