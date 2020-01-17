ones = [:]
ones.put(1, 3) // one
ones.put(2, 3) // two
ones.put(3, 5) // three
ones.put(4, 4) // four
ones.put(5, 4) // five
ones.put(6, 3) // six
ones.put(7, 5) // seven
ones.put(8, 5) // eight
ones.put(9, 4) // nine
ones.put(0, 0) // dont pronounce zero

special = [:]
special.put(10, 3) // ten
special.put(11, 6) // eleven
special.put(12, 6) // twelve
special.put(13, 8) // thirteen
special.put(14, 8) // fourteen
special.put(15, 7) // fifteen
special.put(16, 7) // sixteen
special.put(17, 9) // seventeen
special.put(18, 8) // eighteen
special.put(19, 8) // nineteen

tens = [:]
tens.put(2, 6) // twenty
tens.put(3, 6) // thirty
tens.put(4, 5) // forty
tens.put(5, 5) // fifty
tens.put(6, 5) // sixty
tens.put(7, 7) // seventy
tens.put(8, 6) // eighty
tens.put(9, 6) // ninety

// Get the nth place of the number,
// counting from the right
Integer get_place(Integer number, Integer index) {
  def num_str = number.toString().reverse()
  return Integer.parseInt(num_str[index])
}

Integer count_letters(Integer number) {
  number_tens = number % 100
  Integer count = 0
  if (number > 999) {
    count += 11 // onethousand
  }
  //hundreths place
  if (number >= 100) {
    count += ones[get_place(number, 2)]
  }
  // the word 'hundred'
  if (number > 99 && get_place(number, 2) != 0) {
    count += 7
  }
  // 'and' between hundreds and tens
  if (number > 99 && number_tens != 0) {
    count += 3 // and between hundreds and tens
  }
  // tens place, or special cases between 10-19
  if (number_tens > 19) {
    count += tens[get_place(number, 1)]
  } else if (number_tens > 9) {
    count += special[number_tens]
  }
  // ones place, as long as not between 10-19
  if (!special.containsKey(number_tens)) {
    count += ones[number % 10]
  }
  return count
}

println ((1..1000).collect { count_letters(it) }.sum())
