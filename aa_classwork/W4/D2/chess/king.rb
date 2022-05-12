require_relative "piece.rb"

class King < Piece

    attr_reader :pos, :board, :color
    def initialize(color, board, pos)
        super
    end

    def moves 
        step(pos)
    end

end