#!/usr/bin/env rdmd
import std.stdio : writeln, writefln;
import std.range : walkLength;
import std.uni : byGrapheme;
import std.string : format;
import std.array : replace;
import std.algorithm : endsWith;
import std.conv : to;

void main() {
  // Ä
  string s = "\u0041\u0308";
  // 3
  writeln(s.length);
  // 2
  writeln(s.walkLength);
  writeln(s.byGrapheme.walkLength); // 1
  // format ko a string using a printf
  // like syntax. D allows native UTF string
  // handling!
  string str = format("%s %s", "Hellö",
      "Wörld");
  writeln("My string: ", str);
  writeln("Array length (code unit count)"
      ~ " of string: ", str.length);
  writeln("Range length (code point count)"
      ~ " of string: ", str.walkLength);
  writeln("Character length (grapheme count)"
      ~ " of string: ",
      str.byGrapheme.walkLength);
  // Strings are just normal arrays, so any
  // operation that works on arrays works here
  // too!
  writeln(replace(str, "lö", "lo"));
  writefln("Does %s end with 'rld'? %s",
      str, endsWith(str, "rld"));
  // Convert to UTF-32
  dstring dstr = to!dstring(str);
  // .. which of course looks the same!
  writeln("My dstring: ", dstr);
  string multiline = "
This
may be a
long document
";
  writeln(multiline);
  // raw "string"
  string raw = `raw "string"`;
  // raw `string`
  string raw2 = r"raw `string`";
  writeln(raw);
  writeln(raw2);
}
