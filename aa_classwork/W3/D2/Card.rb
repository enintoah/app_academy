class Card

    attr_reader :value, :revealed
    def initialize(value)
        @value = value
        @revealed = [false, true]
    end

    def info
        if @revealed[0] == true
            return @value
            return true
        else 
            return false
        end    
    end

    def hide
        if @revealed[0] == true 
            @revealed.rotate!
            return true 
        end 
        return false 
    end

    def reveal
        if @revealed[0] == false 
            @revealed.rotate!
            return true 
        end
        false 
    end

    def self.==(card_1, card_2)
        if card_1.value == card_2.value 
            return true 
        else 
            return false 
        end 
    end

    def to_s
        self.value
    end 

end

