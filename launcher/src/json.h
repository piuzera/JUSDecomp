// json.h — minimal JSON reader/writer for the launcher (no external deps).
// Supports: null, bool, integer, double, string, array, object.
// Only used for files the launcher itself writes; parser is strict enough for
// that purpose and reports errors with byte offsets.
#pragma once

#include <cctype>
#include <cstdint>
#include <cstdio>
#include <map>
#include <stdexcept>
#include <string>
#include <vector>

namespace jz {

struct Value;

using Array = std::vector<Value>;
using Object = std::map<std::string, Value>;

struct Value {
    enum Type { Null, Bool, Int, Double, Str, Arr, Obj };
    Type t = Null;
    bool b = false;
    long long i = 0;
    double d = 0.0;
    std::string s;
    Array a;
    Object o;

    Value() {}
    Value(bool v) : t(Bool), b(v) {}
    Value(long long v) : t(Int), i(v) {}
    Value(int v) : t(Int), i(v) {}
    Value(double v) : t(Double), d(v) {}
    Value(const char* v) : t(Str), s(v ? v : "") {}
    Value(std::string v) : t(Str), s(std::move(v)) {}
    Value(std::nullptr_t) : t(Null) {}

    static Value arr() { Value v; v.t = Arr; return v; }
    static Value obj() { Value v; v.t = Obj; return v; }

    // ---- typed getters with defaults (never throw on missing keys) ----
    const Value* find(const std::string& key) const {
        if (t != Obj) return nullptr;
        auto it = o.find(key);
        return it == o.end() ? nullptr : &it->second;
    }
    std::string get_str(const std::string& key, const std::string& def = "") const {
        const Value* v = find(key);
        return (v && v->t == Str) ? v->s : def;
    }
    bool get_bool(const std::string& key, bool def = false) const {
        const Value* v = find(key);
        return (v && v->t == Bool) ? v->b : def;
    }
    long long get_int(const std::string& key, long long def = 0) const {
        const Value* v = find(key);
        if (!v) return def;
        if (v->t == Int) return v->i;
        if (v->t == Double) return (long long)v->d;
        return def;
    }
    const Array& get_arr(const std::string& key) const {
        static const Array empty;
        const Value* v = find(key);
        return (v && v->t == Arr) ? v->a : empty;
    }

    // ---- serialization ----
    static void escape(const std::string& in, std::string& out);
    void write(std::string& out, int indent, bool compact) const;
    std::string dump(int indent = 2) const {
        std::string out;
        write(out, indent, false);
        return out;
    }

    // ---- parsing ----
    static Value parse(const std::string& text);
};

struct JsonError : std::runtime_error {
    size_t offset;
    JsonError(const std::string& msg, size_t off)
        : std::runtime_error(msg), offset(off) {}
};

namespace detail {
struct Parser {
    const std::string& s;
    size_t p = 0;
    explicit Parser(const std::string& text) : s(text) {}

