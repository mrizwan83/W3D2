require "byebug"
require_relative 'card.rb'
class Board
    attr_reader :size, :total_cards, :grid
    def initialize(size=4)
        @grid = Array.new(size) {Array.new(size, '_')}
        @total_cards = size * size 
        @size = size
    end 

    def[](pos)
        row, col = pos
        @grid[row][col]
    end 

    def []=(pos, value)
        row, col = pos 
        @grid[row][col] = value 
    end 

    def random_position 
        row = rand(0...@size)
        col = rand(0...@size)
        return pos = [row, col]
    end

    # def empty?
    #     self.flatten.any? { |ele| ele == '_' }
    # end

    def populate
        (@total_cards/2).times do 
            card = Card.new
            2.times do 
                pos = random_position
                while self[pos] != '_'
                    pos = random_position
                end
                self[pos] = card  
            end
        end 
    end

    def cheat
        @grid.map do |row|
            row.map {|card| card.value}
        end
    end

    def render 
        @grid.map do |row|
            row.map do |card|
                if card.face_down
                    "_"
                else
                    card.value
                end
            end
        end
    end
    
    def won? 
        return @grid.flatten.all? {|card| card.face_down}
    end 

    def reveal(guessed_pos) 
        guessed_card = self[guessed_pos]
        guessed_card.reveal
        return guessed_card.value
    end 
               
end 

