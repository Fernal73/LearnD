#!/usr/bin/env rdmd
import std.stdio : writeln;

interface IAnimal {
  void makeNoise();

  /*
    NVI pattern. Uses makeNoise internally
    to customize behaviour inheriting
    classes.

    Params:
        n =  number of repetitions
    */
  final void multipleNoise(int n) {
    for (int i = 0; i < n; ++i) {
      makeNoise();
    }
  }
}

class Dog : IAnimal {
  void makeNoise() {
    writeln("Woof!");
  }
}

class Cat : IAnimal {
  void makeNoise() {
    writeln("Meeoauw!");
  }
}

void main() {
  IAnimal dog = new Dog;
  IAnimal cat = new Cat;
  IAnimal[] animals = [dog, cat];
  foreach (animal; animals) {
    animal.multipleNoise(5);
  }
}