    [[noreturn]] void fail(const std::string& msg) {
        throw JsonError(msg + " (offset " + std::to_string(p) + ")", p);
    }
    void ws() { while (p < s.size() && std::isspace((unsigned char)s[p])) p++; }
    bool peek(char c) { ws(); return p < s.size() && s[p] == c; }
    bool consume(char c) {
        ws();
        if (p < s.size() && s[p] == c) { p++; return true; }
        return false;
    }
    void expect(char c) { if (!consume(c)) fail(std::string("expected '") + c + "'"); }
    Value value();
    Value object();
    Value array();
    Value number();
    Value string();
};
} // namespace detail

inline void Value::escape(const std::string& in, std::string& out) {
    out += '"';
    for (unsigned char c : in) {
        switch (c) {
            case '"': out += "\\\""; break;
            case '\\': out += "\\\\"; break;
            case '\b': out += "\\b"; break;
            case '\f': out += "\\f"; break;
            case '\n': out += "\\n"; break;
            case '\r': out += "\\r"; break;
            case '\t': out += "\\t"; break;
            default:
                if (c < 0x20) {
                    char buf[8];
                    std::snprintf(buf, sizeof(buf), "\\u%04x", c);
                    out += buf;
                } else {
                    out += (char)c;
                }
        }
    }
    out += '"';
}

inline void Value::write(std::string& out, int indent, bool compact) const {
    auto pad = [&](int level) {
        if (compact) return;
        out += '\n';
        out.append((size_t)level * (size_t)indent, ' ');
    };
    switch (t) {
        case Null: out += "null"; break;
        case Bool: out += b ? "true" : "false"; break;
        case Int: out += std::to_string(i); break;
        case Double: {
            char buf[40];
            std::snprintf(buf, sizeof(buf), "%.14g", d);
            out += buf;
            break;
        }
        case Str: escape(s, out); break;
        case Arr: {
            out += '[';
            for (size_t n = 0; n < a.size(); n++) {
                if (n) out += ',';
                a[n].write(out, indent, compact);
            }
            out += ']';
            break;
        }
        case Obj: {
            out += '{';
            size_t n = 0;
            for (const auto& kv : o) {
                if (n++) out += ',';
                pad(1);
                escape(kv.first, out);
                out += ':';
                if (!compact) out += ' ';
                kv.second.write(out, indent, compact);
            }
            if (!o.empty()) pad(0);
            out += '}';
            break;
        }
    }
}

namespace detail {

inline Value Parser::string() {
    expect('"');
    std::string out;
    while (p < s.size()) {
        unsigned char c = (unsigned char)s[p++];
        if (c == '"') {
            Value v; v.t = Value::Str; v.s = std::move(out); return v;
        }
        if (c == '\\') {
            if (p >= s.size()) fail("bad escape");
            char e = s[p++];
            switch (e) {
                case '"': out += '"'; break;
                case '\\': out += '\\'; break;
                case '/': out += '/'; break;
                case 'b': out += '\b'; break;
                case 'f': out += '\f'; break;
                case 'n': out += '\n'; break;
                case 'r': out += '\r'; break;
                case 't': out += '\t'; break;
                case 'u': {
                    if (p + 4 > s.size()) fail("bad \\u escape");
                    unsigned cp = 0;
                    for (int k = 0; k < 4; k++) {
                        char h = s[p++];
                        cp <<= 4;
                        if (h >= '0' && h <= '9') cp |= (unsigned)(h - '0');
                        else if (h >= 'a' && h <= 'f') cp |= (unsigned)(h - 'a' + 10);
                        else if (h >= 'A' && h <= 'F') cp |= (unsigned)(h - 'A' + 10);
                        else fail("bad hex digit in \\u");
                    }
                    // encode as UTF-8
                    if (cp < 0x80) out += (char)cp;
                    else if (cp < 0x800) {
                        out += (char)(0xC0 | (cp >> 6));
                        out += (char)(0x80 | (cp & 0x3F));
                    } else {
                        out += (char)(0xE0 | (cp >> 12));
                        out += (char)(0x80 | ((cp >> 6) & 0x3F));
                        out += (char)(0x80 | (cp & 0x3F));
                    }
                    break;
                }
                default: fail("bad escape char");
            }
        } else {
            out += (char)c;
        }
    }
    fail("unterminated string");
}

inline Value Parser::number() {
    size_t start = p;
    bool neg = false, isDouble = false;
    if (peek('-')) { p++; neg = true; }
    if (p < s.size() && s[p] == '0') p++;
    else {
        if (p >= s.size() || !std::isdigit((unsigned char)s[p])) fail("bad number");
        while (p < s.size() && std::isdigit((unsigned char)s[p])) p++;
    }
    if (p < s.size() && s[p] == '.') {
        isDouble = true; p++;
        while (p < s.size() && std::isdigit((unsigned char)s[p])) p++;
    }
    if (p < s.size() && (s[p] == 'e' || s[p] == 'E')) {
        isDouble = true; p++;
        if (p < s.size() && (s[p] == '+' || s[p] == '-')) p++;
        while (p < s.size() && std::isdigit((unsigned char)s[p])) p++;
    }
    std::string tok = s.substr(start, p - start);
    Value v;
    if (isDouble) { v.t = Value::Double; v.d = std::stod(tok); }
    else { v.t = Value::Int; v.i = std::stoll(tok); }
    return v;
}

inline Value Parser::array() {
    expect('[');
    Value v; v.t = Value::Arr;
    if (consume(']')) return v;
    for (;;) {
        v.a.push_back(value());
        if (consume(']')) break;
        expect(',');
    }
    return v;
}

inline Value Parser::object() {
    expect('{');
    Value v; v.t = Value::Obj;
    if (consume('}')) return v;
    for (;;) {
        Value key = string();
        expect(':');
        v.o[key.s] = value();
        if (consume('}')) break;
        expect(',');
    }
    return v;
}

inline Value Parser::value() {
    ws();
    if (p >= s.size()) fail("unexpected end");
    char c = s[p];
    if (c == '{') return object();
    if (c == '[') return array();
    if (c == '"') return string();
    if (c == 't') { if (s.compare(p, 4, "true") == 0) { p += 4; return Value(true); } fail("bad literal"); }
    if (c == 'f') { if (s.compare(p, 5, "false") == 0) { p += 5; return Value(false); } fail("bad literal"); }
    if (c == 'n') { if (s.compare(p, 4, "null") == 0) { p += 4; return Value(); } fail("bad literal"); }
    return number();
}

} // namespace detail

inline Value Value::parse(const std::string& text) {
    detail::Parser parser(text);
    Value v = parser.value();
    parser.ws();
    if (parser.p != text.size())
        throw JsonError("trailing content after JSON value", parser.p);
    return v;
}

} // namespace jz
