class Board

    attr_reader :size, :grid
    
    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = (n * n)
        @row = n 
    end 

    def [](arr)
        return @grid[arr[0]][arr[1]]
    end

    def []=(pos, v)
        @grid[pos[0]][pos[1]] = v
    end

    def num_ships
        count = 0 
        @grid.each do |subarr|
            subarr.each do |ele|
                if ele == :S
                    count += 1
                end
            end
        end 
        count 
    end 

    def attack(pos)
        value = self[pos]
        if value == :S
            self[pos] = :H
            puts "you sunk my battleship!"
            return true 
        else 
            self[pos] = :X
            return false 
        end 
    end

    def place_random_ships
        count = @size / 4
        while self.num_ships < count 
            i = rand(0...@row)
            r = rand(0...@row)
            pos = [i, r]
            self[pos] = :S
        end 
    end

    def hidden_ships_grid
        new_grid = @grid.map {|arr| arr.dup }
        new_grid.each do |subarr|
            subarr.each.with_index do |ele, idx|
                if ele == :S 
                    subarr[idx] = :N 
                end
            end
        end
        return new_grid
    end

    def self.print_grid(arr)
        arr.each do |ele|
            puts ele.join(" ")
        end

    end 

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end 
end
