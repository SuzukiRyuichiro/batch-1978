class View
  def display_list(recipes) # array of Recipe insatnces
    # iterate over the recipes array, and display one by one
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1} - #{recipe.name} | #{recipe.description}"
    end
  end

  def ask_for_name
    # Prompt the user
    puts "What is the name of the recipe??"
    # Get user input
    gets.chomp
  end

  def ask_for_description
    # Prompt the user
    puts "What is the description of the recipe??"
    # Get user input
    gets.chomp
  end

  def ask_for_index
    puts "Which number?"
    gets.chomp.to_i - 1
  end
end
