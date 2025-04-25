# students =     [ "Peter", "Mary", "George", "Emma" ]
# student_ages = [ 24     , 25    , 22      ,  20    ]

# "1  - Peter is 24 years old"
# "2  - Mary is 25 years old"
# ..

# puts "1 - #{students[0]} is #{student_ages[0]}"
# puts "2 - #{students[1]} is #{student_ages[1]}"
# puts "3 - #{students[2]} is #{student_ages[2]}"
# puts "4 - #{students[3]} is #{student_ages[3]}"

# students.each_with_index do |student, index|
#   puts "I am #{student} and I am #{student_ages[index]} years old"
# end


# p paris["country"]
# p paris["population"]
# p paris["area"] # returns nil

# puts "Before adding"
# p paris

# puts "after adding"

# paris["monument"] = "Eiffel Tower"
# p paris

# puts "updating population"

# paris["population"] = 2048472
# p paris

# puts 'destroy effiel tower'
# paris.delete("monument")

# paris = {
#   "country" => "France",
#   "population" => 2200000
# }

# paris.each do |key, value|
#   puts "#{key.capitalize} is #{value}"
# end

# p paris.key?("country")
# p paris.key?("monument")

# p paris.keys

cities = [['London', 'United Kingdom', 'Big ben'], ['Tokyo', 'Japan', 'Sensoji']]

# p cities[1][2]

better_cities = {
  "London" => {
    country: "United Kingdom",
    monument: "Big ben"
  },
  "Tokyo" => {
    country: "Japan",
    monument: "Sensoji"
  }
}

p better_cities["London"][:monument]
p better_cities["London"]["monument"]
