require_relative "piece.rb"
require 'colorize'

class Queen < Piece

    attr_reader :pos, :board, :color
    def initialize(color, board, pos)
        super
    end

    def moves 
        horizontal(pos) + diagonal(pos)
    end

    def to_s
        if color == :black
            "♕".colorize(:black)
        else
            "♛".colorize(:white)
        end
    end
end
