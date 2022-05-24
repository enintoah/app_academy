# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    multi = []
    multi1 = []
    (1..num_2).each do |num|
        multi << (num_1 * num)
    end 

    (1..num_1).each do |num1|
        multi1 << (num_2 * num1)
    end 
    arr = multi1 & multi
    sorted = arr.sort
    return sorted[0]
end




# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    hash = Hash.new(0)
    str.each_char.with_index do |char, idx|
        hash["#{char}#{str[idx+1]}"] += 1 
    end 

    finhash = hash.max_by {|k, v| v}
    return finhash[0]

end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        hash = {}
        self.each do |k, v|
            hash[v] = k 
        end 
        return hash 
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        count = 0
        self.each.with_index do |ele1, idx1|
            self.each.with_index do |ele2, idx2|
                if idx2 > idx1 && (ele1 + ele2) == num
                    count += 1 
                end 
            end 
        end 
        count 
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)

        prc ||= Proc.new { |a, b| a <=> b }
        sorted = false 

        while sorted == false 
            sorted = true 
            self.each.with_index do |ele, idx|
                if idx < (self.length - 1) && (prc.call(ele, self[idx + 1])) == 1
                    self[idx], self[idx + 1] = self[idx + 1], self[idx]
                    sorted = false  
                end 
            end 
        end 

        return self 

    end
end

p [4, 12, 2, 8, 1, 14, 9, 25, 24, 81].bubble_sort
p [4, 12, 2, 8, 1, 14, 9, 25, 24, 81].bubble_sort { |a, b| a.to_s <=> b.to_s } 