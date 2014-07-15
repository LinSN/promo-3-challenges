def anagrams?(a_string, another_string)
  #TODO: implement the obvious method to test if two words are anagrams
  a_string.downcase.scan(/\w/).sort == another_string.downcase.scan(/\w/).sort
end

def anagrams_on_steroids?(a_string, another_string)
  #TODO: implement the improved method

  hash_a_string = Hash.new
  hash_another_string = Hash.new

  a_string.downcase.scan(/\w/).each do |letter|
    if hash_a_string.has_key?(letter)
      hash_a_string[letter] += 1
    else
      hash_a_string[letter] = 1
    end
  end

  another_string.downcase.scan(/\w/).each do |letter|
    if hash_another_string.has_key?(letter)
      hash_another_string[letter] += 1
    else
      hash_another_string[letter] = 1
    end
  end

  hash_a_string == hash_another_string
end
puts anagrams?("lola", "fume")
anagrams_on_steroids?("lola", "allo")