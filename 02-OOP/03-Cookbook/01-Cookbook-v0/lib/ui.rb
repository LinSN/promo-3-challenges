class UI

  def add_recipe_with_asking
    puts "Add a recipie, please"
    answer = gets.chomp
    return answer
  end

  def remove_recipe_with_asking
    puts "Write the name of the recipie to delete it"
    answer = gets.chomp
    return answer
  end

  def display(tab)
    tab.each_with_index do |x,index|
      puts "#{index} - #{x}"
    end
  end

end
