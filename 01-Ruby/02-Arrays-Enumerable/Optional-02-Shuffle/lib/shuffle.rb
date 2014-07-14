def shuffle(array)
  #TODO: shuffle array manually
  array_solution = []
  array_bis = array.clone

  until array_bis.empty?
    tmp = array_bis[rand(array_bis.size)]
    array_solution << tmp
    array_bis.delete(tmp)
    print array
  end
  array_solution

end

def shuffle_plus(array)
  array.sort_by{|value,index| rand(index)}
end

puts shuffle_plus([1,2,3,4,5,6])