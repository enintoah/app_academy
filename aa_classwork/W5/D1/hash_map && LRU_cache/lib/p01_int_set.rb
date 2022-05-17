class MaxIntSet
  attr_reader :store
  def initialize(max)
    @max = max
    @min = 0
    @store = Array.new(max, false)
  end

  def insert(num)
    if !is_valid?(num) 
      raise "Out of bounds"
    else 
      @store[num] = true 
    end 
  end

  def remove(num)
    if @store[num] == true 
      @store[num] = false 
    end 
  end

  def include?(num)
    if @store[num] == false 
      return false 
    else 
      return true 
    end 
  end

  private

  def is_valid?(num)
    if num > @max || num < @min 
      return false 
    end
    return true 
  end

end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    if !include?(num)
      idx = (num % 20)
      @store[idx].push(num)
    end
  end

  def remove(num)
    if include?(num)
      idx = (num % 20)
      @store[idx].delete(num)
    end
  end

  def include?(num)
    idx = (num % 20)
    @store[idx].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    return @store[num]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    @mod = num_buckets
  end

  def insert(num)
    if !include?(num)
      idx = (num % @mod)
      @store[idx].push(num)
      @count += 1
      if check?
        resize!
      end
    end
  end

  def remove(num)
    if include?(num)
      idx = (num % @mod)
      @store[idx].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    idx = (num % @mod)
    @store[idx].include?(num)
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
