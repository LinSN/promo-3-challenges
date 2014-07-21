class Recipe
attr_accessor :name, :description, :rate

  def initialize(name,description)
    @name =name
    @description = description
    @rate = 0
  end

end