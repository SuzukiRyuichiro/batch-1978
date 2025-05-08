require_relative 'view'
require_relative 'recipe'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook # instance of Cookbook
    @view = View.new
  end

  def list
    # ask cookbook to get all the recipes
    recipes = @cookbook.all
    # tell view to display it nicely
    @view.display_list(recipes)
  end

  def add
    # Ask the user for name of the recipe (View)
    name = @view.ask_for_name
    # Ask the user for description of the recipe (View)
    description = @view.ask_for_description
    # Tell the model to make an instance
    recipe = Recipe.new(name, description)
    # Tell cookbook to store (create) the instantiated Recipe.
    @cookbook.create(recipe)
  end

  def remove
    # 1. Display recipes
    recipes = @cookbook.all
    @view.display_list(recipes)
    # 2. Ask user for index (view)
    index = @view.ask_for_index
    # 3. Remove from cookbook (repo)
    @cookbook.destroy(index)
  end
end
