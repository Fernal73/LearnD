#!/usr/bin/env rdmd
import std.stdio : writeln;
import std.range : drop, take;
import std.algorithm.iteration : filter, sum;

struct FibonacciRange {
  // States of the Fibonacci generator
  int a = 1, b = 1;
  // The fibonacci range never ends
  enum empty = false;
  // Peek at the first element
  int front() const @property {
    return a;
  }
  // Remove the first element
  void popFront() {
    auto t = a;
    a = b;
    b = t + b;
  }
}

void main() {
  FibonacciRange fib;

  // Select the first 10 fibonacci numbers
  auto fib10 = fib.take(10);
  writeln("Fib 10: ", fib10);
  // Except the first five
  auto fib5 = fib10.drop(5);
  writeln("Fib 5: ", fib5);
  // Select the even subset
  auto even = fib5.filter!(x => x % 2 == 0);
  writeln("FibEven : ", even);
  // Sum of all elements
  writeln("Sum of FibEven: ", even.sum);
  // Usually this is summarized as:
  fib.take(10)
    .drop(5)
    .filter!(x => x % 2 == 0)
    .sum
    .writeln;
}
