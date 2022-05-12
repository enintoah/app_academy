require_relative 'passenger.rb'

class Flight 
    attr_reader :passengers
    def initialize(fnumber, capacity)
        @flight_number = fnumber
        @capacity = capacity 
        @passengers = []
    end

    def full?
        if @passengers.length == @capacity 
            return true 
        elsif @passengers.length < @capacity 
            return false 
        end 
    end 

    def board_passenger(passenger)
        if passenger.has_flight?(@flight_number) && !self.full?
            @passengers << passenger
        end 
    end

    def list_passengers
        arr = []
        @passengers.each do |passenger|
            arr << passenger.name
        end
        arr
    end

    def [](number)
        return @passengers[number]
    end

    def <<(name)
        self.board_passenger(name)
    end
end

