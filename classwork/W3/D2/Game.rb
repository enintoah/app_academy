require_relative 'Board.rb'
require_relative 'Card.rb'
require_relative 'Player.rb'
require_relative 'ComputerPlayer.rb'

class Game

    attr_reader :board
    def initialize(size, name)
        @board = Board.new(size)
        @previous = []
        @current = []
        @player_1 = HumanPlayer.new(name)
        @player_2 = ComputerPlayer.new
        @current_player = @player_1
    end

    def switch_players
        if @current_player = @player_1
            @current_player = @player_2
        else 
            @current_player = @player_1
        end
    end

    def play 
        @board.populate
        while !@board.won?
            system("clear")
            @board.render 
            self.set_previous
            self.set_current
            if @board.reveal_card(@previous) != @board.reveal_card(@current)
                @board.hide_card(@previous)
                @board.hide_card(@current)
            else 
                @current_player.receive_match(@previous, @current)
            end
        end
        puts "you win!!!"
    end

    def set_previous
        @previous = []
        @previous = @current_player.make_guess
        @board.reveal_card(@previous)
        @board.render  
        @current_player.receive_revealed_card(@previous, @board.reveal_card(@previous))
    end

    def set_current
        @current = []
        @current = @current_player.make_guess
        @board.reveal_card(@current)
        @board.render 
        @current_player.receive_revealed_card(@current, @board.reveal_card(@current))
        sleep(3)
    end
end

game = Game.new(4, "Joe")
game.play 