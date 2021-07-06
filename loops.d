#!/usr/bin/env rdmd
import std : writeln;
import std.stdio : writefln;

/*
Computes the average of
the elements of an array.
*/
double average(int[] array) {
  immutable initialLength = array.length;
  double accumulator = 0.0;
  while (array.length) {
    // this could be also done with .front
    // with import std.array : front;
    accumulator += array[0];
    array = array[1 .. $];
  }
  return accumulator / initialLength;
}

void main() {
  auto testers = [
    // 20
    [5, 15], // 10
    [2, 3, 2, 3], // 20
    [3, 6, 2, 9]
  ];
  for (auto i = 0; i < testers.length; ++i)
    writeln("The average of ", testers[i], " = ", average(testers[i]));
  foreach (i, row; testers) {
    double total = 0.0;
    foreach (e; row)
      total += e;
    auto avg = total / row.length;
    writefln("AVG [row=%d]: %.2f", i, avg);
  }
}
