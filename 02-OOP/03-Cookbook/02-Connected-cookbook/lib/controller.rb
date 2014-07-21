require_relative 'cookbook'
require_relative 'ui'
require_relative 'recipe'

class Controller
  def initialize(cookbook)
    # Here you should instantiate the Cookbook model with the file
    @cookbook = cookbook
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

  def marmiton
    choice = @ui.search_from_marmiton
    if choice != ""
      @cookbook.add_recipie_from_marmiton("http://www.marmiton.org/recettes/recherche.aspx?aqt=#{choice}&sort=markdesc&st=5")

    end
  end
  # TODO: Implement the methods to retrieve, add, and delete recipes through the model
end
