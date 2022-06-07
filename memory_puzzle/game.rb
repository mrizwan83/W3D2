require_relative 'card.rb'
require_relative 'board.rb'
class Game 

    def initialize
        @board = Board.new
        @previous_guess = []
        @guessed_pos = []
    end 

    def game_over? 
        if @board.grid.flatten.all? {|card| !card.face_down}
            return 'game over! you have found all the pairs'
            return true 
        else
            return false
        end
    end

    def play
        while !game_over?
            @board.render
            puts "enter a valid position row col seperated by a space like '3 2'"
            @guessed_pos = gets.chomp.split.map(&:to_i)
            make_guess(@guessed_pos)
        end
    end
       
    def make_guess(pos)
        system("clear")
        @board.reveal(pos)
        if @previous_guess.empty?
            @previous_guess = pos
        else
            if @board[pos] != @board[@previous_guess]
                sleep(4)
                @board[pos].hide 
                @board[@previous_guess].hide
            end 
        end 
        @previous_guess = []
    end
end

g = Game.new
g.play