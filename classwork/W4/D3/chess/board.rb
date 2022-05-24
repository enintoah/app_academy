require_relative "null_piece.rb"
require_relative "queen.rb"
require_relative "king.rb"
require_relative "knight.rb"
require_relative "bishop.rb"
require_relative "rook.rb"
require_relative "pawn.rb"
# require_relative "piece.rb"
require 'colorize'

class Board

    attr_reader :grid, :white_pieces, :black_pieces

    def initialize
        @grid = Array.new(8) { Array.new }
        @null = NullPiece.instance
        set_board
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def move_piece(start_pos, end_pos)
        start_row, start_col = start_pos
        end_row, end_col = end_pos
        positions = possible_pos
        if !positions.include?(start_pos) || !positions.include?(end_pos)
            raise "Not a valid position"
        end
        if @grid[start_row][start_col].class != NullPiece.instance && @grid[start_row][start_col].moves.include?(end_pos)
            @grid[end_row][end_col] = @grid[start_row][start_col]
            @grid[end_row][end_col].pos = end_pos
            @grid[start_row][start_col] = @null
        else 
            raise "There is no piece here or it is not a valid move"
        end
    end
    
    
    def set_board
        
        @grid[0][0] = Rook.new(:white, self, [0,0])
        @grid[0][1] = Knight.new(:white, self, [0,1])
        @grid[0][2] = Bishop.new(:white, self, [0,2])
        @grid[0][3] = Queen.new(:white, self, [0,3])
        @white_king = King.new(:white, self, [0,4])
        @grid[0][4] = @white_king
        @grid[0][5] = Bishop.new(:white, self, [0,5])
        @grid[0][6] = Knight.new(:white, self, [0,6])
        @grid[0][7] = Rook.new(:white, self, [0,7])
        
        @grid[1][0] = Pawn.new(:white, self, [1,0])
        @grid[1][1] = Pawn.new(:white, self, [1,1])
        @grid[1][2] = Pawn.new(:white, self, [1,2])
        @grid[1][3] = Pawn.new(:white, self, [1,3])
        @grid[1][4] = Pawn.new(:white, self, [1,4])
        @grid[1][5] = Pawn.new(:white, self, [1,5])
        @grid[1][6] = Pawn.new(:white, self, [1,6])
        @grid[1][7] = Pawn.new(:white, self, [1,7])
        @white_pieces = []
        (0..7).each do |i|
            @white_pieces << @grid[0][i]
            @white_pieces << @grid[1][i]
        end
            

        @grid[7][0] = Rook.new(:black, self, [7,0])
        @grid[7][1] = Knight.new(:black, self, [7,1])
        @grid[7][2] = Bishop.new(:black, self, [7,2])
        @grid[7][3] = Queen.new(:black, self, [7,3])
        @black_king = King.new(:black, self, [7,4])
        @grid[7][4] = @black_king
        @grid[7][5] = Bishop.new(:black, self, [7,5])
        @grid[7][6] = Knight.new(:black, self, [7,6])
        @grid[7][7] = Rook.new(:black, self, [7,7])

        @grid[6][0] = Pawn.new(:black, self, [6,0])
        @grid[6][1] = Pawn.new(:black, self, [6,1])
        @grid[6][2] = Pawn.new(:black, self, [6,2])
        @grid[6][3] = Pawn.new(:black, self, [6,3])
        @grid[6][4] = Pawn.new(:black, self, [6,4])
        @grid[6][5] = Pawn.new(:black, self, [6,5])
        @grid[6][6] = Pawn.new(:black, self, [6,6])
        @grid[6][7] = Pawn.new(:black, self, [6,7])

        @black_pieces = []
        (0..7).each do |i|
            @black_pieces << @grid[6][i]
            @black_pieces << @grid[7][i]
        end
        
        
        i = 2
        while i < 6
            (0..7).each do |num|
                @grid[i][num] = @null
            end
            i += 1
        end 
    end

    def print 
        arr = Array.new(8) { Array.new }
        (0..7).each do |num1|
            (0..7).each do |num2|
                arr[num1][num2] = @grid[num1][num2].to_s if @grid[num1][num2].class != NullPiece
                # arr[num1][num2] = "-" if @grid[num1][num2].class == NullPiece
            end
        end

        arr.each do |subarr|
            puts subarr.join(" ")
        end
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

    def in_check?(color)
        arr = []
        if @black_king.color == color
            @white_pieces.each do |piece|
                arr.concat(piece.moves)
            end
            if arr.uniq.include?(@black_king.pos)
                return true 
            end
        else
            @black_pieces.each do |piece|
                arr.concat(piece.moves)
            end
            if arr.uniq.include?(@white_king.pos)
                return true 
            end
        end
        return false 
    end

    def checkmate?(color)
        king = ""
        if @black_king.color == color 
            king = @black_king
        else 
            king = @white_king
        end 

        
        if !in_check?(king.color)
            return false 
        end
        
        pieces_alive = [] # all pieces of same color alive
        @grid.each do |subarr|
            subarr.each do |ele|
                pieces_alive << ele if ele.color == king.color 
            end
        end 
 
        all_moves = [] # all possible moves of teammates
        pieces_alive.each do |piece|
            all_moves = [] 
            all_moves.concat(piece.moves)
            all_moves.each do |move|
                og_pos = piece.pos
                self.move_piece(piece.pos, move)
                return false if !in_check?(king.color)
                self.move_piece(move, og_pos)
            end
        end
        return true 
    end

    # def deep_dup 
    #     new_arr = []
    #     grid.each do |ele|
    #         if ele.is_a?(Array)
    #             new_arr << ele.deep_dup
    #         else 
    #             new_arr << ele
    #         end
    #     end
    #     return new_arr
    # end

end