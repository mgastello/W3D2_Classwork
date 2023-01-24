require "byebug"

class Board

    def initialize(size=4)
        @grid = Array.new(size) { Array.new(size) {' '} }
        raise 'size needs to be even' if size.odd?
    end

    def [](position)
        row, col = position
        @grid[row][col]
    end

    def []=(position, value)
        row, col = position
        @grid[row][col] = value
    end

    def populate
        #make 2 of each card. put them in 2 different random positions in the board. keep doing that until the board is full
        letters = ('a'..'z').to_a
        debugger
        values = []
        while values.length < @grid.length * @grid.length
            value = letters.sample
            if !values.include?(value)
                values << value
                values << value
            end
        end
        values
    end
    def place_cards(letters, position)
        rand_row = rand(0...@grid.length)
        rand_column = rand(0...@grid.length)
        position = @grid[rand_row, rand_column]
        if self[position].empty?
            self[position] = 
    end
end