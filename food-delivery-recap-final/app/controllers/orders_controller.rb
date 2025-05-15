require_relative '../views/meals_view'
require_relative '../views/orders_view'
require_relative '../views/customers_view'
require_relative '../views/employees_view'

class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository

    @meals_view = MealsView.new
    @orders_view = OrdersView.new
    @customers_view = CustomersView.new
    @employees_view = EmployeesView.new
  end

  def add
    ## Get the meal to deliver
    # Get all the meals from the repository
    meals = @meal_repository.all
    # List all the meals -> MealsView
    @meals_view.display(meals)
    # Ask the user to pick the menu (index)
    meal_index = @orders_view.ask_for_index("meal")
    # Get the meal instance to add to the order
    meal = meals[meal_index]

    ## Get the customer to deliver
    # Get all the customer from the repository
    customers = @customer_repository.all
    # List all the customers -> CustomerView
    @customers_view.display(customers)
    # Ask the user to pick the menu (index)
    customer_index = @orders_view.ask_for_index("customer")
    customer = customers[customer_index]

    ## Get the rider to deliver
    # Get all the riders from the repository
    riders = @employee_repository.all_riders
    # List all the riders -> EployeesView
    @employees_view.display(riders)
    # Ask the user to pick the rider (index)
    rider_index = @orders_view.ask_for_index("rider")
    rider = riders[rider_index]

    # Make the instance of the order
    order = Order.new(meal: meal, customer: customer, employee: rider)
    # Ask the repository to create (save)
    @order_repository.create(order)
  end
end
