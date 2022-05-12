require 'Set'

class GraphNode
    attr_accessor :neighbors, :value
    def initialize(value)
        @value = value 
        @neighbors = []
    end

    def neighbors=(arr)
        @neighbors += arr
    end

    def self.bfs(starting_node, target_value)
        searched = Set.new
        arr = []
        arr << starting_node 
        while !arr.empty?
            first_node = arr.shift
            if first_node.value == target_value && !searched.include?(first_node)
                return first_node 
            else
                searched.add(first_node)
                first_node.neighbors.each do |ele|
                    unless searched.include?(ele)
                        arr << ele
                    end
                end
            end 
        end
        return nil 
    end

end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

p GraphNode.bfs(a, 'f')
