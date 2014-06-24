require 'hash_function'

class HashMap
  attr_accessor :backing_array, :factor

  def initialize(factor = 2)
    self.backing_array = Array.new(2)
    self.factor = factor
  end

  def get(key)
    backing_array[bucket(key)]
  end

  def set(key, obj)
    enlarge if needs_expanding?
    backing_array[bucket(key)] = obj
  end

  private

  def bucket(key)
    hash = HashFunction.hash(key)
    index = backing_array.index(hash)
    if index
      index + 1
    else
      backing_array[-2] = hash
      -1
    end
  end

  def needs_expanding?
    backing_array.compact.size > (backing_array.size / factor)
  end

  def enlarge
    next_backing_array = Array.new(backing_array.size * factor)
    0.upto(backing_array.size - 1) do |i|
      next_backing_array[i] = backing_array[i]
    end
    self.backing_array = next_backing_array
  end
end
