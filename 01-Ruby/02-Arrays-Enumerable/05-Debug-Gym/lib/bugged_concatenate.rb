def bugged_concatenate(*array)
  ma_string = ""
  array.each{ |output|  ma_string.insert(ma_string.size,"#{output.to_s}")  }
  return ma_string.upcase
end

def build_1984_title
  bugged_concatenate(1, "9", 84, " ", "George Orwell")
end

puts bugged_concatenate(1, "9", 84, " ", "George Orwell")