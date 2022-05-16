class DynamicDeque < Deque
  def initialize(n)
    @concealed_array = []
    @max_volume = n
  end

  def max_volume
    return @max_volume
  end

  def middle 
    if @concealed_array.length == 0
      return []
    elsif @concealed_array.length.even?
      mid = @concealed_array.length / 2
      return [@concealed_array[mid-1], @concealed_array[mid]] 
    elsif @concealed_array.length.odd?
      mid = @concealed_array.length / 2
      return [@concealed_array[mid]]
    end
  end

  def push_back(*args)
    if args.length + @concealed_array.length > @max_volume
      raise 'deque is full'
    else 
      @concealed_array.concat(args)
      return @concealed_array.length 
    end
  end

  def pop_front(n = nil)
    arr = []
    if n == nil 
      return [@concealed_array.shift]
    else 
      n.times do 
        if @concealed_array[0] == nil 
          arr << nil
        else 
          arr << @concealed_array.shift
        end
      end
      arr
    end
  end
end