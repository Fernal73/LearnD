#!/usr/bin/env rdmd
import std.stdio : writeln;

/*Fancy type which can be used for
anything...
*/
class Any {
  // protected is just seen by inheriting
  // classes
  protected string type;
  this(string type) {
    this.type = type;
  }
  // public is implicit by the way
  final string getType() {
    return type;
  }
  // This needs to be implemented!
  abstract string convertToString();
}

class Integer : Any {
  // just seen by Integer
  private {
    int number;
  }
  // constructor
  this(int number) {
    // call base class constructor
    super("integer");
    this.number = number;
  }
  // This is implicit. And another way
  // to specify the protection level
public:
  override string convertToString() {
    import std.conv : to;

    // The swiss army knife of conversion.
    return to!string(number);
  }
}

class Float : Any {
  private float number;
  this(float number) {
    super("float");
    this.number = number;
  }

  override string convertToString() {
    import std.string : format;

    // We want to control precision
    return format("%.1f", number);
  }
}

void main() {
  Any[] anys = [
    new Integer(10),
    new Float(3.1415f)
  ];
  foreach (any; anys) {
    writeln("any's type = ", any.getType());
    writeln("Content = ",
        any.convertToString());
  }
}
