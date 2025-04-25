# 1. Welcome
# 2. Display menu (list / add / delete / mark )
# 3. Get user action
# 4. Perform the right action

puts "Welcome to your Christmas gift list"
puts "-" * 30

action = ''
until action == 'quit'
  puts "Which action [list|add|delete|quit]?"

  action = gets.chomp

  case action
  when "list"
    puts "TODO: implement list"
  when "add"
    puts "TODO: implement add"
  when "delete"
    puts "TODO: implement delete"
  when "quit"
    puts "Bye 👋"
  end
end
