require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(csv_file)
    @recipes = [] # We are going to store many different Recipe instances
    @csv_file = csv_file
    load_csv
  end

  def all
    # Return all the recipes in the cookbook
    return @recipes
  end

  def create(recipe) # Takes Recipe instance as an argument
    @recipes << recipe
    save_to_csv
  end

  def destroy(recipe_index) # Expect an integer as an argument
    @recipes.delete_at(recipe_index)
    save_to_csv
  end

  def load_csv
    # Open the csv in the file location, load the preexisting recipes
    CSV.foreach(@csv_file) do |row|
      # recreate the instance using the info in row
      name = row[0]
      description = row[1]
      @recipes << Recipe.new(name, description)
      # put them back in to @recipes
    end
  end

  def save_to_csv
    # Open the csv file
    CSV.open(@csv_file, 'wb') do |csv|
      # Iterate over the @recipes array
      @recipes.each do |recipe|
        # save name, description into each row of the CSV
        csv << [recipe.name, recipe.description]
      end
    end
  end
end
