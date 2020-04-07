import std.stdio;
import std.format : format;
import std.bigint : BigInt;
import std.algorithm.searching : until;
import std.range.primitives: walkLength;

const ulong STRLEN = 1000;

// from https://tour.dlang.org/tour/en/basics/ranges
struct FibonacciRange {
  // start with F0
  BigInt x = "0", y = "1";

  // range never ends
  enum empty = false;

  // current front of the list
  BigInt front() const @property
  {
    return x;
  }

  // remove first element; get next fibonacci number
  void popFront()
  {
    auto t = x;
    x = y;
    y = t + y;
  }
}

// drop from range until we reach length 1000
static bool target_predicate(BigInt a) {
  return format("%d", a).length >= STRLEN;
}

void main() {
  FibonacciRange fib;
  writeln(format("%d", until!target_predicate(fib).walkLength));
}
