#!/usr/bin/env python3

from typing import Iterator
from functools import lru_cache


@lru_cache(maxsize=None)
def isprime(n: int) -> bool:
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


def find_prime_factors(n: int) -> Iterator[int]:
    for x in range(1, int(n ** 0.5) + 2):
        if n % x == 0 and isprime(x):
            yield x


def main() -> None:
    last: int = -1
    for x in find_prime_factors(600851475143):
        last = x
    print(last)


if __name__ == "__main__":
    main()
