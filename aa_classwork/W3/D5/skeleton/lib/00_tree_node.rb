class PolyTreeNode
    attr_reader :children, :parent, :value
    def initialize(value)
        @children = [] 
        @parent = nil 
        @value = value 
    end

    def parent=(parent_node)
        if parent #this node has a parent already
            @parent.children.delete(self)
        end
        @parent = parent_node
        if parent
            parent_node.children << self
        end
    end

    def add_child(child)
        child.parent = self
    end

    def remove_child(child)
        if !@children.include?(child)
            raise "error"
        end
        @children.delete(child)
        child.parent = nil
    end
    
    def dfs(target_value)
        return self if target_value == self.value 
        @children.each do |child|
            c = child.dfs(target_value)
            if c != nil 
                return c
            end 
        end
        nil 
    end
    
    def bfs(target_value)
        # return self if target_value == self.value
        a = Array.new
        a.push(self)
        while(!a.empty?)
            first_node = a.shift
            if first_node.value == target_value
                return first_node
            else
                a.concat(first_node.children)
            end
        end
        return nil
    end
end

par = PolyTreeNode.new("dad")
child = PolyTreeNode.new("child")

child.parent = par