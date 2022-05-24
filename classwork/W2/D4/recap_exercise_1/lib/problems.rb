# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
def all_vowel_pairs(words)
    finarr = []
    words.each.with_index do |word1, idx1|
        words.each.with_index do |word2, idx2|
            if idx2 > idx1 && check_vowels(word1, word2)
                finarr << "#{word1} #{word2}"
            end 
        end
    end 
    finarr
end

def check_vowels(word1, word2)
    arr = [word1, word2]
    str = ""
    vowels = "aeiou"
    arr.each do |word|
        word.each_char do |char|
            if vowels.include?(char)
                str += char
            end 
        end
    end 
    if str.include?("a") && str.include?("e") && str.include?("i") && str.include?("o") && str.include?("u") 
        return true 
    else 
        return false 
    end 
end


# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
    (2...num).each do |nums|
        if num % nums == 0 
            return true 
        end 
    end 
    return false 
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    strarr = []
    str.each_char.with_index do |char, idx|
        strarr << "#{char}#{str[idx + 1]}"
    end 

    finarr = []
    bigrams.each do |bi|
        if strarr.include?(bi)
            finarr << bi 
        end
    end 
    finarr 
end


    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
class Hash

    def my_select(&prc)
        hash = {}
        prc ||= Proc.new { |k, v| k == v }
        self.each do |k, v|
            if prc.call(k, v)
                hash[k] = v
            end 
        end 
        return hash 
    end

end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
        subs = []
        rsubs = []
        i = 0 
        while i < self.length
            (0...self.length).each do |num|
                subs << self[i..num]
            end 
            i += 1 
        end 
        if length 
            subs.each do |ele|
                if ele.length == length 
                    rsubs << ele
                end 
            end 
            return rsubs 
        else 
            subs.delete("")
            return subs 
        end 
    end


    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"

    def caesar_cipher(num)
        arr = self.split("")
        newarr = []
        alphas = "abcdefghijklmnopqrstuvwxyz"
        arr.each do |char|
            idx = alphas.index(char) + num
            newarr << alphas[idx % 26]
        end 
        newarr.join("")
    end
end
