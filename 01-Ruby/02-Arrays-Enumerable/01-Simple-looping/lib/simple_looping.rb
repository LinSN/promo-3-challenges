def sum_with_while(min,max)
  total = 0
  count = min
  # tant que le compteur est inferieur au max
    # j'ajoute le compteur au total
    # j'increment mon compteur de 1

  while count <= max
    total += count
    count += 1
  end

  total

end



def sum_with_for(min,max)
  range = (min..max).to_a
    for num in range
      min += range[num].to_i
    end
  return min
end


  #TODO: return the sum of the integers between min and max
  #CONSTRAINT: you should use a for..end structure

def sum_recursive(min,max)
  #TODO (optional): return the sum of the integers between min and max
  #CONSTRAINT: you should use a recursive algorithm, i.e. the method should call itself
  raise ArgumentError if min > max
  (min == max) ? min : min + sum_recursive(min + 1, max)
end

puts sum_with_while(1,4)
puts sum_with_for(1,4)
puts sum_recursive(1, 4)