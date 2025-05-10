class CustomersView
  def ask_for_name
    puts "What's the name of the customer?"
    gets.chomp
  end

  def ask_for_address
    puts "What's the address of the customer?"
    gets.chomp
  end

  def display_list(customers) # an array of customer insatnces
    customers.each_with_index do |customer, index|
      puts "#{index + 1} - #{customer.name}: 🏠#{customer.address}"
    end
  end
end
