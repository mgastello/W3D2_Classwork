class Card

    def initialize(face, value)
        @face = face
        @value = value
    end

    def face
        @face
    end

    def value
        return @value if @face == true
    end

    def hide
        @face = false
    end

    def reveal
        @face = true
    end

    def ==(card)
        self.value == card.value
    end
    
    def to_s

    end
    
end