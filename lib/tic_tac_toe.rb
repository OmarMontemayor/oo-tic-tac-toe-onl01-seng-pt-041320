class TicTacToe
  def inititialize(board = nil)
    @board = board || Array.new(9, " ")
  end
end