#!/usr/bin/env rdmd
import std.stdio : writeln;

enum IntOps {
  add = 0,
  sub = 1,
  mul = 2,
  div = 3
}

/**
Provides a math calculuation
Params:
    op = selected math operation
Returns: delegate which does a math operation
*/
auto getMathOperation(IntOps op) {
  // Define 4 lambda functions for
  // 4 different mathematical operations
  auto add = (int lhs, int rhs) => lhs + rhs;
  auto sub = (int lhs, int rhs) => lhs - rhs;
  auto mul = (int lhs, int rhs) => lhs * rhs;
  auto div = (int lhs, int rhs) => lhs / rhs;

  // we can ensure that the switch covers
  // all cases
  final switch (op) {
  case IntOps.add:
    return add;
  case IntOps.sub:
    return sub;
  case IntOps.mul:
    return mul;
  case IntOps.div:
    return div;
  }
}

void main() {
  int a = 10;
  int b = 5;

  auto func = getMathOperation(IntOps.add);
  writeln("The type of func is ",
      typeof(func).stringof, "!");

  // run the delegate func which does all the
  // real work for us!
  writeln("result: ", func(a, b));
}
