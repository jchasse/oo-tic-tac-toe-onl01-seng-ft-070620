require "pry"

class TicTacToe

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [2,4,6]
  ]

  attr_reader :board

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    @index = input.to_i - 1
  end

  def move(index, token = "X")
    board[index] = token
  end

  def position_taken?(index)
    board[index] != " "
  end

  def valid_move?(index)
    position_taken?(index) && index.between?(0,8)

    input < 9 && index >= 0 && board[index] == " "
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
