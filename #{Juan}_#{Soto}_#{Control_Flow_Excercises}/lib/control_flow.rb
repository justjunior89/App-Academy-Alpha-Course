# EASY

# Return the argument with all its lowercase characters removed.
def destructive_uppercase(str)
  idx = 0
  new_str = ""
  while idx <= str.length - 1
    current_ch = str[idx]
    if current_ch.upcase == current_ch
      new_str += current_ch
    end
    idx += 1
  end
  new_str
end

# Return the middle character of a string. Return the middle two characters if
# the word is of even length, e.g. middle_substring("middle") => "dd",
# middle_substring("mid") => "i"
def middle_substring(str)
  if str.length.even?
    middle = (str.length / 2) - 1
    middle_plus = (str.length / 2)
    return str[middle..middle_plus]
  elsif str.length.odd?
    return str[(str.length / 2)]
  end
end

# Return the number of vowels in a string.
#VOWELS = %w(a e i o u)
def num_vowels(str)
  str.scan(/[aeiouAEIOU]/).count
end

# Return the factorial of the argument (num). A number's factorial is the product
# of all whole numbers between 1 and the number itself. Assume the argument will
# be > 0.
def factorial(num)
  num.downto(1).inject(:*)
end

# MEDIUM

# Write your own version of the join method. separator = "" ensures that the
# default seperator is an empty string.
def my_join(arr, separator = "")
  idx = 0
  answer_arr = []
  return "" if arr.empty?
  arr.each_with_index do |el,i|
    answer_arr << el
    answer_arr << separator if i != arr.length - 1
  end
  answer_arr.join
end
# Write a method that converts its argument to weirdcase, where every odd
# character is lowercase and every even is uppercase, e.g.
# weirdcase("weirdcase") => "wEiRdCaSe"
def weirdcase(str)
  weird_str = ""
  str.each_char.with_index do |ch,i|
    if i.even?
      weird_str << ch.downcase
    elsif i.odd?
      weird_str << ch.upcase
    end
  end
  weird_str
end
# Reverse all words of five more more letters in a string. Return the resulting
# string, e.g., reverse_five("Looks like my luck has reversed") => "skooL like
# my luck has desrever")
def reverse_five(str)
  array = str.split
  array.map do |word|
    if word.length >= 5
      word.reverse
    else
      word = word
    end
  end.join(" ")
end

# Return an array of integers from 1 to n (inclusive), except for each multiple
# of 3 replace the integer with "fizz", for each multiple of 5 replace the
# integer with "buzz", and for each multiple of both 3 and 5, replace the
# integer with "fizzbuzz".
def fizzbuzz(n)
  (1..n).map do |number|
    if number % (3 * 5) == 0
      number = "fizzbuzz"
    elsif number % 5 == 0
      number = "buzz"
    elsif number % 3 == 0
      number = "fizz"
    else
      number = number
    end
  end
end

# HARD

# Write a method that returns a new array containing all the elements of the
# original array in reverse order.
def my_reverse(arr)
  arr.reverse
end

# Write a method that returns a boolean indicating whether the argument is
# prime.
def prime?(num)
  require 'prime'
  Prime.prime?(num)
end
# Write a method that returns a sorted array of the factors of its argument.
def factors(num)
  factors_arr = []
  (1..num).each do |number|
    if num % number == 0
      factors_arr << number
    end
  end
  factors_arr
end

# Write a method that returns a sorted array of the prime factors of its argument.
def prime_factors(num)
  require 'prime'
  num_factors = factors(num)
  answer_arr = []
  idx = 0
  while idx <= num_factors.length - 1
    if Prime.prime?(num_factors[idx]) == true
      answer_arr << num_factors[idx]
    end
    idx += 1
  end
  answer_arr
end

# Write a method that returns the number of prime factors of its argument.
def num_prime_factors(num)
  return prime_factors(num).length
end


# EXPERT

# Return the one integer in an array that is even or odd while the rest are of
# opposite parity, e.g. oddball([1,2,3]) => 2, oddball([2,4,5,6] => 5)
def oddball(arr)
  idx = 0
  odd_tracker = []
  even_tracker = []
  while idx <= arr.length - 1
    if arr[idx].odd?
      odd_tracker << arr[idx]
    elsif arr[idx].even?
      even_tracker << arr[idx]
    end
    idx += 1
  end
  return odd_tracker[0] if odd_tracker.length == 1
  return even_tracker[0]if even_tracker.length == 1
end
