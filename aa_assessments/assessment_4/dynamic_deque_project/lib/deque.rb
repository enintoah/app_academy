class Deque
  def initialize
    @concealed_array = []
  end

  def size
    @concealed_array.length
  end 

  def blank?
    if @concealed_array.length == 0
      return true 
    else 
      return false
    end 
  end

  def front
    return @concealed_array[0]
  end

  def back
    return @concealed_array[-1]
  end

  def push_back(item)
    @concealed_array.push(item)
    return @concealed_array.length 
  end

  def push_front(item)
    @concealed_array.unshift(item)
    return @concealed_array.length 
  end

  def pop_back
    if @concealed_array.length == 0
      return nil
    else 
      return @concealed_array.pop
    end
  end

  def pop_front
    if @concealed_array.length == 0
      return nil 
    else 
      @concealed_array.shift
    end 
  end
end