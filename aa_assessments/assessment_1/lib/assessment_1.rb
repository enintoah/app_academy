def string_map!(string, &prc)
    string.each_char.with_index do |char, idx|
        string[idx] = prc.call(char)
    end
    string
end

def three?(arr, &prc)
    finarr = []
    arr.each do |ele|
        finarr << ele if prc.call(ele)
    end
    if finarr.count == 3
        return true 
    else 
        return false 
    end
end

def nand_select(arr, prc1, prc2)
    finarr = []
    arr.each do |ele|
        finarr << ele if prc1.call(ele) && !prc2.call(ele)
        finarr << ele if prc2.call(ele) && !prc1.call(ele)
        finarr << ele if !prc2.call(ele) && !prc1.call(ele)
    end 
    finarr 
end

def hash_of_array_sum(hash)
    sum = 0
    hash.each do |k, v|
        sum += v.flatten.sum
    end
    sum 
end


def abbreviate(sentence)
    arr = sentence.split(" ")
    finarr = []
    arr.each do |word|
        if word.length > 4
            finarr << remove_vowel(word)
        else 
            finarr << word 
        end
    end
    finarr.join(" ")
end

def remove_vowel(word)
    vowels = "aeiouAEIOU"
    str = ""
    word.each_char do |char|
        if !vowels.include?(char)
            str += char
        end
    end
    str 
end

def hash_selector(hash, *args)
    return hash if args.empty?
    finhash = {}
    hash.each do |k, v|
        if args.include?(k)
            finhash[k] = v
        end
    end
    finhash 
end

