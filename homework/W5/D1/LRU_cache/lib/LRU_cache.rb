class LRUCache

  attr_reader :size, :arr 
  def initialize(size)
    @size = size
    @arr = []
  end

  def count
    # returns number of elements currently in cache
    return @arr.length 
  end

  def add(el)
    # adds element to cache according to LRU principle
    if @arr.include?(el)
      @arr.delete(el) 
      @arr.push(el)
    elsif @arr.length == @size
      @arr.shift 
      @arr.push(el)
    else
      @arr.push(el)
    end 
  end

  def show
    # shows the items in the cache, with the LRU item first
    return @arr
  end

  private
  # helper methods go here!

end

