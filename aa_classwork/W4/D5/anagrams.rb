def first_anagram?(word1, word2)
    arr1 = word1.split("")
    perms = arr1.permutation.to_a
    perms.each do |perm|
        if perm.join("") == word2
            return true 
        end
    end
    return false 
end

def second_anagram?(word1, word2)
    arr = word2.split("")
    word1.each_char do |char|
        if arr.include?(char)
            idx = arr.index(char)
            arr.delete_at(idx)
        else 
            return false 
        end
    end
    if arr.empty?
        return true 
    end 
end

def third_anagram?(word1, word2)
    arr1 = word1.split("")
    arr2 = word2.split("")
    sorted1 = bubble_sort(arr1)
    sorted2 = bubble_sort(arr2)
    sorted1 == sorted2
end

def bubble_sort(arr)
    sorted = false
    alpha = "abcdefghjiklmnopqrstuvwxyz" 
    until sorted 
        sorted = true 
        (0...arr.length-1).each do |num|
            if alpha.index(arr[num]) > alpha.index(arr[num + 1])
                arr[num], arr[num + 1] = arr[num + 1], arr[num]
                sorted = false 
            end
        end
    end
    arr 
end

def fourth_anagram?(word1, word2)
    hash1 = Hash.new(0)
    hash2 = Hash.new(0)
    word1.each_char do |char|
        hash1[char] += 1
    end

    word2.each_char do |char|
        hash2[char] += 1
    end

    hash1 == hash2 
end


p fourth_anagram?("elvis", "lives")
p fourth_anagram?("gizmo", "sally")