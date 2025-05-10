require_relative '../views/meals_view'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @meals_view = MealsView.new
  end

  def add
    # ask the view for name
    name = @meals_view.ask_for_name
    # ask the view for price
    price = @meals_view.ask_for_price
    # make an instance of meal
    meal = Meal.new(name: name, price: price)
    # ask the repository to create (save)
    @meal_repository.create(meal)
  end

  def list
    # Get all the meals instances from repo
    meals = @meal_repository.all
    # Ask the view to display them
    @meals_view.display_list(meals)
  end
end
