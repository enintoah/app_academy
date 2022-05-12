class HumanPlayer

    attr_reader :mark
    def initialize(mark_value)
        @mark = mark_value
    end 

    def get_position(legal_positions)
        numbers = legal_positions
        puts "Player #{@mark}, enter two numbers with a space between them for your position i.e '1 2'"
        response = gets.chomp.split
        fin = response.map(&:to_i)
        if !numbers.include?(fin)
            raise "#{fin} is not valid position"
        end
        fin 
    end
end 