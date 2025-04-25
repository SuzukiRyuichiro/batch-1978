hour = 20

# Bad example
# print out good morning if it's before 12
if hour < 12
  puts 'Good morning!'
elsif hour >= 12
  # print out good afternoon if its past 12
  puts 'Good afternoon!'
elsif hour > 19
  # print out good evening if it's past 19
  puts 'Good evening!'
else
  puts 'good day!'
end
