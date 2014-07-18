require_relative 'cookbook'
require_relative 'ui'

class Controller
  def initialize(file)
    # Here you should instantiate the Cookbook model with the file
    @cookbook = Cookbook.new('/Users/nordineslimani/code/LinSN/promo-3-challenges/02-OOP/03-Cookbook/01-Cookbook-v0/lib/recipes.csv')
    @ui = UI.new
  end

  def display_receip
    ui.display(cookbook.list_of_all_recipes)
  end

  # TODO: Implement the methods to retrieve, add, and delete recipes through the model
end
