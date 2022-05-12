class Stack 
    def initialize 
        @ivar = []
    end

    def push(el)
        @ivar.push(el)
    end

    def pop
        @ivar.pop
    end

    def peek 
        return @ivar[-1]
    end
end

class Queue
    def initialize
        @ivar = []
    end

    def enqueue(el)
        @ivar.unshift(el)
    end

    def dequeue
        @ivar.pop
    end

    def peek
        return @ivar[-1]
    end
end

class Map 
    def initialize
        @ivar = []
    end

    def set(key, value)
        @ivar.each do |subarr|
            if subarr[0] == key
                subarr[1] = value
            end 
        end
        @ivar << [key, value]
        @ivar.uniq
    end

    def get(key)
        @ivar.each do |subarr|
            if subarr[0] == key 
                return subarr[1]
            end
        end
    end

    def delete(key)
        @ivar.each.with_index do |subarr, idx|
            if subarr[0] == key 
                @ivar[idx] = []
            end
        end
        @ivar.delete([])
    end

    def show
        return @ivar
    end
end
