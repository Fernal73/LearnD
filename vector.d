#!/usr/bin/env rdmd
struct Vector3 {
    double x;
    double y;
    double z;

    double length() const {
        import std.math : sqrt;
        return sqrt(x * x + y * y + z * z);
    }

    // rhs will be copied
    double dot(Vector3 rhs) const {
        return x * rhs.x + y * rhs.y + z * rhs.z;
    }
}

void main() {
    auto vec1 = Vector3(10, 0, 0);
    Vector3 vec2;
    vec2.x = 0;
    vec2.y = 20;
    vec2.z = 0;

    // If a member function has no parameters,
    // the calling braces () may be omitted
    assert(vec1.length == 10);
    assert(vec2.length == 20);

    // Test the functionality for dot product
    assert(vec1.dot(vec2) == 0);

    // 1 * 1 + 2 * 1 + 3 * 1
    auto vec3 = Vector3(1, 2, 3);
    assert(vec3.dot(Vector3(1, 1, 1)) == 6);

    // 1 * 3 + 2 * 2 + 3 * 1
    assert(vec3.dot(Vector3(3, 2, 1)) == 10);
}
