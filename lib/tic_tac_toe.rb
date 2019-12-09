class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], #Top row
    [3,4,5], #Middle row
    [6,7,8], #Bottom row
    [0,3,6], #First column
    [1,4,7], #Second column
    [2,5,8], #Third column
    [0,4,8], #First diagonal
    [2,4,6] #Second diagonal
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    index = input.to_i
    index -= 1
    index
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] == " " ? false : true
  end

  def valid_move?(index)
    self.position_taken?(index) == false && index > -1 && index < 10 ? true : false
  end

  def turn
    input = gets.chomp
    index = self.input_to_index(input)
    if self.valid_move?(index)
      self.move(index, current_player)
      self.display_board
    else
      self.turn
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end


end
