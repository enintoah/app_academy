def bad_two_sum?(arr, target)
    arr.each.with_index do |ele1, idx1|
        arr.each.with_index do |ele2, idx2|
            return true if (idx2 > idx1) && (ele1 + ele2 == target)
        end
    end
    false 
end

def okay_two_sum?(arr, target)
    arr.sort!
    i = 0
    j = arr.length - 1
    found = false 
    until found
        found = true 
        if i == j
            return false 
        elsif arr[i] + arr[j] == target 
            found = true 
            return true 
        elsif (arr[i] + arr[j]) > target 
            j -= 1
            found = false 
        elsif (arr[i] + arr[j]) < target
            i += 1
            found = false  
        end
    end
end

def two_sum?(arr, target)
    hash = Hash.new(0)
    arr.each do |ele|
        hash[ele] += 1
    end

    arr.each do |ele|
        y = target - ele
        if y == ele && hash[y] > 1
            return true 
        elsif hash[y] == 1 && y != ele
            return true 
        end
    end
    return false 
end
