require 'byebug'

def sluggish(arr)
    sorted = false 
    until sorted
        sorted = true 
        (0...arr.length - 1).each do |num|
            if arr[num].length > arr[num + 1].length
                arr[num], arr[num + 1] = arr[num + 1], arr[num]
                sorted = false 
            end
        end
    end
    arr[-1]
end

def dominant(arr)
    merge_sort(arr)
end

def merge_sort(arr)
    return arr if arr.length == 1 || arr.length == 0
    mid = arr.length/2
    left = arr[0...mid]
    right = arr[mid..-1]
    merge(dominant(left), dominant(right))
end

def merge(left, right)
    sorted = []
    until left.empty? || right.empty?
        if left[0].length > right[0].length
            sorted << right.shift
        else
            sorted << left.shift
        end
    end
    sorted + left + right
end


def clever(arr)
    arr.inject do |acc, el|
        if acc.length > el.length
            acc
        else 
            el
        end
    end
end

def slow_dance(direction, arr)
    arr.each.with_index do |ele, idx|
        return idx if ele == direction
    end
end

def fast_dance(direction, arr)
    arr.index(direction)
end

p dominant(['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 
'fiiiissshhhhhh'])

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", 
               "left",  "left-up" ]

p fast_dance("up", tiles_array)