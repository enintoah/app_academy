require_relative 'board.rb'
require 'colorize'
require_relative 'cursor.rb'

class  Display

    attr_reader :board
    
    def initialize
        @board = Board.new
        @cursor = Cursor.new([0,0], board)
    end

    def render
        arr = Array.new(8) {Array.new}
        until @cursor.selected == true
            (0..7).each do |num1|
                (0..7).each do |num2|
                    arr[num1][num2] = " " + @board.grid[num1][num2].to_s + " "
                    if num1.even?
                        if num2.even?
                            arr[num1][num2] = arr[num1][num2].colorize(:background => :light_blue)
                        else 
                            arr[num1][num2] = arr[num1][num2].colorize(:background => :light_green)
                        end
                    else 
                        if num2.even?
                            arr[num1][num2] = arr[num1][num2].colorize(:background => :light_green)
                        else 
                            arr[num1][num2] = arr[num1][num2].colorize(:background => :light_blue)
                        end
                        i, j = @cursor.cursor_pos
                        arr[i][j] = arr[i][j].colorize(:background => :magenta)
                    end
                end
            end
    

            arr.each do |subarr|
                puts subarr.join("")
            end
        @cursor.get_input
        system("clear")
        end
        @cursor.selected = false 
    end

end

