def sum_to(n)
    return nil if n <= 0
    return 1 if n == 1 
    n + sum_to(n - 1)
end

def add_numbers(nums_array)
    return nil if nums_array.empty?
    return nums_array[0] if nums_array.length == 1
    nums_array.first + add_numbers(nums_array[1..-1])
end

def gamma_fnc(n)
    return nil if n <= 0
    return 1 if n == 1
    (n - 1) * gamma_fnc(n - 1) 
end

def ice_cream_shop(flavors, favorite)
    return false if flavors.empty?
    if flavors.shift == favorite 
        return true 
    else 
        ice_cream_shop(flavors, favorite)
    end
end

def reverse(string)
    return "" if string.empty?
    string[-1] + reverse(string[0..-2])
end
