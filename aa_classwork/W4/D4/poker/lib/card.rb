class Card

    attr_reader :value, :class
    def initialize(value, style)
        values = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king]
        styles = [:d, :s, :h, :c]
        if !values.include?(value) || !styles.include?(style)
            raise "not valid value or style"
        else 
            @value = value
            @class = style
        end
    end
end