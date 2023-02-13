# central binomial coefficient
# https://en.wikipedia.org/wiki/Central_binomial_coefficient
# frozen_string_literal: true

# Implement factorial for built-in Integer type
class Integer
  def factorial
    (1..self).reduce(:*)
  end
end

puts (2 * 20).factorial / 20.factorial**2
