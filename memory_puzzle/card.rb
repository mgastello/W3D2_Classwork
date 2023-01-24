require "byebug"
class Card

    def initialize(value)
        @face = false
        @value = value
    end

    def face
        @face
    end

    def value
        @value
    end
    def to_s
        if @face == true
            return @value 
        else
            return ' '
        end
    end

    def hide
        @face = false
    end

    def reveal
        @face = true
    end

    def ==(card)
        return self.value == card.value
    end
    
    def to_s

    end

end