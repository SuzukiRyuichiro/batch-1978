class OrdersView
  def ask_index_for(stuff)
    puts "Pick a number for #{stuff}"
    gets.chomp.to_i - 1
  end

  def display(orders)
    orders.each_with_index do |order, index|
      puts "#{index + 1} - #{order.meal.name} to #{order.customer.name} delivered by #{order.employee.username}"
    end
  end
end
