class Employee
  attr_accessor :id, :name, :password
  def initialize(id, name, password, restaurant)
    @id = id
    @name =  name
    @password = password
    @restaurant = restaurant
    @restaurant.employees[id] = self
  end

end