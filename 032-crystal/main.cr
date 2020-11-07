def is_pandigital(n)
  nset = (n.to_s.chars.map { |i| i.to_i }).to_set
  if nset.includes?(0)
    return false
  else
    return nset == Range.new(1, nset.max).to_set
  end
end

def factors(n)
  ((1..(Math.sqrt(n) + 1).to_i).each.select { |p| n % p == 0 }).to_a
end

pandigital_products = Set(Int32).new

(1..9999).each do |n|
  factors(n).each do |m|
    pn = "#{(n/m).to_i}#{m}#{n}"
    # problem requires this to be 1 through 9 pandigital
    if pn.chars.to_set.size == 9 && is_pandigital(pn)
      pandigital_products << n
    end
  end
end

puts pandigital_products.reduce(0) { |acc, i| acc + i }
