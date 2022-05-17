require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    value = @prc.call(key)
    if @map.include?(key)
      update_node!(key)
    else 
      if count == @max
        eject!
        calc!(key)
        @map.delete(key)
        @map.set(key, value)
      elsif count < @max
        calc!(key)
        @map.set(key, value)
      end
    end
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    value = @prc.call(key)
    @store.append(key, value)
  end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list
    value = @prc.call(key)
    @store.remove(key)
    @store.append(key, value)
  end

  def eject!
    next_node = @store.first.next
    @store.head.next = next_node
    next_node.prev = @store.head
  end
end
