#!/usr/bin/env rdmd
import std.file : FileException, readText;
import std.stdio : writeln;

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
}
