require_relative "piece.rb"
require 'colorize'


class Rook < Piece

    attr_reader :pos, :board, :color
    def initialize(color, board, pos)
        super
    end

    def moves 
        horizontal(pos)
    end

    def to_s
        if color == :white 
            "♜".colorize(:white)
        else
            "♖".colorize(:black)
        end
    end

end

