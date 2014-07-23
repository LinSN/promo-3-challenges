class UI

  def add_customer
    puts "Enter the id of the customer"
    id = gets.chomp
    puts "Enter the name of the customer"
    name = gets.chomp
    puts "Enter the address of the customer"
    address = gets.chomp
    [id, name, address]
  end

  def add_id_order
    puts "Enter the id of the order"
    id = gets.chomp
    id
  end

  def add_order_meal
    puts "What is the new meal"
    meal = gets.chomp
  end

  def display_meals(meals)
    puts "-----------Menu-------------"
    meals.each{|key,value| p "#{key} - $#{value}"}
  end

  def add_order_customer_delivery_guy
    puts "Enter the id of the customer"
    customer_id = gets.chomp
    puts "Enter the id of the delivery_guy"
    delivery_guy_id = gets.chomp
    [customer_id,delivery_guy_id]
  end

  def remove_order
    puts "Enter the id of the order you want to delete"
    meal = gets.chomp
  end

  def view_orders_put_customer
    puts "Put a customer id "
    choice = gets.chomp
  end

  def display_orders(orders,restaurant)
    orders = orders.values
    orders.each do |order|
      customer = restaurant.customers[order.customer_id]
      puts "Customer ID: #{customer.id} - Name: #{customer.name} - Adress: #{customer.address}"
      puts "Command ID: #{order.id} - Content: #{order.content} - Completed?: #{order.completed}"
    end
  end

  def display_people(all_people)
    all_people = all_people.values
    puts "---------------------------"
    all_people.each do |people|
      puts "#{people.id} - #{people.name} - #{people.class} "
    end
    puts "---------------------------"
  end

  def complete_order
    puts "Put the id of the order complete "
    choice = gets.chomp
  end


end