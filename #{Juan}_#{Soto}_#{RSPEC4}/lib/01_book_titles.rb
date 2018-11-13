class Book
  attr_reader :title
  def title=(title)
    small = ["the","a","an","and","in","of"]
    word_arr = title.split(" ").map(&:downcase)
    word_arr.map!.with_index do |word,i|
      if small.include?(word) && i != 0
       word
      else
       word.capitalize
      end
    end
    @title = word_arr.join(" ")
  end
end
