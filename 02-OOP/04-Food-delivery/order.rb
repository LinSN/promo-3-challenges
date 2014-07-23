class Order

attr_accessor :id, :date, :content, :customer_id, :delivery_guy_id , :completed
  def initialize(id)
    @id = id
    @date = Time.new

    @content = []
    @customer_id = 0
    @delivery_guy_id = 0

    @completed = false
  end

  def add_meal(meal)
    @content << meal
  end

  def total_order(restaurant)
    sum = 0
    content.each do |c|
      sum += restaurant.meals[c]
    end
    puts "Total of the order: $#{sum} \n"
  end

end