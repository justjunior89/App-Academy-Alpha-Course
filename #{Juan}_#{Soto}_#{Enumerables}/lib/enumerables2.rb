
# EASY

# Define a method that returns the sum of all the elements in its argument (an
# array of numbers).
def array_sum(arr)
  return 0 if arr.empty?
  arr.reduce(:+)
end

# Define a method that returns a boolean indicating whether substring is a
# substring of each string in the long_strings array.
# Hint: you may want a sub_tring? helper method
def sub(sentence,target)
  word_arr = sentence.split(" ")
  word_arr.each do |word|
    return true if word == target
  end
  false
end

def in_all_strings?(long_strings, substring)
  idx = 0
  while idx <= long_strings.length - 1
    if sub(long_strings[idx],substring)
      idx += 1
      next
    else
      return false
    end
    idx += 1
  end
  true
end
# Define a method that accepts a string of lower case words (no punctuation) and
# returns an array of letters that occur more than once, sorted alphabetically.
def repeats(string)
  repeaters = []
  char_arr = string.chars
  char_arr.each.with_index do |ch,i|
    unless i == char_arr.length - 1
      if char_arr[i + 1..-1].include?(ch) && ch != " "
        repeaters << ch
      end
    end
  end
  repeaters
end

def non_unique_letters(string)
  uniqe = []
  uniqe << repeats(string)
  uniqe = uniqe.flatten.sort.uniq
  uniqe.delete(" ")
  uniqe
end

# Define a method that returns an array of the longest two words (in order) in
# the method's argument. Ignore punctuation!
def longest_two_words(string)
  first = ""
  second = ""
  string.split(" ").each do |word|
    if first.empty? || word.length > first.length
      second = first
      first = word
    elsif second.empty? || word.length > second.length
      second = word
    end
  end
  [second,first]
end

# MEDIUM

# Define a method that takes a string of lower-case letters and returns an array
# of all the letters that do not occur in the method's argument.
def missing_letters(string)
  alphabet = ("a".."z").to_a
  string.each_char do |char|
    alphabet.delete(char)
  end
  alphabet
end
# Define a method that accepts two years and returns an array of the years
# within that range (inclusive) that have no repeated digits. Hint: helper
# method?
def no_repeat_years(first_yr, last_yr)
  year_arr = (first_yr..last_yr).to_a
  year_arr.map! do |year|
    if not_repeat_year?(year) == false
      year = ""
    else
      year
    end
  end
  year_arr.delete("")
  year_arr
end

def not_repeat_year?(year)
  year_chars = year.to_s.chars
  year_chars == year_chars.uniq ? true : false
end
# HARD

# Define a method that, given an array of songs at the top of the charts,
# returns the songs that only stayed on the chart for a week at a time. Each
# element corresponds to a song at the top of the charts for one particular
# week. Songs CAN reappear on the chart, but if they don't appear in consecutive
# weeks, they're "one-week wonders." Suggested strategy: find the songs that
# appear multiple times in a row and remove them. You may wish to write a helper
# method no_repeats?
def one_week_wonders(songs)
  songs.select {|song| no_repeats?(song, songs)}.uniq
end

def no_repeats?(song_name, songs)
  songs.each_with_index do |song, idx|
    unless idx == songs.length - 1
      if song == song_name
        return false if song == songs[idx+1]
      end
    end
  end
  true
end

# Define a method that, given a string of words, returns the word that has the
# letter "c" closest to the end of it. If there's a tie, return the earlier
# word. Ignore punctuation. If there's no "c", return an empty string. You may
# wish to write the helper methods c_distance and remove_punctuation.

def for_cs_sake(string)
  string.delete!("?!.,;:-")
  result = ""

  arr = string.downcase.split
  if !string.downcase.include?("c")
    return ""
  else
    arr.reduce do |acc, word|
      if !word.include?("c")
        acc
      elsif c_distance(word) < c_distance(acc)
        word
      else
        acc
      end
    end
  end
end

def c_distance(word)
  if !word.include?("c")
    return 1000
  end
  arr = word.downcase.chars.reverse
  arr.index("c")
end

# Define a method that, given an array of numbers, returns a nested array of
# two-element arrays that each contain the start and end indices of whenever a
# number appears multiple times in a row. repeated_number_ranges([1, 1, 2]) =>
# [[0, 1]] repeated_number_ranges([1, 2, 3, 3, 4, 4, 4]) => [[2, 3], [4, 6]]
def repeated_number_ranges(array)
  start_idx = nil
  index_arr = []
  array.each_with_index do |number,i|
    next_num = array[i + 1]
    if number == next_num
      start_idx = i unless start_idx != nil
    elsif start_idx != nil
      index_arr << [start_idx,i]
      start_idx = nil
    end
  end
  index_arr
end
