require "byebug"
class Array
  # Write a new Array method (using monkey-patching) that will return
  # the location of all identical elements. The keys are the
  # duplicated elements, and the values are arrays of their positions,
  # sorted lowest to highest.
  def dups
    positions = Hash.new{ |h, k| h[k] = [] }
    self.each_with_index do |item, index|
      positions[item] << index
    end
    positions.select { |key, val| val.count > 1 }
  end
end

class Array
  # Write a new `Array#pair_sum(target)` method that finds all pairs of
  # positions where the elements at those positions sum to the target.

  # NB: ordering matters. I want each of the pairs to be sorted
  # smaller index before bigger index. I want the array of pairs to be
  # sorted "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def pair_sum(target)
    pairs = []
    idx = 0
    self.each_with_index do |el1, i|
      idx = i + 1
      while idx <= self.length - 1
        el2 = self[idx]
        if el1 + el2 == target
          pairs << [i, idx]
        end
        idx += 1
      end
    end
    pairs
  end
end

# Back in the good old days, you used to be able to write a darn near
# uncrackable code by simply taking each letter of a message and incrementing it
# by a fixed number, so "abc" by 2 would look like "cde", wrapping around back
# to "a" when you pass "z".  Write a function, `caesar_cipher(str, shift)` which
# will take a message and an increment amount and outputs the encoded message.
# Assume lowercase and no punctuation. Preserve spaces.
#
# To get an array of letters "a" to "z", you may use `("a".."z").to_a`. To find
# the position of a letter in the array, you may use `Array#find_index`.

def caesar_cipher(str, shift)
  letters = ("a".."z").to_a
  #debugger
  encoded_str = ""
  if str.split.length == 1
    str.each_char do |char|
        old_idx = letters.find_index(char)
        new_idx = old_idx + shift % letters.count
        if new_idx > 25
          new_idx = new_idx - 26
        end
        encoded_str << letters[new_idx]
    end
  else
    str = str.split(" ")
    str.each do |word|
      word.each_char do |char|
        old_idx = letters.find_index(char)
        new_idx = old_idx + shift % letters.count
        if new_idx > 25
          new_idx = new_idx - 26
        end
        encoded_str << letters[new_idx]
      end
      encoded_str << " "
    end
  end
  encoded_str.strip
end

# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

# Example:
# jumble_sort("hello") => "ehllo"
# jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'

def jumble_sort(str, alphabet = nil)
  alphabet = ("a".."z").to_a if alphabet == nil
  sorted = ""
  alphabet.each do |ch1|
    str.chars.each do |ch2|
      sorted += ch2 if ch1 == ch2
    end
  end
  sorted
end

# Write a method that will transpose a rectangular matrix (array of arrays)
def transpose(matrix)
    final = []
    i = 0
    until i == matrix[0].length #i = 0
        result = []
        matrix.each_index do |idx| #idx = 1
            result << matrix[idx][i] #matrix[1][0]
        end
        final << result
        i += 1
    end
    final
end


class Array
  def my_inject(accumulator = self[0], &block)
     if accumulator == self[0]
         i = 1
         while i < length
            accumulator = block.call(accumulator, self[i])
            i += 1
         end
     else
        i = 0
        while i < self.length
          accumulator = block.call(accumulator, self[i])
          i += 1
        end
     end
    accumulator
  end
end
