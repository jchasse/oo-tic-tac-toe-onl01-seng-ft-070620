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
    !position_taken?(index) && index.between?(0,8)
  end

  def turn_count
    board.count {|space| space == "X" || space == "O"}
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
      if WIN_COMBINATIONS.find do |win_combo|
        if win_combo.all? {|num| board[num] == "X"}
          return win_combo
        elsif win_combo.all? {|num| board[num] == "O"}
          return win_combo
        end
      WIN_COMBINATIONS.find do |win_combo|
        position_1_index = win_combo[0]
        position_2_index = win_combo[1]
        position_3_index = win_combo[2]

        position_1_token = board[position_1_index]
        position_2_token = board[position_2_index]
        position_3_token = board[position_3_index]





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
