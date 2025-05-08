class View
  def display_list(recipes) # Expect an array of Recipe instances
    recipes.each_with_index do |recipe, index|
      puts "#{index+1} - #{recipe.name}: #{recipe.description}"
    end
  end

  def ask_for_name
    puts "What is the name of the recipe?"
    gets.chomp
  end

  def ask_for_description
    puts "What is the description of the recipe?"
    gets.chomp
  end

  def ask_for_index
    puts "Please pick a number"
    gets.chomp.to_i - 1
  end
end
