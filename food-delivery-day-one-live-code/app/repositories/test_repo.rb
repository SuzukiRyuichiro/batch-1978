require_relative 'meal_repository'

csv_file_path = File.join(__dir__, '../../data/meals.csv')

mr = MealRepository.new(csv_file_path)

bread = Meal.new({ name: 'bread', price: 10 })

mr.create(bread)

