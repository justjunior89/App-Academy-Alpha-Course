class Board
  attr_accessor :grid
  def initialize(grid = Board.default_grid)
    @grid = grid
  end
  def self.default_grid
    Array.new(10){Array.new(10)}
  end

  def count
      counter = 0
      @grid.each do |sub_arr|
          sub_arr.each do |el|
              if el == :s
                counter +=1
              end
          end
      end
      counter
  end

  def empty?(pos = nil)
      if pos == nil
          @grid.each do |sub_arr|
              sub_arr.each do |el|
                  return false if el == :s
              end
          end
          true
      else
          @grid[pos[0]][pos[1]] == nil #keep this but you have to do bracket getter method
      end
  end

  def full?
      @grid.all? { |sub_array| sub_array.all?{|el| el == :s}}
  end

  def place_random_ship
      raise "Your board is full" if self.full?
      possible_pos = []
      @grid.each_with_index do |sub_arr,i|
          sub_arr.each_with_index do |el,idx|
              if el == nil
                 possible_pos << [i,idx]
              end
          end
      end
      move = possible_pos.sample
      @grid[move[0]][move[1]] = :s
  end
  def won?
     @grid.all?{|sub_arr| sub_arr.all?{|el| el == nil}}
  end
  def [](pos)
    @grid[pos[0]][pos[1]]
  end
# setter method
  def []=(pos, value)
    @grid[pos[0]][pos[1]] = value
  end
end
