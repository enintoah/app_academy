class Room

    attr_reader :capacity, :occupants

    def initialize(number)
        @capacity = number 
        @occupants = []
    end 

    def full?
        if @occupants.length < @capacity 
            return false 
        elsif @occupants.length == @capacity 
            return true 
        end 
    end 

    def available_space
        return @capacity - @occupants.length
    end

    def add_occupant(string)
        if !self.full?
            @occupants << string
            return true 
        else 
            return false 
        end 
    end

end