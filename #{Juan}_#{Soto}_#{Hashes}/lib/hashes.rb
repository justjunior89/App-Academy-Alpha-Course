# EASY

# Define a method that, given a sentence, returns a hash of each of the words as
# keys with their lengths as values. Assume the argument lacks punctuation.
def word_lengths(str)
  hash = Hash.new(0)
  str.split.each do |word|
    hash[word.downcase] = word.length
  end
  hash
end

# Define a method that, given a hash with integers as values, returns the key
# with the largest value.
def greatest_key_by_val(hash)
  frequency = hash.sort_by {|k,v| v}.last
  frequency[0]
end

# Define a method that accepts two hashes as arguments: an older inventory and a
# newer one. The method should update keys in the older inventory with values
# from the newer one as well as add new key-value pairs to the older inventory.
# The method should return the older inventory as a result. march = {rubies: 10,
# emeralds: 14, diamonds: 2} april = {emeralds: 27, moonstones: 5}
# update_inventory(march, april) => {rubies: 10, emeralds: 27, diamonds: 2,
# moonstones: 5}
def update_inventory(older, newer)
  older.map { |k,v| older[k] = newer[k] if newer.has_key?(k) }
  newer.each { |k,v| older[k] = newer[k] if !older.has_key?(k) }
  older
end
# Define a method that, given a word, returns a hash with the letters in the
# word as keys and the frequencies of the letters as values.
def letter_counts(word)
  hsh = Hash.new(0)
  word.each_char do |ch|
    hsh[ch] += 1
  end
  hsh
end

# MEDIUM

# Define a method that, given an array, returns that array without duplicates.
# Use a hash! Don't use the uniq method.
def my_uniq(arr)
  uniq_arr = []
  hsh = Hash.new(0)
  arr.each do |el|
    hsh[el] += 1
  end
  hsh.each do |k,v|
    uniq_arr << k
  end
  uniq_arr
end
# Define a method that, given an array of numbers, returns a hash with "even"
# and "odd" as keys and the frequency of each parity as values.
def evens_and_odds(numbers)
  hsh = Hash.new(:even)
  hsh = {:even => 0 , :odd => 0}

  numbers.each do |number|
    if number.even?
      hsh[:even] += 1
    else
      hsh[:odd] += 1
    end
  end
  hsh
end

# Define a method that, given a string, returns the most common vowel. Do
# not worry about ordering in the case of a tie. Assume all letters are
# lower case.
def most_common_vowel(string)
  hsh = Hash.new(0)
  vowels = ["a","e","i","o","u"]
  string.each_char do |ch|
    if vowels.include?(ch)
      hsh[ch] += 1
    end
  end
  most_vowel = hsh.sort_by{|k,v| v}.last
  most_vowel[0]
end

# HARD

# Define a method that, given a hash with keys as student names and values as
# their birthday months (numerically, e.g., 1 corresponds to January), returns
# every combination of students whose birthdays fall in the second half of the
# year (months 7-12). students_with_birthdays = { "Asher" => 6, "Bertie" => 11,
# "Dottie" => 8, "Warren" => 9 }
# fall_and_winter_birthdays(students_with_birthdays) => [ ["Bertie", "Dottie"],
# ["Bertie", "Warren"], ["Dottie", "Warren"] ]
def fall_and_winter_birthdays(students)
  selected = students.select!{|k,v| v >= 7}.keys
  selected.combination(2).to_a
end

# Define a method that, given an array of specimens, returns the biodiversity
# index as defined by the following formula: number_of_species**2 *
# smallest_population_size / largest_population_size biodiversity_index(["cat",
# "cat", "cat"]) => 1 biodiversity_index(["cat", "leopard-spotted ferret",
# "dog"]) => 9
def biodiversity_index(specimens)
  hsh = Hash.new(0)
  specimens.each do |k,v|
    hsh[k] += 1
  end
  number_species = (hsh.keys.uniq.length) ** 2
  smallest = hsh.sort_by{|v| v}.to_h.values[0]
  largest = hsh.sort_by{|v| v}.to_h.values[0]
  answer = number_species * (smallest / largest)
end



# Define a method that, given the string of a respectable business sign, returns
# a boolean indicating whether pranksters can make a given vandalized string
# using the available letters. Ignore capitalization and punctuation.
# can_tweak_sign("We're having a yellow ferret sale for a good cause over at the
# pet shop!", "Leopard ferrets forever yo") => true
def character_count(str)
  no_punct = [".",",","?","!",";",":","''","'"]
  free_str = ""
  str.each_char do |ch|
    if no_punct.include?(ch)
       next
    else
      free_str += ch.downcase
    end
  end
  free_str
end

def can_tweak_sign?(normal_sign, vandalized_sign)
  normal_words = normal_sign.split.map {|word| word = character_count(word)}
  vandalized_sign = vandalized_sign.split.map {|word| word = character_count(word)}
  normal_hsh = Hash.new(0)
  vandal_hsh = Hash.new(0)
  normal_words.join.each_char do |ch|
    normal_hsh[ch] += 1
  end
  vandalized_sign.join.each_char do |ch|
    vandal_hsh[ch] += 1
  end
  normal_keys = normal_hsh.keys.sort
  vandal_keys = vandal_hsh.keys.sort
  return false if vandal_keys.each.any? {|van| normal_keys.include?(van) == false }
  vandal_hsh.each do |k,v|
    if normal_hsh[k] < v
      return false
    end
  end
  true
end
