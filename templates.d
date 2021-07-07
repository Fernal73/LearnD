#!/usr/bin/env rdmd
import std.stdio : writeln;

/**
Template class that allows
generic implementation of animals.
Params:
    noise = string to write
*/
class Animal(string noise) {
  void makeNoise() {
    writeln(noise ~ "!");
  }
}

class Dog : Animal!("Woof") {
}

class Cat : Animal!("Meeoauw") {
}

/**
Template function which takes any
type T that implements a function
makeNoise.
Params:
    animal = object that can make noise
    n = number of makeNoise calls
*/
void multipleNoise(T)(T animal, int n) {
  for (int i = 0; i < n; ++i) {
    animal.makeNoise();
  }
}

auto add(T)(T lhs, T rhs) {
  return lhs + rhs;
}

void main() {
  auto dog = new Dog;
  auto cat = new Cat;
  multipleNoise(dog, 5);
  multipleNoise(cat, 5);
  add!int(5, 10);
  add!float(5.0f, 10.0f);
  int a = 5;
  int b = 10;
  // T is to deduced to `int`
  add(a, b);
  float c = 5.0;
  // T is deduced to `float`
  add(a, c);
}
