module Stepable
    def step(pos)
        i, j = pos 
        num = 1
        arr = []
        positions = possible_pos
        arr_moves = [
            [i + num, j + num], [i - num, j - num], [i - num, j + num], [i + num, j - num], 
            [i + num, j], [i - num, j], [i, j + num], [i, j - num]
                ]
        arr_moves.each do |ele|
            i, j = ele 
            if positions.include?(ele) && (board.[]([i, j]).is_a?(NullPiece) || board.[]([i, j]).color != self.color)
                arr << ele
            end
        end
    return arr
    end

    def possible_pos
        arr = []
        (0..7).each do |num1|
            (0..7).each do |num2|
                arr << [num1, num2]
            end
        end
        arr
    end

end