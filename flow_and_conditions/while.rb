# computer is going to pick a random number (1..10)
# ask the user for the number to guess
# if it is correct, end the game

number = rand(1..10)

puts number

puts 'Guess the number!'
choice = gets.chomp.to_i

while choice != number
  puts 'Oh you got it wrong! guess again!'
  choice = gets.chomp.to_i
end
