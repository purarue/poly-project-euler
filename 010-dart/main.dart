import 'dart:math' show sqrt;

bool is_prime(int n) {
  if (n < 2) {
    return false;
  } else if (n == 2) {
    return true;
  } else {
    int upperlimit = sqrt(n).round() + 1;
    for (int i = 2; i < upperlimit; i++) {
      if (n % i == 0) {
        return false;
      }
    }
  }
  return true;
}

void main() {
  int sum_of_primes = 0;
  for (int i = 0; i <= 2000000; i++) {
    if (is_prime(i)) {
      sum_of_primes += i;
    }
  }
  print(sum_of_primes);
}
