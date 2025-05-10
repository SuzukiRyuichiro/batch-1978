require_relative 'app/repositories/meal_repository'
require_relative 'app/repositories/customer_repository'
require_relative 'app/controllers/meals_controller'
require_relative 'app/controllers/customers_controller'
require_relative 'router'

# Get the repository ready
meals_csv_file_path = File.join(__dir__, 'data/meals.csv')
customers_csv_file_path = File.join(__dir__, 'data/customers.csv')

meal_repository = MealRepository.new(meals_csv_file_path)
customer_repository = CustomerRepository.new(customers_csv_file_path)

# Get the controller ready
meals_controller = MealsController.new(meal_repository)
customers_controller = CustomersController.new(customer_repository)

# Get the router ready
router = Router.new(meals_controller, customers_controller)

# run the app with router
router.run
