class MealsView
  def ask_for_name
    puts "What's the name of the meal?"
    gets.chomp
  end

  def ask_for_price
    puts "What's the price of the meal?"
    gets.chomp.to_i
  end

  def display_list(meals) # an array of meal insatnces
    meals.each_with_index do |meal, index|
      puts "#{index + 1} - #{meal.name}: $#{meal.price}"
    end
  end
end
