def remove_dups(arr)
    hash = Hash.new(0)
    res = []
    arr.each do |el|
        hash[el] += 1
    end
    hash.each do |k, v|
        res << k
    end
    res
end

def two_sum(arr)
    new_arr = []
    arr.each.with_index do |el1, idx1|
        arr.each.with_index do |el2, idx2|
            new_arr << [idx1, idx2] if idx2 > idx1 && (el1 + el2 == 0)
        end
    end
    new_arr         
end

def my_transpose(rows)
    res = []
    (0...rows.length).each do |num|
        sub = []
        rows.each do |row|
            sub << row[num]
        end
        res << sub
    end
    res
end

def stock_picker(stocks)
    hash = {}
    stocks.each.with_index do |el1, idx1|
        stocks.each.with_index do |el2, idx2|
            if idx1 < idx2
                hash[el2 - el1] = [idx1, idx2]
            end
        end
    end
    sorted = hash.sort
    return sorted[-1][1]
end

class Game
    attr_reader :size, :a, :b, :c, :answer
    def initialize(num)
        @size = num
        @answer = [*1..num]
        @a = [*1..num]
        @b = []
        @c = []
    end

    def move(el1, el2)
        el1 = @a if el1 == 1
        el1 = @b if el1 == 2
        el1 = @c if el1 == 3
        el2 = @a if el2 == 1
        el2 = @b if el2 == 2
        el2 = @c if el2 == 3
        if !el2.empty? && el2[0] < el1[0] 
            raise "not valid move"
        else 
            first = el1.shift
            el2.unshift(first)
        end
    end

    def won?
        return true if b == answer
        return true if c == answer
        return false 
    end
end