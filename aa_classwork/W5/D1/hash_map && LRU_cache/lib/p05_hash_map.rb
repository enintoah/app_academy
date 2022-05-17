require_relative 'p04_linked_list'

class HashMap
  attr_accessor :count
  include Enumerable
  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
    @mod = num_buckets
  end

  def include?(key)
    hashed = key.hash
    idx = (hashed % @mod)
    @store[idx].include?(key)
  end

  def set(key, val)
    hashed = key.hash
    idx = (hashed % @mod)
    if !include?(key)
      @store[idx].append(key, val)
      @count += 1
      if check?
        resize!
      end
    else 
      @store[idx].update(key, val)
    end
  end

  def get(key)
    if include?(key)
      hashed = key.hash
      idx = (hashed % @mod)
      @store[idx].get(key)
    else 
      return nil 
    end
  end

  def delete(key)
    if include?(key)
      hashed = key.hash
      idx = (hashed % @mod)
      @store[idx].remove(key)
      @count -= 1
    end
  end

  def each
    @store.each do |ele|
      current = ele.head.next
      until current == ele.tail
        yield current.key, current.val 
        current = current.next
      end
    end
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def check?
    @count == @mod
  end 

  def num_buckets
    @store.length
  end

  def resize!
    @count = 0 
    @mod = @mod * 2
    arr = @store.dup 
    @store = Array.new(@mod) { LinkedList.new }
    arr.each do |list|
      list.each do |ele|
        key = ele.key
        val = ele.val
        set(key, val)
      end
    end
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end
end
