class Item
    def self.valid_date?(date_string)
        arr = date_string.split("-")
        year = arr[0].to_i
        month = arr[1].to_i
        day = arr[2].to_i
        years = [*1900..2022]
        months = [*1..12]
        days = [*1..31]
        return false unless years.include?(year)
        return false unless months.include?(month)
        return false unless days.include?(day)
        return true 
    end

    attr_accessor :title, :description
    attr_reader :done

    def initialize(title, deadline, description)
        @title = title 
        @description = description
        @done = [false, true]
        if !Item.valid_date?(deadline)
            raise "not valid date format"
        else        
            @deadline = deadline 
        end
    end

    def deadline 
        @deadline
    end 

    def deadline=(date)
        if !Item.valid_date?(date)
            raise "not valid date format"
        else        
            @deadline = date 
        end
    end 

    def toggle
        @done = @done.rotate
    end
end




