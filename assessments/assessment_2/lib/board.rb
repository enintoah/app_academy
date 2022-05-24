class Board

    attr_reader :size
    def initialize(size)
        @size = size 
        @grid = Array.new(size) { Array.new(size) }
    end

    def [](arr)
        return @grid[arr[0]][arr[1]]
    end

    def []=(arr, mark)
        @grid[arr[0]][arr[1]] = mark
    end

    def complete_row?(mark)
        @grid.each do |row|
            if row.length == @size && row.uniq.count == 1 && row[0] == mark
                return true 
            end
        end
        return false 
    end

    def complete_col?(mark)
        col = []
        i = 0
        while i < @size 
            @grid.each do |row|
                col << row[i]
            end
            if col.uniq.count == 1 && col[0] == mark 
                return true 
            end
            col = []
            i += 1
        end
        return false 
    end

    def complete_diag?(mark)
        left = []
        right = []
        (0...@size).each do |num|
            left << @grid[num][num]
        end
        if left.uniq.count == 1 && left[0] == mark 
            return true 
        end 

        numbers = [*0...@size]
        reversed = numbers.reverse 

        (0...@size).each do |num1|
            right << @grid[num1][reversed[num1]]
        end

        if right.uniq.count == 1 && right[0] == mark 
            return true
        end

        return false 

    end

    def winner?(mark)
        if complete_row?(mark) || complete_col?(mark) || complete_diag?(mark)
            return true 
        end
        return false  
    end 
    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @grid.each { |row| p row }
    end
end
