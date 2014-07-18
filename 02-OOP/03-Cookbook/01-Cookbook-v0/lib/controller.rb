require_relative 'cookbook'
require_relative 'ui'
require_relative 'recipe'

class Controller
  def initialize(file)
    # Here you should instantiate the Cookbook model with the file
    @cookbook = Cookbook.new('/Users/nordineslimani/code/LinSN/promo-3-challenges/02-OOP/03-Cookbook/01-Cookbook-v0/lib/recipes.csv')
    @ui = UI.new
  end

  def list
    puts "---------------------------------"
    @ui.display(@cookbook.recipes)
    puts "---------------------------------"
  end

  def create
    choice = @ui.add_recipe_with_asking
    @cookbook.add_recipe(Recipe.new(choice[0],choice[1]))
  end

  def destroy
    choice = @ui.remove_recipe_with_asking
    @cookbook.remove_recipe(choice)
  end
  # TODO: Implement the methods to retrieve, add, and delete recipes through the model
end
