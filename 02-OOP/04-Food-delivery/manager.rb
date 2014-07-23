require_relative'employee'
require_relative 'customer'
require_relative'order'


class Manager < Employee

  def create_customer(id, name, address)
    new_customer = Customer.new(id, name, address)
    @restaurant.customers[new_customer.id] = new_customer
  end


end
