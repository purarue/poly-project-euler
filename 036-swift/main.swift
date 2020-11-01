func isPalindrome(string: String) -> Bool {
  return string == String(string.reversed())
}

func findDoubleBasePalindromesBetween(lower: Int = 1, upper: Int) -> Int {
  var sum: Int = 0
  for i in lower...upper {
    if isPalindrome(string: String(i)) {
      if isPalindrome(string: String(i, radix: 2)) {
        sum += i
      }
    }
  }
  return sum
}

print(findDoubleBasePalindromesBetween(upper: 999999))
