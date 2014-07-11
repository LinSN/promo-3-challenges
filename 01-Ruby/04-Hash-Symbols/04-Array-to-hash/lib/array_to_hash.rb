def array_to_hash(array)
  #TODO: implement the method :)
  my_hash = Hash.new
  array.each_with_index do |value, index|
    if block_given?
      my_hash[yield(index)] = value
    else
      my_hash[index] = value
    end
  end
  my_hash
end

puts array_to_hash(["one","two","three"]){ |element| "key#{element}"}

puts array_to_hash(["one","two","three"])