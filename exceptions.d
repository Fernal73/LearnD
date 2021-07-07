#!/usr/bin/env rdmd
import std.file : FileException, readText;
import std.stdio : writeln;

void dangerousOperation() {
  import std.exception : enforce;

  float magic = 1_000_000_000;
  enforce(magic + 42 - magic == 42, "Floating-point math is fun");
}

void main() {
  try {
    readText("dummyFile");
  } catch (FileException e) {
    writeln("Message:\n", e.msg);
    writeln("File: ", e.file);
    writeln("Line: ", e.line);
    writeln("Stack trace:\n", e.info);
    writeln(e);
  }
  import std.exception : collectException;

  auto e = collectException(dangerousOperation());
  if (e)
    writeln("The dangerous operation failed with ", e);
  writeln(lessThan(10, 5));
}

bool lessThan(int a, int b) nothrow
{
   // writeln("unsafe world"); // output can throw exceptions, thus this is forbidden
    return a < b;
}
