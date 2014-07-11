def poor_calories_counter(burger, side, beverage)
  sum=0
  product_calories = {
    "Cheese Burger"=> 290,
    "Big Mac"=> 300,
    "Mc Bacon"=> 400,
    "Royal Cheese"=> 130,
    "French fries"=> 130,
    "Potatoes"=> 130,
    "Coca"=> 160,
    "Sprite"=> 170
  }
  product_calories[burger] + product_calories[side] + product_calories[beverage]



  #TODO: return number of calories for this mcDonald order
end

def calories_counter(*orders)
  sum = 0
  product_calories = {
    "Cheese Burger"=> 290,
    "Big Mac"=> 300,
    "Mc Bacon"=> 400,
    "Royal Cheese"=> 130,
    "French fries"=> 130,
    "Potatoes"=> 130,
    "Coca"=> 160,
    "Sprite"=> 170,
    "Happy Meal" => 580,
    "Best Of Big Mac" => 590,
    "Best Of Royal Cheese" => 430

  }


  orders.each do|element|
    product_calories.each do|key,value|
      if element == key
        sum += value
      end
    end
  end
  sum
  #TODO: return number of calories for a less constrained order
end

puts poor_calories_counter("Big Mac", "Potatoes", "Sprite")
puts calories_counter("Mc Bacon", "Potatoes", "Sprite","Big Mac","Coca" )

