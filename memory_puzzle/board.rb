class Board

    def initialize(size=4)
        @grid = Array.new(size) { Array.new(size) { [] } }
        if size.odd? raise 'size needs to be even'
    end

    def populate
        #make 2 of each card. put them in 2 different random positions in the board. keep doing that until the board is full
        letters = ['a'..'z']
        values = []
        while values.length < @grid.length * @grid.length
            value = letters.sample
            if !values.include?(value)
                values << value
                values << value
            end
        end
    end
end