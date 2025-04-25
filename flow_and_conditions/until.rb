number = rand(1..10)

puts number

choice = nil

until choice == number
  puts 'Guess the number!'
  choice = gets.chomp.to_i
end
