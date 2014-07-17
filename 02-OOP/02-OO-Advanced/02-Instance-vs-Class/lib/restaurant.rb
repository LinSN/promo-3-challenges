class Restaurant
  attr_reader :average_rating,:city,:name

  #TODO add relevant accessors if necessary

  def initialize(city, name)
    #TODO: implement constructor with relevant instance variables
    @city = city
    @name = name
    @type_of_food = ""
    @average_rating = 0.0
    @tab_mark = []
  end

  #TODO: implement #filter_by_city and #rate methods
  def rate(mark)
    @tab_mark << mark
    @average_rating = @tab_mark.inject(:+).to_f/@tab_mark.length
  end

  def self.filter_by_city(restaurants, city)
    list_resto = []
    restaurants.each do|restaurant|
      if restaurant.city == city
        list_resto << restaurant
      end
    end
    list_resto
  end

end
