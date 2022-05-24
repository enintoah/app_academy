require_relative "piece.rb"


class Rook < Piece

    attr_reader :pos, :board, :color
    def initialize(color, board, pos)
        super
    end

    def moves 
        horizontal(pos)
    end



end

