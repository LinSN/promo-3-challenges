class UI

  def add_recipe_with_asking
    puts "Add the name of the recipie, please"
    name = gets.chomp
    puts "Add the description of the recipie, please"
    description = gets.chomp
    return [name,description]
  end

  def remove_recipe_with_asking
    puts "Write the index of the recipie to delete it"
    answer = gets.chomp
    return answer
  end

  def display(tab)
    tab.each_with_index do |recipe, index|
      puts "#{index} - #{recipe.name} - #{recipe.description}"
    end
  end

end
