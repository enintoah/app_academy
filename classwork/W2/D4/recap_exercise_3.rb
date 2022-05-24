def no_dupes?(arr)
    finarr = []
    hash = Hash.new(0)
    arr.each do |ele|
        hash[ele] += 1 
    end 
    hash.each do |k, v|
        finarr << k if v == 1
    end 
    finarr 
end

# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(arr)
    arr.each.with_index do |ele, idx|
        if idx < arr.length - 1 && ele == arr[idx + 1]
            return false 
        end 
    end 
    true 
end

# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
    hash = Hash.new { |hash, v| hash[v] = [] }
    str.each_char.with_index do |char, idx|
        hash[char] << idx
    end 
    hash 
end 

# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)
    hash = Hash.new(0)
    str.each_char do |char|
        hash[char] += 1 
    end 
    sorted = hash.sort_by {|k, v| v}
    last = sorted.to_a.last
    return last[0] * last[1]
end

# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'

def bi_prime?(num)
    arr = []
    (2...num).each do |nums|
        arr << nums if prime?(nums)
    end 

    arr.each.with_index do |ele1, idx1|
        arr.each.with_index do |ele2, idx2|
           if (ele1 * ele2) == num
                return true 
            end
        end
    end 
    return false 
end

def prime?(num)
    (2...num).each do |factors|
        if num % factors == 0 
            return false 
        end  
    end
    return true 
end

# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false

def vigenere_cipher(message, keys)
    alphas = "abcdefghijklmnopqrstuvwxyz"
    str = ""
    arr = keys
    message.each_char do |char|
        num = alphas.index(char) + arr[0]
        str += alphas[num % 26]
        arr = rotate(arr)
    end 
    str 
end 

def rotate(arr)
    return arr.rotate
end 

# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

def vowel_rotate(str)
    ogvowels = ""
    newstr = ""
    vowels = "aeiou"
    i = 0 
    str.each_char do |char|
        ogvowels += char if vowels.include?(char)
    end 
    p arr = ogvowels.split("").rotate(-1)
    str.each_char do |char|
        if vowels.include?(char)
            newstr += arr[i]
            i += 1 
        else 
            newstr += char 
        end 
    end 
    newstr 
end

# p vowel_rotate('computer')      # => "cempotur" 
# p "______"
# p vowel_rotate('oranges')       # => "erongas"
# p "______"
# p vowel_rotate('headphones')    # => "heedphanos"
# p "______"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p "______"
# p vowel_rotate('awesome')       # => "ewasemo"

class String 
    def select(&prc)
        str = ""
        prc ||= Proc.new{ |ch| false }
        self.each_char do |char|
            if prc.call(char)
                str += char 
            elsif char == "" 
                str += char 
            end 
        end 
        str 
    end 
    
    def map!(&prc)

        str = ""
        self.each_char.with_index do |char, idx|
            self[idx] = prc.call(char, idx) 
        end 
        self 
    end 

end

# p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
# p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
# p "HELLOworld".select          # => ""


# word_1 = "Lovelace"
# word_1.map! do |ch| 
#     if ch == 'e'
#         '3'
#     elsif ch == 'a'
#         '4'
#     else
#         ch
#     end
# end
# p word_1        # => "Lov3l4c3"

# word_2 = "Dijkstra"
# word_2.map! do |ch, i|
#     if i.even?
#         ch.upcase
#     else
#         ch.downcase
#     end
# end
# p word_2        # => "DiJkStRa"

#broken
def multiply(a, b)
    return 0 if b == 0 || a == 0

    if b < 0 && a < 0 
        -a + multiply(a, b + 1) 
    else 
        a + multiply(a, b - 1) 
    end

    # b + multiply(a - 1, b) if a > 0 && b < 0

    # -a + multiply(-a, -b + 1) if a <= 0 && b <= 0 

end

p multiply(3, 5)        # => 15
p multiply(5, 3)        # => 15
p multiply(2, 4)        # => 8
p multiply(0, 10)       # => 0
p multiply(-3, -6)      # => 18
p multiply(3, -6)       # => -18
p multiply(-3, 6)       # => -18
 
#broken
def lucas_sequence(num)
    return 2 if num == 1
    return finarr if num == 0 
    return 1 if num == 2

    finarr = []
    addnum = (lucas_sequence(num - 1) + lucas_sequence(num - 2))
    finarr.push(addnum) 
end
    

# p lucas_sequence(0)   # => []
# p lucas_sequence(1)   # => [2]    
# p lucas_sequence(2)   # => [2, 1]
# p lucas_sequence(3)   # => [2, 1, 3]
# p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]

#broken
def prime_factorization(num)
    return if num == 1

end