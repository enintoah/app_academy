class HumanPlayer

    attr_reader :mark
    def initialize(mark_value)
        @mark = mark_value
    end 

    def get_position
        numbers = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        puts "Player #{@mark}, enter two numbers with a space between them for your position i.e '1 2'"
        response = gets.chomp.split
        if response.length != 2 || !numbers.include?(response[0]) || !numbers.include?(response[1]) || response.include?(" ")
            raise "not correct format"
        end
        fin = response.map(&:to_i)
    end
end 