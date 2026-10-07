/* Independent minimal ARM32 context for the three selected musl sources. */
#ifndef DONOR_T05_STRING_H
#define DONOR_T05_STRING_H
typedef unsigned int size_t;
int memcmp(const void *, const void *, size_t);
int strcmp(const char *, const char *);
int strncmp(const char *, const char *, size_t);
typedef char donor_size_check[sizeof(size_t) == 4 ? 1 : -1];
#endif
