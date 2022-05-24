require_relative 'board.rb' 
require_relative 'human_player.rb'

class Game 
    attr_writer :cplayer
    def initialize(player_1_mark, player_2_mark)
        @player1 = HumanPlayer.new(player_1_mark)
        @player2 = HumanPlayer.new(player_2_mark)
        @board = Board.new
        @cplayer = @player1
    end

    def switch_turn
        if @cplayer == @player1
            @cplayer = @player2 
        else 
            @cplayer = @player1
        end
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