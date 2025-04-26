require_relative 'wizard'
require_relative 'warrior'

harry = Wizard.new('Harry', 10)
anakin = Warrior.new('Anakin', 10)
obi_wan = Warrior.new('Obi Wan', 20)

puts 'This is Anakin before harry joining'
p anakin
p harry

anakin.join_forces(harry)
obi_wan.join_forces(harry)

puts 'This is Anakin after harry joining'
p anakin

p harry
