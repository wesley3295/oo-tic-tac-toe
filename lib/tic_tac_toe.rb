

class TicTacToe
    attr_accessor :input, :token
    
WIN_COMBINATIONS = [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]

    def initialize 
        @board = [" "," "," "," "," "," "," "," "," "]
        @input = input
        @token = token
        
    end

    def display_board
    puts  " #{@board[0]} "+"|"+" #{@board[1]} "+"|"+" #{@board[2]} "
    puts  "-----------"
    puts " #{@board[3]} "+"|"+" #{@board[4]} "+"|"+" #{@board[5]} "
    puts "-----------"
    puts  " #{@board[6]} "+"|"+" #{@board[7]} "+"|"+" #{@board[8]} "
    end

def input_to_index(input)
   @input = input.to_i - 1
end

# def move(index, token = "X")
#     @input = index
#     @token= token
# @board[@input] = @token
# end

def position_taken?(index)
     @board[index] != " "

    # if @board[index] == " "
    #     false
    # elsif @board[index] == "X" || "O"
    #     true
    # end
end

def valid_move?(index)
    
    #if value.between?(lower, higher)
    index.between?(0, 8) && !position_taken?(index)
end

def turn_count
    # @board.count {|token| != " "}
    count = 0
@board.each do |i|
    if i == "X" || i == "O" 
        count+=1
    end
end
count
end

def current_player
    if turn_count.even?
     "X"
    else
    "O"
    end
end

def move(index, token = "X")
@board[index] = token
end

def turn
 input = gets.strip
 index = input_to_index(input)
    if valid_move?(index)
        move(index, current_player)
        # token = current_player
        # move(index, token)
    else
        #recursion calling a method within itself
        turn
    end
 display_board
end

    def won?
        # WIN_COMBINATIONS.find do |combo|

        #     index_1 = combo[0]
        #     index_2 = combo[1]
        #     index_3 = combo[2]

        #     token_1 = @board[index_1]
        #     token_2 = @board[index_2]
        #     token_3 = @board[index_3]

        #     token_1 == token_2 && token_2 == token_3 && token_1 != " "
        # end

        WIN_COMBINATIONS.each do |combo|
           index_0 = combo[0]
           index_1 = combo[1]
           index_2 = combo [2]

           position_0 = @board[index_0]
           position_1 = @board[index_1]
           position_2= @board[index_2]

           if position_0 == "X" && position_1 == "X" && position_2 == "X" 
            return combo
           elsif position_0 == "O" && position_1 == "O" && position_2 == "O"
            return combo
           end
        end
        return false
    end

    def full?
        @board.all?{|a| a != " " }
    end

def draw?
     full? && !won? 
end

def over?
    won? || draw? || full?
end

def winner
  if  combo = won?
    @board[combo[0]]
  end
end
    
def play
     turn until over?
     if winner
     puts "Congratulations #{winner}!"
     else
        puts "Cat's Game!"
     end
end

    end