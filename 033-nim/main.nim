type
  Fraction = ref object of RootObj
    num: int
    den: int

proc simplifyFrac(frac: Fraction): Fraction =
  for divide_by in 2..frac.den:
    if frac.num mod divide_by == 0 and frac.den mod divide_by == 0:
      return simplifyFrac(Fraction(num: (frac.num / divide_by).int,
          den: (frac.den / divide_by).int))
  return frac

proc isCuriousFraction(frac: Fraction): bool =
  let
    numTens = frac.num div 10
    numOnes = frac.num mod 10
    denTens = frac.den div 10
    denOnes = frac.den mod 10

  if numOnes == 0 and denOnes == 0: # trivial fractons, e.g. 30/50
    return false

  proc cancel(a, b, c, d: int): bool =
    return a == b and d != 0 and frac.num / frac.den == c / d

  return cancel(numTens, denTens, numOnes, denOnes) or cancel(numTens, denOnes,
      numOnes, denTens) or cancel(numOnes, denTens, numTens, denOnes) or cancel(
      numOnes, denOnes, numTens, denTens)

var
  rNum, rDen: int = 1

# find all curious fractions under with n,m < 100
for den in 10..99:
  for num in 10..(den - 1):
    if isCuriousFraction(Fraction(num: num, den: den)):
      rNum *= num
      rDen *= den

# simplify and print value of den
echo simplifyFrac(Fraction(num: rNum, den: rDen)).den
