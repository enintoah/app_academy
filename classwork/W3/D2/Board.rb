require_relative 'card.rb'

class Board
    CONSTANT_CARDS =  ("A".."R").to_a

    attr_reader :grid, :size 
    
    def initialize(size)
        if size == 4 || size == 6
            @grid = Array.new(size) { Array.new }
            @size = (size * size)
            @num = size
        else 
            raise "size must be 4 or 6"
        end 
    end

    def populate
        if @num == 4
            newarr = []
            CONSTANT_CARDS.each do |ele|
                if newarr.length < 8
                    newarr << ele
                end
            end 
            i = 0
            doubled = doubler(newarr)
            randomized = doubled.shuffle
            while i < @num
                while @grid[i].length < @num
                    @grid[i] << Card.new(randomized[0])
                    randomized.shift
                end
                i += 1
            end
        end 

        finarr = []
        CONSTANT_CARDS.each do |ele|
            finarr << ele
        end
        i = 0
        doubled = doubler(finarr)
        randomized = doubled.shuffle
        while i < @num
            while @grid[i].length < @num
                @grid[i] << Card.new(randomized[0])
                randomized.shift
            end
            i += 1
        end
    end

    def doubler(arr)
        newarr = arr.dup 
        finarr = newarr += newarr 
        return finarr  
    end

    def cheat 
        @grid.each do |subarr|
            arr = []
            subarr.each do |value|
                arr << value.value
            end
            p arr.join(" ")
        end 
    end

    def render
        @grid.each do |subarr|
            arr = []
            subarr.each do |value|
                if value.info == false 
                    arr << "_"
                else 
                    arr << value.value
                end
            end
            p arr.join(" ")
        end 
    end

    def won?
        @grid.each do |subarr|
            subarr.all? { |ele| ele.revealed[0] == true }
        end
        return false 
    end

    def reveal_card(pos)
        row, col = pos
        @grid[row][col].reveal
        return @grid[row][col].value
    end 

    def hide_card(pos)
        row,col = pos 
        @grid[row][col].hide
    end

    def playable_positions
        newarr = []
        i = 0
        while i < @num
            (0...@num).each do |num|
                if @grid[i][num].revealed[0] == false
                    newarr << [i, num]
                end
            end
            i += 1
        end
        newarr
    end

end