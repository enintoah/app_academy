class Player
    def get_move
        puts "enter a position with coordinates separated with a space like `4 7`"
        response = gets.chomp
        arr = response.split
        finarr = []
        arr.each do |num|
            finarr << num.to_i
        end 
        finarr  
    end 
end
