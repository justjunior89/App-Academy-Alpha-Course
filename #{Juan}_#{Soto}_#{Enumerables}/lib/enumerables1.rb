# EASY

# Define a method that returns an array of only the even numbers in its argument
# (an array of integers).
def get_evens(arr)
  arr.select {|number| number if number.even?}
end

# Define a method that returns a new array of all the elements in its argument
# doubled. This method should *not* modify the original array.
def calculate_doubles(arr)
  arr.map {|numbers| numbers * 2}
end

# Define a method that returns its argument with all the argument's elements
# doubled. This method should modify the original array.
def calculate_doubles!(arr)
  arr.map! {|numbers| numbers * 2}
end

# Define a method that returns the sum of each element in its argument
# multiplied by its index. array_sum_with_index([2, 9, 7]) => 23 because (2 * 0) +
# (9 * 1) + (7 * 2) = 0 + 9 + 14 = 23
def array_sum_with_index(arr)
  return 0 if arr.empty?
  arr.map.with_index do |number, i |
    number = number * i
  end.reduce(:+)
end

# MEDIUM

# Given an array of bids and an actual retail price, return the bid closest to
# the actual retail price without going over that price. Assume there is always
# at least one bid below the retail price.
def price_is_right(bids, actual_retail_price)
  bids.sort!
  idx = 0
  while idx <= bids.length - 1
    current_bid = bids[idx]
      if current_bid == actual_retail_price
        return current_bid
      elsif current_bid < actual_retail_price
        if bids[idx + 1] > actual_retail_price
          return current_bid
        end
      end
    idx += 1
  end
end

# Given an array of numbers, return an array of those numbers that have at least
# n factors (including 1 and the number itself as factors).
# at_least_n_factors([1, 3, 10, 16], 5) => [16] because 16 has five factors (1,
# 2, 4, 8, 16) and the others have fewer than five factors. Consider writing a
# helper method num_factors
def num_factors(number)
  counter = 0
  (1..number).each do |int|
    if number % int == 0
      counter += 1
    end
  end
  counter
end

def at_least_n_factors(numbers, n)
  answer = []
    numbers.each do |int|
      answer << int if num_factors(int) >= n
    end
    answer
end
# HARD

# Define a method that accepts an array of words and returns an array of those
# words whose vowels appear in order. You may wish to write a helper method:
# ordered_vowel_word?
def ordered_vowel_word?(word)
  vowel_str = "aeiou"
  selected_arr = word.chars.select {|ch|  vowel_str.include?(ch)}
  selected_arr == selected_arr.sort ? true : false
end

def ordered_vowel_words(words)
  words.map do |word|
    if ordered_vowel_word?(word)
       word
    end
  end.compact
end

# Given an array of numbers, return an array of all the products remaining when
# each element is removed from the array. You may wish to write a helper method:
# array_product.

# products_except_me([2, 3, 4]) => [12, 8, 6], where: 12 because you take out 2,
# leaving 3 * 4. 8, because you take out 3, leaving 2 * 4. 6, because you take out
# 4, leaving 2 * 3

# products_except_me([1, 2, 3, 5]) => [30, 15, 10, 6], where: 30 because you
# take out 1, leaving 2 * 3 * 5 15, because you take out 2, leaving 1 * 3 * 5
# 10, because you take out 3, leaving 1 * 2 * 5 6, because you take out 5,
# leaving 1 * 2 * 3
def array_product(array)
  array.reduce(:*)
end

def products_except_me(numbers)
  idx = 0
  answer_arr = []
  while idx <= numbers.length - 1
    rejected_arr = numbers.reject{|el| numbers[idx] == el }
    answer_arr << array_product(rejected_arr)
    idx += 1
  end
  answer_arr
end
