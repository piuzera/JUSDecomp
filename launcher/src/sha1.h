// sha1.h — self-contained SHA-1 (FIPS 180-1) for ROM verification.
#pragma once

#include <cstdint>
#include <cstdio>
#include <cstring>
#include <string>

namespace jz {

class Sha1 {
public:
    Sha1() { reset(); }

    void reset() {
        h[0] = 0x67452301u; h[1] = 0xEFCDAB89u; h[2] = 0x98BADCFEu;
        h[3] = 0x10325476u; h[4] = 0xC3D2E1F0u;
        total = 0; buf_len = 0;
    }

    void update(const void* data, size_t len) {
        const uint8_t* p = (const uint8_t*)data;
        total += len;
        while (len > 0) {
            size_t take = 64 - buf_len;
            if (take > len) take = len;
            std::memcpy(buf + buf_len, p, take);
            buf_len += take;
            p += take;
            len -= take;
            if (buf_len == 64) { process(buf); buf_len = 0; }
        }
    }

    // Streams the file, invoking progress(bytes_done, total) periodically.
    bool hash_file(const std::wstring& path,
                   void (*progress)(long long, long long)) {
        FILE* f = _wfopen(path.c_str(), L"rb");
        if (!f) return false;
        long long total_bytes;
        _fseeki64(f, 0, SEEK_END);
        total_bytes = _ftelli64(f);
        _fseeki64(f, 0, SEEK_SET);

        uint8_t chunk[1 << 16];
        long long done = 0;
        size_t n;
        while ((n = std::fread(chunk, 1, sizeof(chunk), f)) > 0) {
            update(chunk, n);
            done += (long long)n;
            if (progress) progress(done, total_bytes);
        }
        std::fclose(f);
        return std::ferror(f) == 0;
    }

    std::string hexdigest() {
        finalize();
        char out[41];
        for (int i = 0; i < 5; i++)
            std::snprintf(out + i * 8, 9, "%08x", h[i]);
        return std::string(out, 40);
    }

private:
    void process(const uint8_t* block) {
        uint32_t w[80];
        for (int i = 0; i < 16; i++)
            w[i] = (uint32_t)block[i * 4] << 24 | (uint32_t)block[i * 4 + 1] << 16 |
                   (uint32_t)block[i * 4 + 2] << 8 | block[i * 4 + 3];
        for (int i = 16; i < 80; i++) {
            uint32_t x = w[i - 3] ^ w[i - 8] ^ w[i - 14] ^ w[i - 16];
            w[i] = (x << 1) | (x >> 31);
        }
        uint32_t a = h[0], b = h[1], c = h[2], d = h[3], e = h[4];
        for (int i = 0; i < 80; i++) {
            uint32_t f, k;
            if (i < 20) { f = (b & c) | (~b & d); k = 0x5A827999u; }
            else if (i < 40) { f = b ^ c ^ d; k = 0x6ED9EBA1u; }
            else if (i < 60) { f = (b & c) | (b & d) | (c & d); k = 0x8F1BBCDCu; }
            else { f = b ^ c ^ d; k = 0xCA62C1D6u; }
            uint32_t tmp = ((a << 5) | (a >> 27)) + f + e + k + w[i];
            e = d; d = c; c = (b << 30) | (b >> 2); b = a; a = tmp;
        }
        h[0] += a; h[1] += b; h[2] += c; h[3] += d; h[4] += e;
    }

    void finalize() {
        uint64_t bits = total * 8;
        uint8_t pad[72] = {0x80};
        size_t pad_len = (buf_len < 56) ? 56 - buf_len : 120 - buf_len;
        for (size_t i = 0; i < 8; i++)
            pad[pad_len + i] = (uint8_t)(bits >> (56 - i * 8));
        update(pad, pad_len + 8);
        total = 0; // avoid double-counting in future updates
    }

    uint32_t h[5];
    uint64_t total;
    uint8_t buf[64];
    size_t buf_len;
};

} // namespace jz
