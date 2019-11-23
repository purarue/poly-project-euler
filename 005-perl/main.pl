#!/usr/bin/env perl

# https://rosettacode.org/wiki/Greatest_common_divisor#Iterative_Euclid_algorithm_7
# greatest common divisor
sub gcd($$) {
  my ($u, $v) = @_;
  while ($v) {
    ($u, $v) = ($v, $u % $v);
  }
  return abs($u);
}

# least common multiple
# a * b == gcd(a, b) * lcm(a, b)
sub lcm {
  my ($x, $y) = @_;
  return int(($x * $y) / gcd($x, $y));
}

# from 1 to 2
@range = (1..20);

# psuedo-reduce
while ($#range > 1) {  # while there are at least 2 items in the array
  # remove the first 2 tokens, and unshift the LCM back
  # onto the front of the array
  unshift(@range, lcm(shift(@range), shift(@range)));
}

print(@range[0] . "\n");
