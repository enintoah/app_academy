require 'LRU_cache.rb'

describe LRUCache do 
  describe '#initialize' do 
    subject(:cache) { LRUCache.new(4) }
    it 'creates an instance variable called arr that is equal to an empty array' do
      expect(cache.arr).to be_a(Array)
      expect(cache.arr).to be_empty
    end

    it 'accepts a number that represents the size of the cache' do 
      expect(cache.size).to eq(4)
      expect(cache.size).to be_a(Integer)
    end
  end

  describe '#count' do 
  subject(:cache) { LRUCache.new(4) }
    it 'returns the current size of the array' do 
      expect(cache.count).to eq(0)
    end
  end

  describe '#add' do 
  subject(:cache) { LRUCache.new(4) }
    it 'adds elements to the array when it is empty' do 
      expect(cache.add(5)).to eq([5])
    end

    it 'pushes the element to the front if called and the array already contains it' do
      cache.add(5)
      cache.add("apple")
      cache.add("fire")
      cache.add(5)
      expect(cache.arr).to eq(["apple", "fire", 5])
    end

    it 'deletes the last element and adds the element if arr.length is equal to size' do
      cache.add(5)
      cache.add("apple")
      cache.add("fire")
      cache.add(56)
      cache.add(23)
      expect(cache.arr).to eq(["apple","fire", 56, 23])
    end
  end

  describe '#show' do 
  subject(:cache) { LRUCache.new(4) }
    it 'returns the arr when called' do 
      cache.add("apple")
      cache.add("fire")
      cache.add(56)
      cache.add(23)
      expect(cache.show).to eq(["apple","fire", 56, 23])
    end
  end
end