# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        return nil if self.empty?
        return 0 if self.length == 1 
        return self.max - self.min
    end 

    def average
        return nil if self.empty?
        self.sum / (self.length * 1.0)
    end 

    def median 
        return nil if self.empty?
        if self.length.odd?
            sorted = self.sort
            idx = (self.length - 1) / 2
            return sorted[idx]
        elsif self.length.even?
            sorted = self.sort 
            idx = (self.length) / 2.0
            sum = (sorted[idx] + sorted[idx - 1.0])
            return (sum / 2.0)
        end 
    end

    def counts 
        hash = Hash.new(0)
        self.each do |ele|
            hash[ele] += 1
        end 
        hash 
    end

    def my_count(value)
        count = 0 
        self.each do |ele|
            count += 1 if value == ele
        end 
        return count 
    end

    def my_index(value)
        return nil if !self.include?(value)
        self.each.with_index do |ele, idx|
            return idx if value == ele
        end 
    end

    def my_uniq
        finarr = []
        hash = Hash.new(0)
        self.each do |ele|
            hash[ele] += 1 
        end 
        hash.each_key { |k| finarr << k }
        finarr 
    end 

    def my_transpose 
        finarr = []
        length = self.length - 1 
        i = 0 
        while i <= length 
            temparr = []
            (0..length).each do |num|
                temparr << self[num][i]
            end 
            finarr << temparr 
            i += 1 
        end 
        finarr 
    end 
end
