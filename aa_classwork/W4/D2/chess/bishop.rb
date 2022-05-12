require_relative "piece.rb"

class Bishop < Piece

    attr_reader :pos, :board, :color

    def initialize(color, board, pos)
        super
    end

    def moves 
        diagonal(pos)
    end

end