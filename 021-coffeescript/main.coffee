# m is a factor of n
is_factor = (m, n) -> m % n == 0

# sum the values of a list
sum_list = (l) -> l.reduce (a, b) -> a + b

# get proper divisors of an integer
proper_divisors = (n) -> [1..n // 2].filter (f) -> is_factor n, f

# sum of proper divisors for some integer
sum_of_proper_divisors = (n) -> sum_list proper_divisors n

# list of the sum of divisors for each number
# index represents which number this is the sum of proper divisors for
sum_of_divisors = (sum_of_proper_divisors n for n in [0..9999])

amicable_numbers = new Set()

# find all amicable numbers under 10000
for value, index in sum_of_divisors
  amicable_numbers.add index if \
  sum_of_divisors[index] < 10000 \ # sum of proper divisors is within range
  and sum_of_divisors[index] != index \ # a =/= b
  and sum_of_divisors[sum_of_divisors[index]] == index # d(a) = b and d(b) = a

# verify it worked
# console.log (Array.from amicable_numbers).map ((n) -> [n, sum_of_divisors[n]])

console.log sum_list Array.from amicable_numbers
