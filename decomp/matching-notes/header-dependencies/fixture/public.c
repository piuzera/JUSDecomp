#include "record.h"
#include PUBLIC_CONSTANT_HEADER
unsigned public_header_probe(const struct PublicRecord *record) {
    return record->value + PUBLIC_MACRO_BIAS + PUBLIC_FORCED_BIAS;
}
