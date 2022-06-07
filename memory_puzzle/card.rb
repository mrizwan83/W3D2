class Card 
    attr_reader :face_down, :value
    ALPHA = ('a'..'z').to_a

    def initialize
        @face_down = true
        @value = ALPHA.pop
    end 

    def hide
        if !@face_down
            @face_down = true
        end 
    end 

    def reveal
        if face_down 
            @face_down = false 
        end 
    end 

    def to_s
        self.to_s
    end 

    def !=(other_card)
        other_card.value != self.value 
    end 


end