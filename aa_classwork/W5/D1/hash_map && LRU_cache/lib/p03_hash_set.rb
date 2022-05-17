class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    @mod = num_buckets
  end

  def insert(key)
    if !include?(key)
      hashed = key.hash
      idx = (hashed % @mod)
      @store[idx] << key
      @count += 1
      if check?
        resize!
      end
    end
  end

  def include?(key)
    hashed = key.hash
    idx = (hashed % @mod)
    @store[idx].include?(key)
  end

  def remove(key)
    if include?(key)
      hashed = key.hash
      idx = (hashed % @mod)
      @store[idx].delete(key)
      @count -= 1
    end 
  end

  private

  def check?
    @count == num_buckets
  end

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    @count = 0 
    @mod = @mod * 2
    arr = @store.dup 
    @store = Array.new(@mod) { Array.new }
    arr.each do |subarr|
      subarr.each do |ele|
        insert(ele)
      end
    end
  end
end
