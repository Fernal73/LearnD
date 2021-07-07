#!/usr/bin/env rdmd
import std.stdio : writefln, writeln;

void main() {
  writeln("<html>");
  scope (exit)
    writeln("</html>");
  {
    writeln("\t<head>");
    scope (exit)
      writeln("\t</head>");
    "\t\t<title>%s</title>".writefln("Hello");
  } // the scope(exit) on the previous line
  // is executed here

  writeln("\t<body>");
  scope (exit)
    writeln("\t</body>");
  writeln("\t\t<h>Hello World!</h1>");
  // scope guards allow placing allocations
  // and their clean up code next to each
  // other
  import core.stdc.stdlib : free, malloc;

  int* p = cast(int*) malloc(int.sizeof);
  scope (exit)
    free(p);
}
