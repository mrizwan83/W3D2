class ComputerClass 
    attr_accessor :known_cards, :matched_cards

    def initialize
        @known_cards = {}
        @matched_cards = {}
        @positions = []
    end 

    def get_input
        input = random_position
        if !@positions.include?(input)
            @positions << input 
        end
    end 
        
    def random_position 
        row = rand(0...@size)
        col = rand(0...@size)
        return pos = [row, col]
    end

    def receive_revealed_card(pos, val)
        @known_cards[val] = pos
    end 

    def receive_match(pos1, pos2)
        @matched_cards[pos1.value] = [pos1, pos2]
    end 

end 