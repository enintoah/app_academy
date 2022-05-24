require_relative 'item.rb'

class List 

    attr_accessor :label
    def initialize(label)
        @label = label
        @items = []
    end 

    def add_item(title, deadline, description="")
        if !Item.valid_date?(deadline)
            return false 
        else 
            @items << Item.new(title, deadline, description)
            return true 
        end 
    end

    def size
        return @items.length 
    end 

    def valid_index?(index)
        max = @items.length - 1
        return false unless index <= max && index >= 0 
        return true  
    end

    def swap(index_1, index_2)
        return false if !self.valid_index?(index_1) || !self.valid_index?(index_2)
        @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
        return true 
    end 

    def [](index)
        return nil if !valid_index?(index)
        return @items[index]
    end 

    def priority
        return @items[0]
    end

    def print
        puts "-------------------------------------------"
        puts "              #{@label.upcase}"
        puts "-------------------------------------------"
        puts "Index |   Status   | Item         | Deadline"
        @items.each.with_index do |ele, idx|
            if ele.done[0] == false 
                puts "#{idx}     | Incomplete | #{ele.title}          | #{ele.deadline}"
            elsif ele.done[0] == true 
                puts "#{idx}     |  Completed | #{ele.title}          | #{ele.deadline}"
            end 
        end 
        puts "-------------------------------------------"
    end

    def print_full_item(index)
        if valid_index?(index)
            puts "-----------------"
            puts @items[index].title 
            puts @items[index].description 
            puts @items[index].deadline
            if @items[index].done[0] == false 
                puts "Incomplete"
            elsif @items[index].done[0] == true 
                puts "Completed"
            puts "-----------------"
            end 
        else 
            raise "index is not valid"
        end 
    end 

    def print_priority 
        if @items.length > 0 
            self.print_full_item(0)
        else 
            raise "no items in list"
        end
    end

    def up(index, amount=1)
        if !valid_index?(index) 
            return false 
        end 
        i = index 
        j = amount 
        while valid_index?(index) && j > 0 && i > 0 
            @items[i], @items[i - 1] = @items[i - 1], @items[i]
            i -= 1 
            j -= 1 
        end 
        return true 
    end

    def down(index, amount=1)
        if !valid_index?(index) 
            return false 
        end 
        i = index 
        j = 0 
        while valid_index?(index) && j < amount && i < @items.length
            @items[i], @items[i + 1] = @items[i + 1], @items[i]
            i += 1 
            j += 1 
        end 
        return true 
    end

    def sort_by_date!
        @items.sort_by! { |item| item.deadline }
    end 

    def toggle_item(index)
        @items[index].toggle 
    end

    def remove_item(index)
        @items[index] = ""
        @items.delete("")
    end

    def purge
        @items.each.with_index do |ele, idx|
            if ele.done[0] == true 
                @items[idx] = ""
            end
        end
        @items.delete("")
    end

end

