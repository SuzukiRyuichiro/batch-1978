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
    meal_index = @orders_view.ask_index_for("meal")
    # Get the meal instance to add to the order
    meal = meals[meal_index]

    ## Get the customer to deliver
    # Get all the customer from the repository
    customers = @customer_repository.all
    # List all the customers -> CustomerView
    @customers_view.display(customers)
    # Ask the user to pick the menu (index)
    customer_index = @orders_view.ask_index_for("customer")
    customer = customers[customer_index]

    ## Get the rider to deliver
    # Get all the riders from the repository
    riders = @employee_repository.all_riders
    # List all the riders -> EployeesView
    @employees_view.display(riders)
    # Ask the user to pick the rider (index)
    rider_index = @orders_view.ask_index_for("rider")
    rider = riders[rider_index]

    # Make the instance of the order
    order = Order.new(meal: meal, customer: customer, employee: rider)
    # Ask the repository to create (save)
    @order_repository.create(order)
  end

  def list_undelivered_orders
    # Get all undelivered orders from repository
    undelivered_orders = @order_repository.undelivered_orders
    # Display them using view
    @orders_view.display(undelivered_orders)
  end

  def list_my_orders(current_user) # Expect an instance of employee
    # Ask the order repository for undelivered order for an employee
    orders = @order_repository.my_undelivered_orders(current_user)
    # display them
    @orders_view.display(orders)
  end

  def mark_as_delivered(current_user)
    # Ask the order repository for undelivered order for an employee
    orders = @order_repository.my_undelivered_orders(current_user)
    # display them
    @orders_view.display(orders)

    # Ask the user for index
    index = @orders_view.ask_index_for("order")
    order = orders[index]

    # Mark them and save
    @order_repository.mark_as_delivered(order)
  end
end
