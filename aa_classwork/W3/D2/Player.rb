class HumanPlayer
    attr_reader :name
    attr
    def initialize(name)
        @name = name 
        @points = 0
    end 

    def make_guess_part1
        puts "please enter a position"
        response = gets.chomp.split(' ').map(&:to_i)
        response
    end

    def make_guess_part2

    end

    def receive_revealed_card(pos, value)

    end

    def receive_match(pos1, pos2)

    end 

end