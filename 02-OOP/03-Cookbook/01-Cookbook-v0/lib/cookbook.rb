require 'csv'
require_relative 'recipe'

class Cookbook
  attr_reader :recipes

  def initialize(csv_file)
    # TODO: Retrieve the data from your CSV file and store it in an instance variable
    @recipes = []
    @filepath = csv_file
  end

  def list_of_all_recipes
    @recipes = []
    CSV.foreach(@filepath, col_sep: ',') do |row|
      @recipes << [row[0],row[1]]
    end
    @recipes
  end

  def add_recipe(recipe)
    @recipes << [recipe.name,recipe.description]
    CSV.open(@filepath, 'w', col_sep: ',') do |csv|
      @recipes.each do |rcp|
        csv << rcp
      end
    end
  end

  def remove_recipe(recipe_id)
    @recipes.delete_at(recipe_id.to_i)
    CSV.open(@filepath, 'w', col_sep: ',') do |csv|
      @recipes.each do |rcp|
        csv << rcp
      end
    end
  end

  # TODO: Implement the methods to retrieve all recipes, create, or destroy recipes
  # TODO: Implement a save method that will write the data into the CSV
  # And don't forget to use this save method when you have to modify something in your recipes array.
end


# cookbook = Cookbook.new('/Users/nordineslimani/code/LinSN/promo-3-challenges/02-OOP/03-Cookbook/01-Cookbook-v0/lib/recipes.csv')
# print cookbook.list_of_all_recipes
# tarte = Recipe.new("Tarte a la creme","description tarte")
# cookbook.add_recipe(tarte)
# print cookbook.list_of_all_recipes

# poule_o_pot = Recipe.new("poule o pot","description poule")
# cookbook.add_recipe(poule_o_pot)
# print cookbook.list_of_all_recipes

# cookbook.remove_recipe(1)
# print cookbook.list_of_all_recipes
