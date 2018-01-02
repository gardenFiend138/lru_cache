class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    hashed_result = self.length.hash

    self.each_with_index do |el, idx|
      hashed_result += (el.hash + idx).hash
    end

    hashed_result.hash
  end
end

class String
  def hash
    hashed_result = self.length.hash
    chars = self.split('')

    chars.each_with_index do |el, idx|
      hashed_result += (el.to_i(36).hash + idx).hash
    end

    hashed_result.hash
  end
end

class Hash
  def hash
    hashed_result = self.length.hash
    self.keys.each { |key| hashed_result += self[key].hash + key.hash }
    hashed_result.hash
  end
end
