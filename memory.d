#!/usr/bin/env rdmd
import std.stdio : writeln;

void safeFun() @safe
{
    writeln("Safe: Hello, World");
    // allocating memory with the GC is safe too
    int* p = new int;
}

void unsafeFun()
{
    writeln("Unsafe: Hello, World");
    int* p = new int;
    int* fiddling = p + 5;
}

void main()
{
    safeFun();
    unsafeFun();
}
