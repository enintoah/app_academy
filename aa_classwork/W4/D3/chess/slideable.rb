# require 'byebug'

module Slideable

    def horizontal(pos)
        i, j = pos 
        num = 1
        arr = []
        # up
        while num < 8
            ele = [i + num, j]
            case valid_moves?(ele)
            when -1
                arr << ele
            when 0
                arr << ele
                break
            when 1
                break
            end
            num += 1
        end

        # down
        num = 1
        while num < 8
            ele = [i - num, j]
            case valid_moves?(ele)
            when -1
                arr << ele
            when 0
                arr << ele
                break
            when 1
                break
            end
            num += 1
        end

        # right
        num = 1
        while num < 8
            ele = [i, j + num]
            case valid_moves?(ele)
            when -1
                arr << ele
            when 0
                arr << ele
                break
            when 1
                break
            end
            num += 1
        end

        # left
        num = 1
        while num < 8
            ele = [i, j - num]
            case valid_moves?(ele)
            when -1
                arr << ele
            when 0
                arr << ele
                break
            when 1
                break
            end
            num += 1
        end

        return arr
    end

    def diagonal(pos)
        i, j = pos 
        num = 1
        arr = []

        while num < 8
            ele = [i + num, j + num]
            case valid_moves?(ele)
            when -1
                arr << ele
            when 0
                arr << ele
                break
            when 1
                break
            end
            num += 1
        end

        # down
        num = 1
        while num < 8
            ele = [i - num, j - num]
            case valid_moves?(ele)
            when -1
                arr << ele
            when 0
                arr << ele
                break
            when 1
                break
            end
            num += 1
        end

        # right
        num = 1
        while num < 8
            ele = [i - num, j + num]
            case valid_moves?(ele)
            when -1
                arr << ele
            when 0
                arr << ele
                break
            when 1
                break
            end
            num += 1
        end

        # left
        num = 1
        while num < 8
            ele = [i + num, j - num]
            case valid_moves?(ele)
            when -1
                arr << ele
            when 0
                arr << ele
                break
            when 1
                break
            end
            num += 1
        end

        # while num < 8
        #     moves = [[i + num, j + num], [i - num, j - num], [i - num, j + num], [i + num, j - num]]
        #     arr.concat(moves.select { |ele| positions.include?(ele) } )
        #     num += 1
        # end
        return arr
    end

    def valid_moves?(pos)
        i, j = pos 
        positions = possible_pos
        if positions.include?(pos) 
            if board.[]([i, j]).is_a?(NullPiece)
                return -1
            elsif board.[]([i, j]).color != self.color
                return 0
            else #board.[]([i, j]).color == self.color
                return 1
            end
        end 
        return false 
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