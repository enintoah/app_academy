class ComputerPlayer
    @@name = "AI"
    attr_accessor :points
    def initialize
        @known_cards = Hash.new(0)
        @matched_cards = Hash.new(0)
        @points = 0
    end

    def make_guess_part1
        
    end

    def make_guess_part2

    end

    def receive_revealed_card(pos, value)
        @known_cards[value] = pos 
    end

    def receive_match(pos1, pos2)
        @matched_cards[pos1] = pos2
    end 

end
