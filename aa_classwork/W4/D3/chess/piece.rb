require_relative "slideable"
require_relative "stepable"

class Piece

    include Stepable
    include Slideable

    attr_writer :pos
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos 
    end

    # def moves

    # end

end