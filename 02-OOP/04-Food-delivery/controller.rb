require_relative 'restaurant'
require_relative 'manager'
require_relative 'delivery_guy'
require_relative 'ui'

class Controller

  attr_reader :restaurant

  def initialize
    @restaurant = Restaurant.new("Beef'n'git", "Paris", "0141521224")
    @manager = Manager.new("1", "André", "12345", @restaurant)
    @delivery_guy = DeliveryGuy.new("2","Mark","54321",@restaurant)
    @ui = UI.new
  end

  def list_customers
    @ui.display_people(@restaurant.customers)
  end

  def list_employees
    @ui.display_people(@restaurant.employees)
  end

  def add_customers
    id, name, address = @ui.add_customer
    @manager.create_customer(id, name, address)
  end

  def view_orders
    customer_id = @ui.view_orders_put_customer
    @ui.display_orders(@restaurant.customers[customer_id].orders,@restaurant)
  end

  def add_order

    id = @ui.add_id_order
    order = Order.new(id)

    meal = "aaaa"
    until meal == ""
      @ui.display_meals(@restaurant.meals)
      puts "------------------------------"
      meal = @ui.add_order_meal
      if @restaurant.meals.has_key?(meal)
        order.add_meal(meal)
        order.total_order(@restaurant)
      elsif meal ==""
        "You finish your order !"
      else
        "ce n'est pas au menu"
      end
    end
    puts "------Customers------"
    list_customers
    puts "------Employees------"
    list_employees
    tab = @ui.add_order_customer_delivery_guy

    order.customer_id = tab[0]
    order.delivery_guy_id  = tab[1]

    @delivery_guy.orders[order.id] = order
    current_customer = @restaurant.customers[tab[0]]
    current_customer.orders[order.id] = order


  end

  def remove_order
    order_id = @ui.remove_order

    current_order = @delivery_guy.orders[order_id]
    current_customer = @restaurant.customers[current_order.customer_id]
    current_customer.orders.delete(order_id)

    @delivery_guy.orders.delete(order_id)
  end

  def view_orders_delivery_guy(delivery_guy)
    @ui.display_orders(delivery_guy.orders,@restaurant)
  end

  def complete_order_by_delivery_guy
    order_id = @ui.complete_order
    @delivery_guy.complete_order(order_id)
  end



end