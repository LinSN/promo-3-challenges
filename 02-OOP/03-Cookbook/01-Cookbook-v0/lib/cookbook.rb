require 'csv'

class Cookbook
  attr_reader :recipes

  def initialize(file)
    # TODO: Retrieve the data from your CSV file and store it in an instance variable
    @recipes = []
    @filepath    = file
  end

  def list_of_all_recipes
    @recipes = []
    CSV.foreach(@filepath) do |row|
      @recipes << row[0]
    end
    @recipes
  end

  def add_recipes(name)
    @recipes << name
    CSV.open(@filepath, 'w') do |csv|
      @recipes.each do |recipe|
        csv << [recipe]
      end
    end
  end

  def delete_recipes(name)
    @recipes.delete(name)
    CSV.open(@filepath, 'w', @csv_options) do |csv|
      @recipes.each do |recipe|
        csv << [recipe]
      end
    end
  end

  # TODO: Implement the methods to retrieve all recipes, create, or destroy recipes
  # TODO: Implement a save method that will write the data into the CSV
  # And don't forget to use this save method when you have to modify something in your recipes array.
end

cookbook = Cookbook.new
print cookbook.list_of_all_recipes
cookbook.add_recipes("Tarte aux pommes")
cookbook.add_recipes("cassolette")
print cookbook.list_of_all_recipes

cookbook.add_recipes("poule o pot")
print cookbook.list_of_all_recipes

cookbook.delete_recipes("poule o pot")
print cookbook.list_of_all_recipes
