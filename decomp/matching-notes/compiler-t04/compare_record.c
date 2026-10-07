/* Compare two 92-byte records as 23 words. Names remain dsd identities. */
typedef char word_size_check[sizeof(unsigned int) == 4 ? 1 : -1];
int func_02078ad0(const unsigned int *left, const unsigned int *right) {
    int count = 23;
    while (count != 0) {
        if (*left != *right) return 1;
        --count;
        ++left;
        ++right;
    }
    return 0;
}
