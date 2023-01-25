require "byebug"
require_relative "card.rb"

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

    def make_card_values
        #make 2 of each card. put them in 2 different random positions in the board. keep doing that until the board is full
        letters = ('a'..'z').to_a
        # debugger
        cards = []
        while cards.length < @grid.length * @grid.length
            letter = letters.sample
            if cards.none?{|card| card.value == letter}
                cards << Card.new(letter)
                cards << Card.new(letter)
            end
        end
        cards
    end

    def place_cards
        # debugger
        cards = self.make_card_values
        cards.each do |card|
            placed = false
            while placed == false
                rand_row = rand(0...@grid.length)
                rand_column = rand(0...@grid.length)
                position = [rand_row, rand_column]
                if self[position].is_a?(String)
                    self[position] = card
                    placed = true
                end
            end
        end
    end

    def render
        range = (0...@grid.length).to_a
        puts "  #{range.map(&:to_s).join(' ')}"
        i = 0
        @grid.each do |row|
            to_print = []
            to_print << i.to_s
            row.each do |card|
                to_print << card.turned
            end
            i += 1
            puts to_print.join(' ')
        end
    end

    def won?
        @grid.flatten.all? {|card| card.face == true}
    end

    def reveal (guessed_pos)
        current_card = self[guessed_pos]
        current_card.reveal
        current_card.value
    end


end