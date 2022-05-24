class Array 

    def my_each(&prc)
        i = 0
        while i < self.length 
            prc.call(self[i])
            i += 1 
        end 
        return self 
    end

    def my_select(&prc)
        array = []
        self.my_each do |ele|
            if prc.call(ele)
                array << ele
            end 
        end
        return array
    end

    def my_reject(&prc)
        array = []
        self.my_each do |ele|
            unless prc.call(ele)
                array << ele 
            end
        end
        return array
    end

    def my_any?(&prc)
        self.my_each do |ele|
            if prc.call(ele)
                return true
            end
        end
        return false
    end

    def my_all?(&prc)
        count = 0
        self.my_each do |ele|
            if prc.call(ele)
                count += 1
            end
        end
        if count == self.length
            return true
        else 
            return false
        end
    end

    def my_flatten
        array = []
        self.my_each do |ele|
            if ele.class == Array
                array += ele.my_flatten
            else 
                array << ele
            end
        end
        return array
    end

    def my_zip(*arr)
        finarr = []
        i = 0
        arr.unshift(self)
        while i < self.length 
            tarr = []
            arr.each do |subarr|
                tarr << subarr[i]
            end 
            finarr << tarr 
            i += 1    
        end
        return finarr 
    end
    
    def my_rotate(num=1)
        # arr = []
        # self.my_each do |ele|
        #     arr << ele
        # end 

        if num.positive?
            i = 0
            while i < num
                first = self.shift
                self << first
                i += 1
            end
        end
        # else 
        #     i = num
        #     while i < 0
        #         first = arr.pop 
        #         arr.unshift(first)
        #         i += 1
        #     end
        # end
        return self
    end

    def my_join(ele="")
        str = ""
        i = 0
        self.my_each do |char|
            str += char
            if self[i + 1] != nil
                str += ele
            end
            i += 1
        end
        str
    end

    def my_reverse
        arr = []
        i = self.length - 1
        while i >= 0
            arr << self[i]
            i -= 1
        end 
        arr 
    end
end

