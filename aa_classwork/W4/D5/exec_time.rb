def my_min(list)
    sorted = false 
    until sorted 
        sorted = true 
        (0...list.length - 1).each do |num|
            if list[num]> list[num + 1]
                list[num], list[num + 1] = list[num + 1], list[num]
                sorted = false 
            end
        end
    end
    list[0]
end

def my_min2(list)
    list.inject do |acc, el|
        if acc < el
            acc
        else 
            el
        end
    end
end

def largest_contiguous_subsum(list)
    combos = []
    list.each.with_index do |ele1, idx1|
        list.each.with_index do |ele2, idx2|
            combos << list[idx1..idx2]
        end
    end
    combos.delete([])
    answer = combos.map { |subarr| subarr.sum }
    answer.max
end

def largest_contiguous_subsum2(list)
    current = 0
    max = 0 
    list.each do |num|
        current += num 
        if current > max
            max = current
        end
        if current < 0 
            current = 0
        end
    end
    if max == 0 
        return list.max
    else 
        return max
    end
end

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum2(list)