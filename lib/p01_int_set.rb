class MaxIntSet
  def initialize(max)
    self.store = Array.new(max, false)
    self.size = max
  end

  def insert(num)
    validate!(num)
    store[num] = true
  end

  def remove(num)
    validate!(num)
    store[num] = false
  end

  def include?(num)
    store[num] == true
  end

  private
  attr_accessor :store, :size

  def is_valid?(num)
    num <= size && num >= 0
  end

  def validate!(num)
    raise 'Out of bounds' if !is_valid?(num)
  end
end


class IntSet
  attr_accessor :store 
  
  def initialize(num_buckets = 20)
    self.store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    return false if include?(num)
    self[num] << num 
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    self.store[num % num_buckets]
  end

  def num_buckets
    self.store.length
  end
end

class ResizingIntSet < IntSet
  attr_accessor :count, :store 

  def initialize(num_buckets = 20)
    self.store = Array.new(num_buckets) { Array.new }
    self.count = 0
  end

  def insert(num)
    if super(num)
      self.count += 1 
      resize! if self.count >= num_buckets
    end 
  end

  def remove(num)
    self.count -= 1 if super(num)
  end

  def include?(num)
    super(num)
  end

  private

  # def [](num)
  #   # optional but useful; return the bucket corresponding to `num`
  # end
  
  def num_buckets
    self.store.length
  end

  def resize!
    previous = self.store
    self.store = Array.new(previous.length * 2) { Array.new }
    self.count = 0 
    
    previous.each do |bucket|
      bucket.each do |num|
        insert(num)
      end 
    end 
    self
    
  end
end
