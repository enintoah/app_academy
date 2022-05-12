require_relative "piece.rb"
require_relative "null_piece.rb"
require 'colorize'

class Knight < Piece

    attr_reader :board, :color, :pos
    def initialize(color, board, pos)
        super
    end

    def moves 
        arr = []
        i, j = @pos
        positions = possible_pos
        arr_moves = [[i+1, j+2], [i+1,j-2], [i-1,j+2], [i-1,j-2], [i+2,j+1], [i+2,j-1], [i-2,j+1], [i-2,j-1]]
        arr_moves.each do |ele|
            i, j = ele 
            if positions.include?(ele) && (board.[]([i, j]).is_a?(NullPiece) || board.[]([i, j]).color != self.color)
                arr << ele
            end
        end
        arr 
    end

    def possible_pos
        arr = []
        (0..7).each do |num1|
            (0..7).each do |num2|
                arr << [num1, num2]
            end
        end
        arr
    end

    def to_s
        if color == :black
            "♘".colorize(:black)
        else
            "♞".colorize(:white)
        end
    end

end