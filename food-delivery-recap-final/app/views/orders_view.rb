class OrdersView
  def ask_for_index(stuff)
    puts "Pick a number for #{stuff}"
    gets.chomp.to_i - 1
  end
end
