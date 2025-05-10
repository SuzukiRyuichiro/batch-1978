require_relative '../views/customers_view'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @customers_view = CustomersView.new
  end

  def add
    # ask the view for name
    name = @customers_view.ask_for_name
    # ask the view for address
    address = @customers_view.ask_for_address
    # make an instance of customer
    customer = Customer.new(name: name, address: address)
    # ask the repository to create (save)
    @customer_repository.create(customer)
  end

  def list
    # Get all the customers instances from repo
    customers = @customer_repository.all
    # Ask the view to display them
    @customers_view.display_list(customers)
  end
end
