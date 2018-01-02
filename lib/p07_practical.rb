require_relative 'p05_hash_map'

def counter_hash(string)
  count = HashMap.new()

  string.split('').each do |letter|
    lowercase = letter.downcase

    count[lowercase] ? count[lowercase] += 1 : count[lowercase] = 1
  end

  count
end

def can_string_be_palindrome?(string)
  odd_count = 0

  counter_hash(string).each do |hash|
    if hash[1].odd?
      odd_count += 1
    end
  end

  odd_count < 2
end
