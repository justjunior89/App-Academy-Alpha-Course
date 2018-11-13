# Write a method that capitalizes each word in a string like a book title
# Do not capitalize words like 'a', 'and', 'of', 'over' or 'the'.
LITTLE_WORDS = [
   "or",
   "of",
    "a",
  "and",
  "the",
  "over"
]

def titleize(title)
  words = title.split(" ")
  titleized_words = []
  words.map.with_index do |word, i|
    if i == 0
      titleized_words << word.capitalize
    elsif LITTLE_WORDS.include?(word)
      titleized_words << word.downcase
    else
      titleized_words << word.capitalize
    end
  end
  titleized_words.join(" ")
end

# Write a method that returns the largest prime factor of a given integer.

def prime?(num)

  (2...num).none? { |factor| num % factor == 0 }
end

def largest_prime_factor(num)
  return 2 if num == 2
  return nil if num == 0 || num == 1
  return num if prime?(num) == true
  (num - 1).downto(2) do |factor|
    if (num % factor).zero? == true
      return factor if prime?(factor) == true
    end
  end
end


# Write a symmetric_substrings method that takes a string and returns an array
# of substrings that are palindromes, e.g. symmetric_substrings("cool") => ["oo"]
# Only include substrings of length > 1.

def symmetric_substrings(str)
  symm_subs = []
  str.length.times do |start_pos|
    (2..(str.length - start_pos)).each do |len|
      substr = str[start_pos...(start_pos + len)]
      symm_subs << substr if substr == substr.reverse
    end
  end
  symm_subs
end
