# 1.
# You can store things in variable
# age = 15

# 2.
# the value 18 is assigned to the variable called age

# 3.
# Method is a set of instructions, and the point is to reuse them

# 4.
def multiply(x, y) # defines a method called multiply takes argument x and y
  return x * y     # returns the product of x and y
end                # end of the method

puts multiply(5, 8) # calls the method with parameters 5 and 8 and print the value to terminal


# 5.
# to change the flow of the code depending on a condition

age = 18

if age > 18
  puts "you can drink"
end


# 6
grades = [19, 8, 11, 15, 13]
total_grade = 0 # we accumulate all students' grades

grades.each do |grade|
  # accumulate the grade into a variable (total_grade)
  # update the old value of total grade by adding the next grade
  total_grade = grade + total_grade
end

average = total_grade / grades.length.to_f


# 7

def capitalize_name(first_name, last_name)
  fn = first_name.capitalize
  ln = last_name.capitalize

  return "#{fn} #{ln}"
end

# 8
# concatination

age = 15

# interpolation
"Hi i am #{age} years old"

# concatination
"Hi i am" + age + " years old"


fruits = ["banana", "peach", "watermelon", "orange"]

# Print out "peach" from the fruits array in the terminal
puts fruits[1]
# Add an "apple" to the fruits array
fruits << "apple"
# Replace "watermelon" by "pear"
fruits[2] = "pear"
# Delete "orange"
fruits.delete_at(3)


city = { name: "Paris", population: 2000000 }

# Print out the name of the city
puts city[:name]
# Add the Eiffel Tower to city with the `:monument` key
city[:monument] = "Eiffel Tower"
# Update the population to 2000001
city[:population] = 2000001

# What will the following code return?
city[:mayor]



students = [ [ "john", 28 ], [ "mary", 25 ], [ "paul", 21 ] ]


students.map do |student|
  # student: array that look like [ "paul", 21 ]
  { name: student[0], age: student[1] }
end


# goal
[
  { name: "john", age: 28 },
  { name: "mary", age: 25 },
  { name: "paul", age: 21 }
]
