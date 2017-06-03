class TicTacToe
 def initialize(board=nil)
   @board = board || Array.new(9, " ")
 end

 WIN_COMBINATIONS = [
   [0,1,2], # Top row
   [3,4,5], # Middle row
   [6,7,8], # Bottom row
   [0,3,6], # Left colomn
   [1,4,7], # Middle colomn
   [2,5,8], # Right colomn
   [0,4,8], # Left diagonal
   [2,4,6], # Right diagonal
 ]

 def display_board
   puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
   puts "-----------"
   puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
   puts "-----------"
   puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
 end

 def input_to_index(input)
   input.to_i - 1
 end

 def move(index, player)
   @board[index] = player
 end

 def position_taken?(index)
   @board[index] == "X" || @board[index] == "O"
 end

 def valid_move?(index)
   index.between?(0,8) && !position_taken?(index)
 end

 def turn_count
   count = 0
   @board.each do |boards|
     if boards == "X" || boards == "O"
       count += 1
     end
   end
   count
 end

 def current_player
   moves = turn_count
   player = moves % 2 == 0 ? "X" : "O"
 end

 def turn
     player = current_player
     puts "Please enter 1-9:"
     input = gets.strip
     index = input_to_index(input)

     if valid_move?(index)
       move(index, player)
       display_board
     else
       turn
     end
 end

 def won?
       WIN_COMBINATIONS.each do |win_combination|
       # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
       # grab each index from the win_combination that composes a win.
       win_index_1 = win_combination[0]
       win_index_2 = win_combination[1]
       win_index_3 = win_combination[2]

       position_1 = @board[win_index_1] # load the value of the board at win_index_17
       position_2 = @board[win_index_2] # load the value of the board at win_index_2
       position_3 = @board[win_index_3] # load the value of the board at win_index_3

       if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
          return win_combination # return the win_combination indexes that won.
       else
         false
       end
         false
      end
         false
 end

 def full?
   @board.none? do |cell|
     cell == "" || cell == " " || cell == nil
   end
 end

 def draw?
     won? == false && full? == true
 end

 def over?
    won? || draw?
 end

 def winner
   if won? != false
      won?.each do |winners|
         if @board[winners] == "X"
           return "X"
         else
           return "O"
         end
       end
   else
    return nil
  end
 end

 # Define your play method below
 def play
   until over? do
      turn
      if winner
        break
      end
   end
   if won?
     if winner == "X"
       puts "Congratulations X!"
     else
       puts "Congratulations O!"
     end
   elsif draw?
     puts "Cat's Game!"
   end
 end
end