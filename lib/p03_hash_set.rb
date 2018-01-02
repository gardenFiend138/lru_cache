require_relative 'p02_hashing'
require_relative 'p01_int_set'

class HashSet < ResizingIntSet
  attr_reader :count, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    super(key)
  end

  def include?(key)
    super(key)
  end

  def remove(key)
    super(key)
  end

  private

  def [](num)
    super(num.hash)
  end

  def num_buckets
    self.store.length
  end

  def resize!
    super
  end
end
