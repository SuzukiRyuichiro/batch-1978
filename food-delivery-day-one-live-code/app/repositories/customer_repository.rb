require 'csv'
require_relative '../models/customer'

class CustomerRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @customers = []
    @next_id = 1
    load_csv if File.exist?(@csv_file_path)
  end

  def create(customer) # Expect customer to be instance of customer
    # Assign the next ID to the incoming customer
    customer.id = @next_id
    # Push the customer instance into the customers array
    @customers << customer
    # Save them into CSV
    save_csv
    # Increment the next ID by 1
    @next_id += 1
  end

  def all
    @customers # Return all the customers
  end

  def find(id)
    # Iterate over the @customers array
    # and find the matching ID customer
    @customers.find { |customer| customer.id == id }
  end

  private

  def load_csv
    # Iterate over each row of CSV
    CSV.foreach(@csv_file_path, headers: true, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      # Make an instance of customer
      customer = Customer.new(row)
      # Put them into the @customers array
      @customers << customer
    end

    # Determine what the next ID of the repo should be
    @next_id = @customers.empty? ? 1 : @customers.last.id + 1
  end

  def save_csv
    # Open the file in write binary mode
    CSV.open(@csv_file_path, 'wb') do |csv|
      # insert the header
      csv << %w[id name address]
      # start iterating the @customers array
      @customers.each do |customer|
        # for each customer, we write the row in CSV
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end
end
