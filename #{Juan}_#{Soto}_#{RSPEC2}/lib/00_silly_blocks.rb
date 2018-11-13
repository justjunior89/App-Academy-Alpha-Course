
def reverser(&block)
  words = yield.split(" ")
  transformed_words = words.inject(""){ |sum, word| sum = sum + word.reverse + " "}
  transformed_words.strip
end

def adder(num = 1, &add)
  yield + num
end

def repeater(repeat = 1, &blk)
  repeat.times { yield }
end
