require "byebug"
  class ComputerPlayer
    attr_reader :name, :board
    attr_accessor :mark

    def initialize(name)
      @name = name
    end

    def display(board)
    @board = board
    end

    def get_move
       marked_pos = [] #[[],[]]
       possible_pos = []#[[],[],[]]
       (0..2).each do |x|
           (0..2).each do |y|
               possible_pos << [x, y] if @board.grid[x][y] == nil
               marked_pos << [x, y] if @board.grid[x][y] != nil
           end
       end
       possible_pos.each do |sub_arr|
           @board.grid[sub_arr[0]][sub_arr[1]] = mark
           return sub_arr if @board.winner != nil
           @board.grid[sub_arr[0]][sub_arr[1]] = nil
       end
       possible_pos.sample
    end

  end
