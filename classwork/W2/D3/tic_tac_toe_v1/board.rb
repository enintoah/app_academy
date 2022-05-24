class Board

    attr_reader :grid 
    def initialize
        @grid = Array.new(3) { Array.new(3, "_") }
    end 

    def valid?(pos)
        pos.each do |num|
            if num > 3 || num < 0
                return false 
            else 
                return true 
            end 
        end 
    end 

    def empty?(pos)
        row, col = pos 
        if @grid[row][col] == "_"
            return true 
        else 
            return false 
        end 
    end 

    def place_mark(pos, mark)
        row, col = pos 
        if self.valid?(pos) && self.empty?(pos)
            @grid[row][col] = mark
        else 
            raise "this is not a valid move"
        end 
    end 

    def print
        @grid.each do |row|
            puts row.join(" ")
        end 
    end 

    def win_row?(mark)
        @grid.each do |row|
            if row.uniq.count == 1 && row[0] == mark 
                return true
            end
        end 
        return false 
    end

    def win_col?(mark)
        finarr = [] 
        i = 0
        while i <= 2
            finarr = []
            (0..2).each do |num2|
                finarr << @grid[num2][i]
            end 
            if finarr.uniq.count == 1 && finarr[0] == mark
                return true 
            end 
            i += 1 
        end 
        return false 
    end

    def win_diagonal?(mark)
        diag = []
        diag1 = []
        (0..2).each do |num|
            diag << @grid[num][num]
        end
        if diag.uniq.count == 1 && diag[0] == mark 
            return true 
        end 

        reverse = [2, 1, 0]
        (0..2).each do |num1|
            diag1 << @grid[reverse[num1]][num1]
        end 
        if diag1.uniq.count == 1 && diag1[0] == mark 
            return true 
        end 
        return false 
    end

    def win?(mark)
        if self.win_diagonal?(mark) || self.win_col?(mark) || self.win_row?(mark)
            return true 
        else 
            return false 
        end 
    end

    def empty_positions?
        @grid.each do |subarr|
            subarr.each do |ele|
                return true if ele == "_"
            end
        end
        return false 
    end 

end


