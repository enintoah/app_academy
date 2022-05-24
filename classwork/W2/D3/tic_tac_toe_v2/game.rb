require_relative 'board.rb' 
require_relative 'human_player.rb'

class Game 
    attr_reader :cplayer
    attr_writer :cplayer, :players, :i 
    def initialize(n, *marks)
        @players = []
        marks.each do |mark|
            @players << HumanPlayer.new(mark)
        end 
        @board = Board.new(n)
        @cplayer = @players[0]
        @i = 0 
    end

    def switch_turn
        @i += 1 
        new_order = @players.rotate(@i)
        @cplayer = new_order[0]
    end

    def play
        while @board.empty_positions?
            @board.print 
            pos = @cplayer.get_position
            @board.place_mark(pos, @cplayer.mark)
            if @board.win?(@cplayer.mark)
                return puts "Player #{@cplayer.mark} wins!!!"
            else 
                self.switch_turn 
            end 
        end 
        puts "draw"
    end

end 