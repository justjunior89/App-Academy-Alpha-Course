# EASY
require 'byebug'
# Write a method that returns the range of its argument (an array of integers).
def range(arr)
  byebug
  int = (arr.sort[-1] - arr.sort[0])
  int
end


# Write a method that returns a boolean indicating whether an array is in sorted
# order. Use the equality operator (==), which returns a boolean indicating
# whether its operands are equal, e.g., 2 == 2 => true, ["cat", "dog"] ==
# ["dog", "cat"] => false
def in_order?(arr)
  return true if arr == arr.sort
  false
end


# MEDIUM

# Write a method that returns the number of vowels in its argument
def num_vowels(str)
  str.scan(/[aeiouAEIOU]/).count
end

# Write a method that returns its argument with all its vowels removed.
def devowel(str)
  we_dont_want_arr = "aeiou".chars
  answer_str = ""
  str.downcase.each_char do |ch|
    if we_dont_want_arr.include?(ch) == false
      answer_str += ch
    end
  end
  answer_str
end

# HARD

# Write a method that returns an array of the digits of a
# non-negative integer in descending order and as strings, e.g.,
# descending_digits(4291) #=> ["9", "4", "2", "1"]
def descending_digits(int)
  int.to_s.chars.sort.reverse
end

# Write a method that returns a boolean indicating whether a string has
# repeating letters. Capital letters count as repeats of lowercase ones, e.g.,
# repeating_letters?("Aa") => true
def repeating_letters?(str)
  str_down = str.downcase
  idx = 0
  while idx <= str_down.length - 1
    return true if str[idx].downcase == str_down[idx+1..-1]
    idx += 1
  end
  false
end

# Write a method that converts an array of ten integers into a phone number in
# the format "(123) 456-7890". [0,1,2,3,4,5,6,7,8,9]
def to_phone_number(arr)
  phone_number = "(" + arr[0..2].join.to_s +  ") " + arr[3..5].join.to_s + "-" + arr[6..-1].join.to_s
end

# Write a method that returns the range of a string of comma-separated integers,
# e.g., str_range("4,1,8") #=> 7
def str_range(str)
  str_split_arr = str.split(",")
  str_split_arr.sort!
  return str_split_arr[-1].to_i - str_split_arr[0].to_i
end


#EXPERT

# Write a method that is functionally equivalent to the rotate(offset) method of
# arrays. offset=1 ensures that the value of offset is 1 if no argument is
# provided. HINT: use the take(num) and drop(num) methods. You won't need much
# code, but the solution is tricky!
def my_rotate(arr, offset=1)
  rotate = offset % arr.length
  arr.drop(rotate) + arr.take(rotate)
end
