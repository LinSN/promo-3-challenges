class Customer
  attr_accessor :id, :name, :address, :orders

  def initialize(id, name, address)
    @id = id
    @name = name
    @address = address
    @orders = {}
  end


end