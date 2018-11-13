# ### Factors
 require 'byebug'
# Write a method `factors(num)` that returns an array containing all the
# factors of a given number.

def factors(num)
  factor_arr = []
  (1..num).each do |number|
    factor_arr << number if num % number == 0
  end
  factor_arr
end

# ### Bubble Sort
#
# http://en.wikipedia.org/wiki/bubble_sort
#
# Implement Bubble sort in a method, `Array#bubble_sort!`. Your method should
# modify the array so that it is in sorted order.
#
# > Bubble sort, sometimes incorrectly referred to as sinking sort, is a
# > simple sorting algorithm that works by repeatedly stepping through
# > the list to be sorted, comparing each pair of adjacent items and
# > swapping them if they are in the wrong order. The pass through the
# > list is repeated until no swaps are needed, which indicates that the
# > list is sorted. The algorithm gets its name from the way smaller
# > elements "bubble" to the top of the list. Because it only uses
# > comparisons to operate on elements, it is a comparison
# > sort. Although the algorithm is simple, most other algorithms are
# > more efficient for sorting large lists.
#
# Hint: Ruby has parallel assignment for easily swapping values:
# http://rubyquicktips.com/post/384502538/easily-swap-two-variables-values
#
# After writing `bubble_sort!`, write a `bubble_sort` that does the same
# but doesn't modify the original. Do this in two lines using `dup`.
#
# Finally, modify your `Array#bubble_sort!` method so that, instead of
# using `>` and `<` to compare elements, it takes a block to perform the
# comparison:
#
# ```ruby
# [1, 3, 5].bubble_sort! { |num1, num2| num1 <=> num2 } #sort ascending
# [1, 3, 5].bubble_sort! { |num1, num2| num2 <=> num1 } #sort descending
# ```
#
# #### `#<=>` (the **spaceship** method) compares objects. `x.<=>(y)` returns
# `-1` if `x` is less than `y`. If `x` and `y` are equal, it returns `0`. If
# greater, `1`. For future reference, you can define `<=>` on your own classes.
#
# http://stackoverflow.com/questions/827649/what-is-the-ruby-spaceship-operator

class Array
  def bubble_sort!(&blk)
    blk ||= Proc.new { |x, y| x <=> y }
    idx = 0
    while idx <= self.length - 1
      num1 = self[idx]
      idx2 = idx + 1
      while idx2 <= self.length - 1
        num2 = self[idx2]
        if blk.call(num1,num2) == -1
          idx2 += 1
          next
        elsif blk.call(num1,num2) == 0
          idx2 += 1
          next
        elsif blk.call(num1,num2) == 1
          self[idx] = num2
          self[idx2] = num1
          break
        end
        idx2 += 1
      end
      idx += 1
      return self if self.sort.reverse == self
      idx = 0 if idx == self.length - 1 && self != self.sort
    end
    self
  end
  def bubble_sort(&prc)
    self.dup.bubble_sort!(&prc)
  end

end
# ### Substrings and Subwords
#
# Write a method, `substrings`, that will take a `String` and return an
# array containing each of its substrings. Don't repeat substrings.
# Example output: `substrings("cat") => ["c", "ca", "cat", "a", "at",
# "t"]`.
#
# Your `substrings` method returns many strings that are not true English
# words. Let's write a new method, `subwords`, which will call
# `substrings`, filtering it to return only valid words. To do this,
# `subwords` will accept both a string and a dictionary (an array of
# words).
def substrings(string)
  idx = 0
  answer_arr = []
  until idx > string.length - 1
    current_ch = string.chars[idx]
    idx2 = idx + 1
    concat_str = ""
    concat_str += current_ch
    answer_arr << concat_str
    until idx2 > string.length - 1
      second_ch = string.chars[idx2]
      concat_str += second_ch
      idx2 += 1
      answer_arr << concat_str
    end
    idx += 1
  end
  answer_arr
end

def subwords(word, dictionary)
  sub_arr = substrings(word)
  sub_arr.map! {|word| word if dictionary.include?(word)}.compact!
  return [] if sub_arr.all? {|ch| ch == nil}
  sub_arr.uniq
end

p subwords("asdfcatqwer", ["cat", "car"])

#######################OPTIMIZED ALGORITHM ############################
# def substrings(string)
#   combination_arr = (0..string.length).flat_map{|size| string.chars.combination(size).map(&:join) }
#   combination_arr.delete("")
#   combination_arr
# end
#
# def subwords(word, dictionary)
#   sub_arr = substrings(word)
#   sub_arr.map! {|word| word if dictionary.include?(word)}.compact.uniq.sort_by{|word| word.length}
# end

# ### Doubler
# Write a `doubler` method that takes an array of integers and returns an
# array with the original elements multiplied by two.

def doubler(array)
  array.map do |number|
    number * 2
  end
end

# ### My Each
# Extend the Array class to include a method named `my_each` that takes a
# block, calls the block on every element of the array, and then returns
# the original array. Do not use Enumerable's `each` method. I want to be
# able to write:
#
# ```ruby
# # calls my_each twice on the array, printing all the numbers twice.
# return_value = [1, 2, 3].my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end
# # => 1
#      2
#      3
#      1
#      2
#      3
#
# p return_value # => [1, 2, 3]
# ```

class Array
  def my_each(&prc)
    idx = 0
    while idx <= self.length - 1
      prc.call(self[idx])
      idx += 1
    end
    self
  end
end

# ### My Enumerable Methods
# * Implement new `Array` methods `my_map` and `my_select`. Do
#   it by monkey-patching the `Array` class. Don't use any of the
#   original versions when writing these. Use your `my_each` method to
#   define the others. Remember that `each`/`map`/`select` do not modify
#   the original array.
# * Implement a `my_inject` method. Your version shouldn't take an
#   optional starting argument; just use the first element. Ruby's
#   `inject` is fancy (you can write `[1, 2, 3].inject(:+)` to shorten
#   up `[1, 2, 3].inject { |sum, num| sum + num }`), but do the block
#   (and not the symbol) version. Again, use your `my_each` to define
#   `my_inject`. Again, do not modify the original array.

class Array
  def my_map(&prc)
    result = []
    self.my_each do |i|
      result << prc.call(i)
    end
    result
  end

  def my_select(&prc)
    result = []
    my_each { |el| result << el if prc.call(el)}
    result
  end

  def my_inject(&blk)
    val = self.first
    self.drop(1).my_each { |el| val = blk.call(val, el) }
    val
  end
end

# ### Concatenate
# Create a method that takes in an `Array` of `String`s and uses `inject`
# to return the concatenation of the strings.
#
# ```ruby
# concatenate(["Yay ", "for ", "strings!"])
# # => "Yay for strings!"
# ```

def concatenate(strings)
  strings.inject("") do |keeptrack,string|
    keeptrack + string
  end
end
