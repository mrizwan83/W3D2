require_relative 'card.rb'
require_relative 'board.rb'
require 'byebug'
require_relative 'humanplayer.rb'
class Game 
    attr_accessor :board, :grid, :previous_guess, :guessed_pos

    def initialize
        @player = HumanPlayer.new
        @board = Board.new
        @board.populate
        @grid = @board.grid
        @previous_guess = []
        @guessed_pos = []
    end 

    def game_over? 
        if @grid.flatten.all? {|card| !card.face_down}
            return true 
        else
            return false
        end
    end

    def play
        while !game_over?
            p @board.render
            @guessed_pos = @player.get_input
            @player.receive_revealed_card(@guessed_pos, @grid[@guessed_pos].value)
            make_guess(@guessed_pos)
        end
        return 'game over! you have found all the pairs'
    end
       
    def make_guess(pos)
        system("clear")
        @board.reveal(pos)
        revealed_card = @board[pos].value
        if @previous_guess.empty?
            @previous_guess = pos
        else
            if revealed_card != @board[@previous_guess].value
                p @board.render
                sleep(1)
                system("clear")
                @board[pos].hide 
                @board[@previous_guess].hide
            else
                @board[@previous_guess].reveal
                @board.reveal(pos)
            end
            @previous_guess = []
        end 
    end
end

g = Game.new
g.play