#!/usr/bin/env rdmd
import std.stdio : writeln;

/**
Shifts every character in the
array `input` for `shift` characters.
The character range is limited to `a-z`
and the next character after z is a.
Params:
    input = array to shift
    shift = shift length for each char
Returns:
    Shifted char array
*/
char[] encrypt(char[] input, char shift) {
  auto result = input.dup;
  result[] = ((result[] - 'a' + shift) % 26) + 'a';
  return result;
}

void main() {
  // We will now encrypt the message with
  // Caesar encryption and a
  // shift factor of 16!
  char[] toBeEncrypted = ['w', 'e', 'l', 'c',
    'o', 'm', 'e', 't', 'o', 'd',// The last , is okay and will just
    // be ignored!
  ];
  writeln("Before: ", toBeEncrypted);
  auto encrypted = encrypt(toBeEncrypted, 16);
  writeln("After: ", encrypted);
  // Make sure the algorithm works
  // as expected
  assert(encrypted == ['m', 'u', 'b', 's', 'e',
      'c', 'u', 'j', 'e', 't']);
}
