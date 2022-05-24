require_relative "piece.rb"
require_relative "null_piece.rb"
require 'colorize'
require 'byebug'

class Pawn < Piece

    attr_reader :pos, :board, :color
    def initialize(color, board, pos)
        super
    end 

    def moves 
        i, j = pos
        if color == :white && i == 1
            arr_moves = [[i + 2, j], [i + 1, j]]
            if !(board.[](arr_moves[1]).is_a?(NullPiece))
                return []
            else 
                return arr_moves.select { |ele| valid_moves?(ele) == -1 }
            end
        elsif color == :white
            arr_moves = [[i + 1, j]]
            return arr_moves.select { |ele| valid_moves?(ele) == -1 }
        end

        if color == :black && i == 6
            arr_moves = [[i - 2, j], [i - 1, j]]
            if !board.[](arr_moves[1]).is_a?(NullPiece) 
                return []
            else 
                return arr_moves.select { |ele| valid_moves?(ele) == -1 }
            end 
        elsif color == :black 
            arr_moves = [[i - 1, j]]
            return arr_moves.select { |ele| valid_moves?(ele) == -1 }
        end
    end

    def valid_moves?(pos)
        i, j = pos 
        positions = possible_pos
        if positions.include?(pos) 
            if board.[]([i, j]).is_a?(NullPiece)
                return -1
            elsif board.[]([i, j]).color != self.color
                return 0
            else 
                return 1
            end
        end 
        return false 
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
        if color == :white
            "♟".colorize(:white)
        else
            "♙".colorize(:black)
        end
    end

end