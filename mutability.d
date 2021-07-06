#!/usr/bin/env rdmd
import std.stdio : writeln;

void main()
{
    /**
    * Variables are mutable by default and
    * editing them is allowed:
    */
    int m = 100; // mutable
    writeln("m: ", typeof(m).stringof);
    m = 10; // fine

    /**
    * Pointing to mutable memory:
    */
    // A const pointer to mutable memory is
    // allowed
    const int* cm = &m;
    writeln("cm: ", typeof(cm).stringof);
    // By defintion `const` can't be modified:
    // *cm = 100; // error!

    // As `immutable` is guaranteed to stay
    // unchanged, it can't point to
    // mutable memory
    // immutable int* im = &m; // error!

    /**
    * Pointing to read-only memory:
    */
    immutable v = 100;
    writeln("v: ", typeof(v).stringof);
    // v = 5; // error!

    // `const` may point to read-only memory,
    // but it is read-only as well
    const int* cv = &v;
    writeln("cv: ", typeof(cv).stringof);
    // *cv = 10; // error!
}
