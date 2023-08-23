#include <cmath>    // sqrt
#include <iostream> // printf

bool is_prime(int n) {
  if (n < 2) {
    return false;
  } else if (n == 2) {
    return true;
  } else if ((n & 1) == 0) {
    return false;
  } else {
    int upperlimit = ((int)sqrt(n)) + 1;
    for (int i = 3; i < upperlimit; i++) {
      if (n % i == 0) {
        return false;
      }
    }
  }
  return true;
}

int main() {
  int primes_seen = 1;
  int num = 3;
  while (true) {
    primes_seen += is_prime(num);
    if (primes_seen == 10001) {
      break;
    }
    num += 2;
  }
  printf("%d\n", num);
  return 0;
}
