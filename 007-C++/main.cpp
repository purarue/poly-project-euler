#include <cmath>    // sqrt
#include <iostream> //printf

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
  int primes_seen = 0;
  int num = 2;
  while (primes_seen < 10001) {
    primes_seen += is_prime(num);
    num++;
  }
  printf("%d\n",
         num - 1); // undo the last increment before loop condition check
  return 0;
}
