#!/usr/bin/env python3

from typing import List


def isprime(n: int) -> bool:
    """
    Check from 1 -> sqrt(n) + 1
    We add two below since upper bound of range is exclusive

    >>> isprime(7)
    True
    >>> isprime(8)
    False
    """
    if n < 2:
        return False
    elif n == 2:
        return True
    elif not n & 1:  # if even
        return False
    else:
        for p in range(3, int(n ** 0.5) + 2, 2):
            if n % p == 0:
                return False
    return True


def find_prime_factors(n: int) -> List[int]:
    """
    >>> find_prime_factors(20)
    [2, 5]
    >>> find_prime_factors(182)
    [2, 7, 13]
    """
    prime_factors = []
    for x in range(1, int(n ** 0.5) + 2):
        if n % x == 0 and isprime(x) == True:
            prime_factors.append(x)
    return prime_factors


if __name__ == "__main__":
    print(list(find_prime_factors(600851475143))[-1])
