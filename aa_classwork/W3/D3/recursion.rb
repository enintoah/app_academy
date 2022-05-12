def range(start, finish)
    return [] if start == finish

    arr = range(start + 1, finish)
    [start].concat(arr)
end

def exp(b,n)
    return 1 if n == 0
    b * exp(b,n-1)
end

def exp2(b, n)
    return 1 if n == 0 
    return b if n == 1
    if n.even?
        exp2(b, n / 2) * exp2(b, n/2)
    else 
        b * (exp2(b, (n - 1) / 2) * exp2(b, (n-1) / 2))
    end
end


class Array
    def deep_dup
        new_arr = []
        self.each do |ele|
            if ele.is_a?(Array)
                new_arr << ele.deep_dup
            else 
                new_arr << ele
            end
        end
        return new_arr
    end
end

def rec_fib(n)
    return [] if n < 0
    return [0] if n == 0
    return [0, 1] if n == 1
    prev = rec_fib(n-1)
    prev << prev[-1] + prev[-2]
end

def iter_fib(n)
    return nil if n <= 0
    result = [0, 1] 
    return result if n == 1
    i = n - 1
    while i > 0
        result << result[-1] + result[-2]
        i -= 1
    end
    return result 
end

def bsearch(arr, target)
    mid = arr.length/2
    return mid if arr[mid] == target
    return nil if arr.length < 1
    left = arr[0...mid]
    right = arr[mid+1..-1]
    if target < arr[mid]
        return bsearch(left, target)
    else
        prev = bsearch(right, target)
        if prev == nil 
            return nil 
        else 
            return prev + left.length + 1
        end
    end
    
end

def quick_sort(arr)
    mid = arr.length/2
    return [] if arr.length == 0
    left = arr.select {|num| num < arr[mid] }
    right = arr.select {|num| num > arr[mid]}
    quick_sort(left) + [arr[mid]] + quick_sort(right)
end

def merge_sort(arr)
    return arr if arr.length == 1
    mid = arr.length / 2
    left = arr[0...mid]
    right = arr[mid..-1]
    merge(merge_sort(left), merge_sort(right))
end

def merge(left, right)
    sorted = []
    until left.empty? || right.empty?
        if left[0] < right[0]
            sorted << left.shift 
        else 
            sorted << right.shift 
        end 
    end
    sorted + left + right 
end

def subsets(arr)
    return [[]] if arr.length == 0
    last = arr.pop
    stack = subsets(arr)
    stack + stack.map { |sub| sub + [last] }
end