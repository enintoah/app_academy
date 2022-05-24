require_relative "room"

class Hotel

    attr_reader :rooms

    def initialize(name, hash)
        @name = name 
        @rooms = {}
        hash.each do |k, v|
            @rooms[k] = Room.new(v)
        end
    end 

    def name 
        newarr = []
        arr = @name.split(" ")
        arr.each do |ele|
            newarr << ele[0].upcase + ele[1..-1]  
        end 
        newarr.join(" ")
    end 

    def room_exists?(string)
        if rooms.has_key?(string)
            return true 
        else 
            return false 
        end 
    end

    def check_in(person, roomname)

        if !room_exists?(roomname)
           return p "sorry, room does not exist"
        end 

        if rooms[roomname].add_occupant(person)
            p "check in successful"
        else
            p "sorry, room is full"
        end 
    end

    def has_vacancy?
        rooms.each do |k, v|
            if rooms[k].available_space >= 1
                return true 
            end 
        end 
        return false   
    end 

    def list_rooms
        rooms.each do |k, v|
            puts k + " " + rooms[k].available_space.to_s 
        end 
    end 

end
