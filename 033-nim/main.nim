import sets

type
  Fraction = ref object of RootObj
    numerator: int
    denominator: int

proc toStringFrac(frac: Fraction): string =
  return $frac.numerator & "/" & $frac.denominator

proc simplifyFrac(frac: Fraction): Fraction =
  for divide_by in 2..frac.denominator:
    if frac.numerator mod divide_by == 0 and frac.denominator mod divide_by == 0:
      return simplifyFrac(Fraction(numerator: (frac.numerator / divide_by).int, denominator: (frac.denominator / divide_by).int))
  return frac

proc divideFrac(frac: Fraction): float =
  return frac.numerator / frac.denominator

proc sameFraction(orig: Fraction, newFracNum: int, newFracDen: int): bool =
  return divideFrac(orig) == divideFrac(Fraction(numerator: newFracNum, denominator: newFracDen))

proc isCuriousFraction(frac: Fraction): bool =
  let
    numTens = (frac.numerator / 10).int
    numOnes = frac.numerator mod 10
    denTens = (frac.denominator / 10).int
    denOnes = frac.denominator mod 10

  # trivial fractons, e.g. 30/50
  if numOnes == 0 and denOnes == 0:
    return false

  # left cancelled left
  if numTens == denTens and sameFraction(frac, numOnes, denOnes):
      return true
  # left cancelled right
  if numTens == denOnes and sameFraction(frac, numOnes, denTens):
      return true
  # right cancelled left
  if numOnes == denTens and sameFraction(frac, numTens, denOnes):
      return true
  # right cancelled right
  if numOnes == denOnes and sameFraction(frac, numTens, denTens):
      return true
  return false

var
  found: HashSet[string]
  resultFracs: seq[Fraction]

init(found)
resultFracs = newSeq[Fraction]()

# find all curious fractions under with n,m < 100
# use stringified, simplified fraction to remove duplicate
# curious fractions
for den in 10..99:
  for num in 10..(den - 1):
    let fr = Fraction(numerator: num, denominator: den)
    if isCuriousFraction(fr):
      let frStr = toStringFrac(simplifyFrac(fr))
      if frStr notin found:
        found.incl(frStr)
        resultFracs.add(fr)

# calculate product of resulting fractions
var
  rNum: int = 1
  rDen: int = 1

for f in resultFracs:
  rNum *= f.numerator
  rDen *= f.denominator

# simplify and print value of denominator
echo simplifyFrac(Fraction(numerator: rNum, denominator: rDen)).denominator
