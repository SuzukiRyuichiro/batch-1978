require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(csv_file)
    @recipes = [] # where we store recipe instances
    @csv_file = csv_file
    # TODO: Load the csv file
    load_csv
  end

  def all
    # Return all the recipes in the cookbook
    @recipes
  end

  def create(recipe) # Expect an instance of Recipe as an argument
    # add the recipe to @recipes
    @recipes << recipe
    # TODO: save this new array of @recipes to csv
    save_to_csv
  end

  def destroy(recipe_index) # Expect an integer
    # remove the recipe from @recipes at the given index
    @recipes.delete_at(recipe_index)
    # TODO: save this new array of @recipes to csv
    save_to_csv
  end

  private

  def load_csv
    # First open the csv in the file location
    CSV.foreach(@csv_file) do |row|
      # Iterate over each row of the csv
      # On each iteration, we want to re-instantiate the Recipe with the given info on each row
      name = row[0]
      description = row[1]
      recipe = Recipe.new(name, description)
      # After re-instantiating, put them back into the @recipes array
      @recipes << recipe
    end
  end

  def save_to_csv
    # Open the csv file
    CSV.open(@csv_file, 'wb') do |csv|
      # Iterate over the @recipes array
      @recipes.each do |recipe|
        # On every iteration, put the name and description of the recipe into a row
        csv << [recipe.name, recipe.description]
      end
    end
  end
end
