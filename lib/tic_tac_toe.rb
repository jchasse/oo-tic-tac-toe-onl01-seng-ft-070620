require "pry"

class TicTacToe

  attr_accessor :board

def initialize(board = nil)
  @board = board || Array.new(9, " ")
end

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6]

  expect(TicTacToe::WIN_COMBINATIONS).to include_array([0,1,2])
  expect(TicTacToe::WIN_COMBINATIONS).to include_array([3,4,5])
  expect(TicTacToe::WIN_COMBINATIONS).to include_array([6,7,8])
  expect(TicTacToe::WIN_COMBINATIONS).to include_array([0,3,6])
  expect(TicTacToe::WIN_COMBINATIONS).to include_array([1,4,7])
  expect(TicTacToe::WIN_COMBINATIONS).to include_array([2,5,8])
  expect(TicTacToe::WIN_COMBINATIONS).to include_array([0,4,8])
  expect(TicTacToe::WIN_COMBINATIONS).to include_array([6,4,2])

]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i-1
  end

  def move(input, token = "X")
    board[input] = token
  end

  def position_taken?(input)
    board[input] != " "
  end

  def valid_move?(input)
    input < 9 && input >= 0 && board[input] == " "
  end

  def turn_count
    board.count do |x|
      x == "X" || x == "O"
    end
  end

  def current_player
    if turn_count.even?
      "X"
    else
      "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
      # board[user_input] = current_player
    else
      turn
    end
  end

  def won?
      if WIN_COMBINATIONS.any? do |winning_array|
        if winning_array.all? {|num| board[num] == "X"}
          return winning_array
        elsif winning_array.all? {|num| board[num] == "O"}
          return winning_array
        end
      end
    end
  end

  def full?
    turn_count == 9
  end

  def draw?
    if won? != nil
      false
    else
      full? == true
    end
  end

  def over?
    won? != nil || full? == true
  end

  def winner
    if won? != nil
      if turn_count.odd?
        "X"
      else
        "O"
      end
    else
      nil
    end
  end

  def play
    until over? || won?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end
