def pmu_format!(race_array)
  race_array.reverse!
  race_array.map! do |x|
    a = race_array.size - race_array.index(x)
    "#{a}-#{x}!"
  end


  #race_array.each {|x| puts size - race_array.index('x') + "#{x}!" }


  #TODO: modify the given array so that it is PMU-consistent
end

result= ["Jojo_la_praline", "Tete_de_croissant", "Face_de_pain_sucé"]
puts pmu_format!(result)
