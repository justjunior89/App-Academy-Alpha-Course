class Code
  attr_reader :pegs
  PEGS = {
      "B" => :blue,
      "O" => :orange,
      "Y" => :yellow,
  }

  def initialize(pegs)
        @pegs = pegs
  end

  def [](pos)
     @pegs[pos]
  end

  def self.parse(string)
      string.each_char do |ch|
          raise "select a valid color" if !PEGS.keys.include?(ch.upcase)
      end
      Code.new(string.chars)
  end
  def self.random
      array = []
      4.times { array << PEGS.keys.sample }
      Code.new(array)
  end
  def exact_matches(colors) # colors = <Code.new @pegs =....> colors.pegs => ['b', 'b'...]
      count = 0
      self.pegs.each_with_index do |el,i|
          if colors.pegs[i] == el
              count += 1
          end
      end
      count
  end

  def near_matches(colors)
      array = []
      self.pegs.each_with_index do |el,i|
          if colors.pegs.include?(el) && colors.pegs[i] != el
              array << el
          end
      end
      self.pegs.each_with_index do |el, i|
          array.delete(el) if colors.pegs[i] == el
      end
      array.uniq.length
  end

  def ==(color)
      return false if color.class != Code
      self.pegs.join.upcase == color.pegs.join.upcase
  end
end

class Game
  attr_reader :secret_code

  def initialize(code = Code.random)
      @secret_code = code
  end

  def get_guess
        Code.parse(@secret_code.pegs.join)
  end
  def display_matches(code)
    p "exact matches : #{@secret_code.exact_matches(code)}"
    p "near matches : #{@secret_code.near_matches(code)}"
  end

end
