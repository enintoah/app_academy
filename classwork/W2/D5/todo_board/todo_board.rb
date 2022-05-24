require_relative 'item.rb'
require_relative 'list.rb'

class TodoBoard
    def initialize
        @list = {}
    end 

    def get_command
        print "\nEnter a command: "
        cmd, *args = gets.chomp.split(' ')

        case cmd
        when 'showall'
            @list.each do |k, v|
                v.print
            end 
        when 'ls'
            @list.each_key do |k|
                puts k 
            end 
        when 'mklist'
            @list[args[0]] = List.new(args[0])
        when 'mktodo'
            @list[args[0]].add_item(args[1], args[2], args[3])
        when 'up'
            if args.length == 2
                @list[args[0]].up(args[1].to_i)
            else 
                @list[args[0]].up(args[1].to_i, args[2].to_i)
            end 
        when 'down'
            if args.length == 2
                @list[args[0]].down(args[1].to_i)
            else 
                @list[args[0]].down(args[1].to_i, args[2].to_i)
            end
        when 'swap'
            @list[args[0]].swap(args[1].to_i, args[2].to_i)
        when 'sort'
            @list[args[0]].sort_by_date!
        when 'priority'
            @list[args[0]].print_priority
        when 'print'
            if args.length == 1
                @list[args[0]].print
            else 
                @list[args[0]].print_full_item(args[1].to_i)
            end 
        when 'toggle'
            @list[args[0]].toggle_item(args[1].to_i)
        when 'rm'
            @list[args[0]].remove_item(args[1].to_i)
        when 'purge'
            @list[args[0]].purge
        when 'quit'
            return false
        else
            print "Sorry, that command is not recognized."
        end

        true
    end 

    def run 
        boolean = self.get_command 
        if boolean == true 
            self.run
        elsif boolean == false 
            return 
        end 
    end 
end

new_board = TodoBoard.new
new_board.run