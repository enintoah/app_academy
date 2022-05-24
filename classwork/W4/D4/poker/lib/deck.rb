require_relative "card.rb"

class Deck 

    attr_reader :deck
    def initialize
        @deck = []
        values = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king]
        styles = [:d, :s, :h, :c]
        styles.each do |style|
            values.each do |value|
                @deck << Card.new(value, style)
            end
        end
        @deck = shuffle_deck(@deck)
    end
    
    def shuffle_deck(arr)
        return arr.shuffle!
    end
end