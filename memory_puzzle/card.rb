class Card 
    attr_reader :face_down, :value

    def initialize(value)
        @face_down = true
        @value = value
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

end