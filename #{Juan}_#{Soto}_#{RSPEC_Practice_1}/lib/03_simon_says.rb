def echo(echo)
  "#{echo}"
end

def shout (shout)
  "#{shout.upcase}"
end

def repeat(string, do_times = 2)
  repeated_str = []
  (do_times).times do |i|
    repeated_str << string
  end
  repeated_str.join(" ")
end

def start_of_word(word, up_to)
  word.chars.take_while{|i| i != word[up_to]}.join

end

def first_word(sentence)
  sentence.split(" ").take_while{|word| word == sentence.split[0]}.join
end

def titleize(string)
  def little_word(string)
    ["and", "or", "of", "in", "a", "the", "over"].include?(string)
  end
  string_arr = string.split(" ")
  string_arr.map! do |word|
    if little_word(string_arr[0])
      word.capitalize
    elsif little_word(word) != true
      word.capitalize
    else
      word = word
    end
  end
  if string_arr.length == 1
    string_arr[0].capitalize
  end
  string_arr.join(" ")
end
