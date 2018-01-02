require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
    @count = 0
  end

  def count
    @map.count
  end

  def get(key)
    if @map[key]
      node = @store.get_node(key)
      update_node!(node)
    else
      calc!(key)
      @count += 1
      eject! if @count > @max
    end
    @map[key].val
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    node = @store.append(key, @prc.call(key))
    @map[key] = node
  end

  def update_node!(node)
    node.remove
    @store.append(node.key, node.val)
  end

  def eject!
    if @store.first
      @count -= 1
      node = @store.first.remove
      @map.delete(node.key)
    end
  end
end
