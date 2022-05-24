require_relative "piece.rb"

class Queen < Piece

    attr_reader :pos, :board, :color
    def initialize(color, board, pos)
        super
    end

    def moves 
        horizontal(pos) + diagonal(pos)
    end

end
