require "byebug"
class Hangman
  attr_reader :guesser, :referee, :board

  def initialize(players)
      @guesser = players[:guesser]
      @referee = players[:referee]
  end
  def setup
      length = @referee.pick_secret_word
      @guesser.register_secret_length(length)
      @board = [nil] * length
  end
  
  def take_turn
      puts "please make a guess"
      character = @guesser.guess
      index_arr = @referee.check_guess(character)
      update_board(character, index_arr)
      @guesser.handle_response
  end

  def update_board(guess_ch,index_arr)
      index_arr.each do |num|
          @board[num] = guess_ch
      end
  end
end

class HumanPlayer
end

class ComputerPlayer
  attr_accessor :dictionary, :candidate_words
  def initialize(dictionary)
    @dictionary = dictionary
  end

  def pick_secret_word
    sample = @dictionary.sample.length
  end

  def check_guess(ch)
    index_arr = []
    @dictionary[0].each_char.with_index do |el,i|
      if ch == el
         index_arr << i
      end
    end
    index_arr
  end

  def register_secret_length(len)
    @candidate_words = @dictionary.select {|el| el.length == len}

  end

  def guess(board)
      array = @candidate_words.join.split(//) #["r","e"...]
      array = array.sort_by { |letter| array.count(letter) }.uniq #[,..."e"]
      until !board.include?(array.last)# board [nil,e,e,nil] [nil,r,y,nil]
          array.pop
      end
      array.last # "e"
  end


  def handle_response(ch,array) #array [0]
        @candidate_words = @candidate_words.select { |string| array.all? { |indexs| string[indexs] == ch } }
        @candidate_words.each do |string| # rear we do not want i ==4
            string.each_char.with_index do |l,i|
                if l == ch && !array.include?(i) # we want ch == r , array includes [0]
                    @candidate_words.delete(string)
                    break
                end
            end
        end
  end
end
