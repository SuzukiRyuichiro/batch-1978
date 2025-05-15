require 'csv'
require_relative '../models/order'
class OrderRepository
  def initialize(csv_file_path, meal_repository, customer_repository, employee_repository)
    @csv_file_path = csv_file_path
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @orders = []
    @next_id = 1
    load_csv if File.exist?(@csv_file_path)
  end

  def all
    @orders
  end

  def create(order)
    order.id = @next_id
    @orders << order
    @next_id += 1
    save_csv
  end

  def undelivered_orders
    # Filter out the orders that have delivered? => true
    @orders.reject { |order| order.delivered? }
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path, headers: true, header_converters: :symbol) do |row|
      # Each row is just an array of IDs (in string) + delivered boolean (also in string)
      # First, we have to find the INSTANCE of those using that reference
      meal = @meal_repository.find(row[:meal_id].to_i)
      customer = @customer_repository.find(row[:customer_id].to_i)
      employee = @employee_repository.find(row[:employee_id].to_i)

      # Convert string to boolean
      delivered = row[:delivered] == 'true'

      # Instantiate Order with the retrieved info
      order = Order.new(id: row[:id].to_i, meal: meal, customer: customer, employee: employee, delivered: delivered)

      # Put the instance in the array
      @orders << order
    end

    @next_id = @orders.empty? ? 1 : @orders.last.id + 1
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << %w[id delivered meal_id customer_id employee_id]
      @orders.each do |order|
        # We have to write ID of instances in to each row
        csv << [order.id, order.delivered?, order.meal.id, order.customer.id, order.employee.id]
      end
    end
  end
end
