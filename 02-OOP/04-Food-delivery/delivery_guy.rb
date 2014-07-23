require_relative'employee'

class DeliveryGuy < Employee
  attr_accessor :orders

  def initialize(id, name, password, restaurant)
    super(id, name, password, restaurant)
    @orders = {}
  end

  def view_orders
    @orders.each do |order|
      if order.completed == false
        puts "#{order.id} - #{order.content}"
      end
    end
  end

  def complete_order(order_id)
    order = orders[order_id]
    order.completed = true
  end

end