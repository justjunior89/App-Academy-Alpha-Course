require_relative "board"
require_relative "player"

class BattleshipGame
  attr_reader :board, :player

  def initialize(player = HumanPlayer.new("Jeff"), board = Board.default_grid)
    @player = player
    @board = board
    @hit = false
  end
  def attack(pos)#[0,1]
    @board[pos] = :x
  end
  def count
    @board.count
  end
  def game_over?
    @board.won?
  end
  def play_turn
      attack(@player.get_play)
  end
end
