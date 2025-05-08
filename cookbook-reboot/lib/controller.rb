require_relative 'view'
require_relative 'recipe'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook # instance of Cookbook
    @view = View.new
  end

  def list
    # Ask the cookbook to give us all the recipes
    recipes = @cookbook.all
    # Ask the view to display them nicely
    @view.display_list(recipes)
  end

  def add
    # Ask the view to get name
    name = @view.ask_for_name
    # Ask the view to get the description
    description = @view.ask_for_description
    # Make an instance of Recipe with that info
    recipe = Recipe.new(name, description)
    # Ask the cookbook to save the recipe
    @cookbook.create(recipe)
  end

  def remove
    # Ask the cookbook to get all the recipes
    recipes = @cookbook.all
    # Ask the view to display the list of recipes
    @view.display_list(recipes)
    # Ask the view to get the desired index to remove
    index = @view.ask_for_index
    # Ask the cookbook to destroy the recipe at given index
    @cookbook.destroy(index)
  end
end
