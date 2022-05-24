require_relative "piece.rb"
require 'colorize'

class Bishop < Piece

    attr_reader :pos, :board, :color

    def initialize(color, board, pos)
        super
    end

    def moves 
        diagonal(pos)
    end

    def to_s
        if color == :black
            "♗".colorize(:black)
        else 
            "♝".colorize(:white)
        end
    end

end