#!/usr/bin/env rdmd
import std.array : assocArray;
import std.algorithm.iteration : each, group,
  splitter, sum;
import std.string : toLower;
import std.stdio : writefln, writeln;

void main() {
  string text = "Rock D with D";
  // Iterate over all words and count
  // each word once
  int[string] words;
  text.toLower()
    .splitter(" ")
    .each!(w => words[w]++);
  foreach (key, value; words)
    writefln("key: %s, value: %d",
        key, value);
  // `.keys` and `.values` return arrays
  writeln("Words: ", words.keys);
  // `.byKey`, `.byValue` and `.byKeyValue`
  // return lazy, iteratable ranges
  writeln("# Words: ", words.byValue.sum);
  // A new associative array can be created
  // with `assocArray` by passing a
  // range of key/value tuples;
  auto array = ['a', 'a', 'a', 'b', 'b',
    'c', 'd', 'e', 'e'];
  // `.group` groups consecutively equivalent
  // elements into a single tuple of the
  // element and the number of its repetitions
  auto keyValue = array.group;
  writeln("Key/Value range: ", keyValue);
  writeln("Associative array: ",
      keyValue.assocArray);
}
