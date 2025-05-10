require 'csv'
require_relative '../models/meal'

class MealRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @meals = []
    @next_id = 1
    load_csv if File.exist?(@csv_file_path)
  end

  def create(meal) # Expect meal to be instance of Meal
    # Assign the next ID to the incoming meal
    meal.id = @next_id
    # Push the meal instance into the meals array
    @meals << meal
    # Save them into CSV
    save_csv
    # Increment the next ID by 1
    @next_id += 1
  end

  def all
    @meals # Return all the meals
  end

  def find(id)
    # Iterate over the @meals array
    # and find the matching ID meal
    @meals.find { |meal| meal.id == id }
  end

  private

  def load_csv
    # Iterate over each row of CSV
    CSV.foreach(@csv_file_path, headers: true, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      # Make an instance of meal
      meal = Meal.new(row)
      # Put them into the @meals array
      @meals << meal
    end

    # Determine what the next ID of the repo should be
    @next_id = @meals.empty? ? 1 : @meals.last.id + 1
  end

  def save_csv
    # Open the file in write binary mode
    CSV.open(@csv_file_path, 'wb') do |csv|
      # insert the header
      csv << %w[id name price]
      # start iterating the @meals array
      @meals.each do |meal|
        # for each meal, we write the row in CSV
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end
end
