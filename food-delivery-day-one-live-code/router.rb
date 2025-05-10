# TODO: implement the router of your app.
class Router
  def initialize(meals_controller, customers_controller)
    @running = true
    @meals_controller = meals_controller
    @customers_controller = customers_controller
  end

  def run
    while @running
      # Display the possible actions user can take
      display_tasks
      # Get user's desired action
      action = gets.chomp.to_i
      puts `clear`
      # Run the cation
      route_action(action)
    end
  end

  private

  def route_action(action) # Expecting an integer
    # Based on which number action is
    # call different instance method of a controller
    case action
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 8 then stop
    else
      puts "Wrong input"
    end
  end

  def stop
    puts "Good bye!"
    @running = false
  end

  def display_tasks
    puts "-" * 20
    puts "        MENU    "
    puts "-" * 20

    puts "1 - Add a new meal"
    puts "2 - List all meals"
    puts "3 - Add a new customer"
    puts "4 - List all customers"
    puts "8 - Quit"
  end
end
