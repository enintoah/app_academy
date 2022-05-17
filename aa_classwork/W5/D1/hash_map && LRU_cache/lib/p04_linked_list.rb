class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head 
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    if !empty?
      @head.next
    end
  end

  def last
    if !empty?
      @tail.prev
    end 
  end

  def empty?
    if @head.next == @tail 
      return true
    else 
      return false 
    end 
  end

  def get(key)
    self.each do |ele|
      if ele.key == key 
        return ele.val 
      end
    end 
  end

  def include?(key) 
    self.each do |ele|
      if ele.key == key 
        return true 
      end
    end
    return false 
  end

  def append(key, val)
    before = @tail.prev 
    new_node = Node.new(key, val)
    before.next = new_node
    @tail.prev = new_node 
    new_node.next = @tail 
    new_node.prev = before 
  end

  def update(key, val)
    self.each do |ele|
      if ele.key == key 
        ele.val = val 
      end
    end 
    return nil 
  end

  def remove(key)
    self.each do |ele|
      if ele.key == key 
        next_node = ele.next
        prev_node = ele.prev
        next_node.prev = prev_node
        prev_node.next = next_node
      end
    end 
  end

  def each
    current = @head.next
    until current == @tail 
      yield current 
      current = current.next
    end
  end

  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end

end
