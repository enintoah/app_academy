class Array
  # Write a new `Array#merge_sort` method; it should not modify the
  # array it is called on, but create a new sorted array.
  # **Do NOT use the built-in `Array#sort` or `Array#sort_by` methods in your
  # implementation.**

  def merge_sort(&prc)
    prc ||= Proc.new { |left, right| left <=> right }
    return [] if self.length == 0
    return self if self.length == 1
    mid = self.length / 2
    left = self[0...mid]
    right = self[mid..-1]
    Array.merge(left.merge_sort(&prc), right.merge_sort(&prc), &prc)
  end

  private
  def self.merge(left, right, &prc)
    sorted = []
    until left.empty? || right.empty?
      if prc.call(left, right) == 1
        sorted << right.shift 
      else 
        sorted << left.shift 
      end
    end
    sorted + left + right 
  end
end


class Array
  # Write a new `Array#pair_sum(target)` method that finds all pairs of
  # positions where the elements at those positions sum to the target.

  # NB: ordering matters. I want each of the pairs to be sorted
  # smaller index before bigger index. I want the array of pairs to be
  # sorted "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def pair_sum(target)
    arr = []
    self.each.with_index do |ele1, idx1|
      self.each.with_index do |ele2, idx2|
        if (idx2 > idx1) && (ele1 + ele2 == target)
          arr << [idx1, idx2]
        end
      end
    end
    arr
  end
end


class Array
  # Write a method that flattens an array to the specified level. If no level
  # is specified, it should entirely flatten nested arrays.

  # **Do NOT use the built-in `Array#flatten` method in your implementation.**

  # Examples:
  # Without an argument:
  # [["a"], "b", ["c", "d", ["e"]]].my_flatten = ["a", "b", "c", "d", "e"]

  # When given 1 as an argument:
  # (Flattens the first level of nested arrays but no deeper)
  # [["a"], "b", ["c", "d", ["e"]]].my_flatten(1) = ["a", "b", "c", "d", ["e"]]
  
  def my_flatten(level = nil)
    # return self if !self.is_a? Array
    # return self if level == 0
    new_arr = []
    self.each do |ele|
      if level != 0 && ele.is_a?(Array)
        if level.nil?
          new_arr += ele.my_flatten 
        else 
          new_arr += ele.my_flatten(level - 1)
        end
      else 
        new_arr << ele 
      end
    end
    
    new_arr 
  end
end

class String
  # Write a `String#symmetric_substrings` method that returns all
  # substrings which are equal to their reverse image ("abba" ==
  # "abba"). We should only include substrings of length > 1.

  def symmetric_substrings
    i = 0 
    substrings = []
    sym = []
    while i < self.length 
      (i...self.length).each do |num|
        substrings << self[i..num]
      end 
      i += 1
    end 
    substrings.each do |string|
      if string == string.reverse && string.length > 1
        sym << string 
      end
    end 
    sym
  end
end


# Write a method `nth_prime` that returns the nth prime number. You may wish to
# use an `is_prime?` helper method.

def nth_prime(n)
  return nil if n == 0
  i = 2
  arr = []
  while arr.length < n
    if is_prime?(i) == true 
      arr << i 
      i += 1
    else
      i += 1
    end 
  end 
  return arr[-1]
end

def is_prime?(num)
  (2...num).each do |factor|
    if num % factor == 0 
      return false 
    end
  end
  return true 
end


class Array
  # Write an `Array#my_each` method that calls a passed block for each element
  # of the array. 
  # **Do NOT use the built-in `Array#each`, `Array#each_with_index` or 
  # `Array#map` methods in your implementation.**

  def my_each(&prc)
    i = 0 
    while i < self.length 
      prc.call(self[i])
      i += 1
    end
    self
  end
end

class Array
  # Write an `Array#my_select` method that returns an array made up of the
  # elements in the array that return `true` from the given block.
  # **Do NOT use the built-in `Array#select` or `Array#reject` methods in your
  # implementation.**

  def my_select(&prc)
    arr = []
    self.each do |ele|
      if prc.call(ele)
        arr << ele
      end
    end
    arr
  end
end

