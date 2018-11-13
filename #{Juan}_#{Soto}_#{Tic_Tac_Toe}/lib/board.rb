class Board
  attr_reader :grid, :marks

  def self.blank_grid
    Array.new(3) { Array.new(3) }
  end

  def initialize(grid = Board.blank_grid)
    @grid = grid
    @marks = [:X, :O]
  end

  def place_mark(pos,mark)
    @grid[pos[0]][pos[1]] = mark
  end

  def empty?(pos)
    @grid[pos[0]][pos[1]] == nil
  end

  def winner
     return :X if @grid[0].all?{|symbol| symbol == :X} || @grid[1].all?{|symbol| symbol == :X} || @grid[2].all?{|symbol| symbol == :X}
     return :X if (@grid[0][0] == :X && @grid[1][1] == :X && @grid[2][2] == :X) || (@grid[2][0] == :X && @grid[1][1] == :X && @grid[0][2] == :X)
     return :X if (@grid[0][0] == :X && @grid[1][0] == :X && @grid[2][0] == :X) || (@grid[0][1] == :X && @grid[1][1] == :X && @grid[2][1] == :X) || (@grid[0][2] == :X && @grid[1][2] == :X && @grid[2][2] == :X)
     # return :X if @grid.all? { |row| row[0] == :X } || @grid.all? { |row| row[1] == :X } || @grid.all? { |row| row[2] == :X }
     return :O if @grid[0].all?{|symbol| symbol == :O} || @grid[1].all?{|symbol| symbol == :O} || @grid[2].all?{|symbol| symbol == :O}
     return :O if (@grid[0][0] == :O && @grid[1][1] == :O && @grid[2][2] == :O) || (@grid[2][0] == :O && @grid[1][1] == :O && @grid[0][2] == :O)
     return :O if (@grid[0][0] == :O && @grid[1][0] == :O && @grid[2][0] == :O) || (@grid[0][1] == :O && @grid[1][1] == :O && @grid[2][1] == :O) || (@grid[0][2] == :O && @grid[1][2] == :O && @grid[2][2] == :O)
     nil
  end

  def over?
   return false if @grid.all? {|sub| sub.all?{|el| el == nil }}
   return true if @grid.all? {|sub| sub.all?{|el| el != nil }}
   winner == nil ? false : true
  end 

end
