class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(number)
    number.to_i - 1
  end
  
  def move(index, current_player)
    @board[index] = current_player
  end
  
  def position_taken?(index)
    @board[index] != " " && @board[index] != ""
  end
  
  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end
  
  def turn_count
    counter = 0
    @board.each do |index| 
      if index != " "
        counter += 1
      end
    end
    counter
  end
  
  def current_player
    if turn_count.even?
      "X"
    else
      "O"
    end
  end
  
  def turn
    puts "Pick a spot from 1-9"
    input = gets
    index = input_to_index(input)
    if valid_move?(index) == true
      move(index, current_player)
      display_board
    else
      turn
    end
  end
  
  def won?
    combo = 0
    while combo < WIN_COMBINATIONS.length
      new_combo = WIN_COMBINATIONS[combo]
      x = new_combo.all?{|pos| @board[pos] == "X"}
      o = new_combo.all?{|pos| @board[pos] == "O"}
      if x == true || o == true
        new_combo
      else
        false
      end
      combo += 1
    end
    new_combo.to_ary
  end
end