require_relative "piece.rb"
require_relative "null_piece.rb"
require 'byebug'

class Knight < Piece

    attr_reader :board, :color, :pos

    def initialize(color, board, pos)
        super
    end

    def moves 
        arr = []
        i, j = @pos
        positions = possible_pos
        moves = [[i+1, j+2], [i+1,j-2], [i-1,j+2], [i-1,j-2], [i+2,j+1], [i+2,j-1], [i-2,j+1], [i-2,j-1]]
        arr.concat(moves.select { |ele| positions.include?(ele) } )
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

    def valid_move
        valid = []
        not_sure = []
        arr = self.moves
        arr.each do |ele|
            i, j = ele
            if board.grid[i][j] == NullPiece.instance
                valid << ele
            else 
                not_sure << ele
            end
        end
        
        not_sure.each do |ele|
            i, j = ele
            if board.grid[i][j].color != self.color
                valid << ele
            end
        end
        return valid
    end

end