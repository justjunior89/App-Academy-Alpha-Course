class HumanPlayer
  attr_reader :name
  attr_accessor :mark
  def initialize(name)
      @name = name
  end
  def get_move
        puts "Please make a move where you see fit."
  end
  def get_move
     puts "Please make a move where you see fit."
     input = gets.chomp.split(', ')
     input = input.map(&:to_i)
  end
  def display(board)
    board.grid.each do |x|
      x.each { |y| print y }
    end 
  end

end
