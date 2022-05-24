class Board

    attr_reader :grid 
    def initialize(n)
        @grid = Array.new(n) { Array.new(n, "_") }
        @size = (n * n)
        @n = n 
    end 

    def valid?(pos)
        pos.each do |num|
            if num > @n || num < 0
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
        while i <= (@n - 1)
            finarr = []
            (0...@n).each do |num2|
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
        (0...@n).each do |num|
            diag << @grid[num][num]
        end
        if diag.uniq.count == 1 && diag[0] == mark 
            return true 
        end 

        arr = []
        (0...@n).each do |num|
            arr << num
        end 
        reverse = arr.reverse
        (0...@n).each do |num1|
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


