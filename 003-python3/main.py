#!/usr/bin/env python3

from typing import Iterator


def isprime(n: int) -> bool:
    # (even check)
    if not n & 1 or n < 2:
        return False
    elif n == 2:
        return True
    else:
        for p in range(3, int(n ** 0.5) + 1, 2):
            if n % p == 0:
                return False
    return True


def iter_prime_factors(n: int) -> Iterator[int]:
    for x in range(1, int(n ** 0.5) + 1):
        if n % x == 0 and isprime(x):
            yield x


def solve(n: int) -> int:
    return next(reversed(list(iter_prime_factors(n))))


if __name__ == "__main__":
    print(solve(600851475143))
