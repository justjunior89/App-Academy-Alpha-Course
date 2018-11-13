def pig_consonant (string)
  string.each_char.with_index do |ch, i |
    if string.include?("qu") && string.chars.index("u") != string.length - 1
        find_u = string.index("u")
        string = string[find_u + 1..-1] + string[0..find_u] + "ay"# square
        break
    end
    if ch.scan(/[aeiouAEIOU]/) == []
      grab = string.slice!(ch)
      string = string + grab
    elsif ch.scan(/[aeiouAEIOU]/) == [ch]
      string = string + "ay"
      break
    end
  end
  string
end

def pig_vowel (string)
  string + "ay"
end

def translate(string)
  string_arr = string.split(" ")
  pig_str = []
  string_arr.each_with_index do |word,i|
    if word[0].scan(/[aeiouAEIOU]/) == [word[0]]

      pig_str << pig_vowel(word)

    else

      pig_str << pig_consonant(word)

    end
  end
  pig_str.join(" ")
end
