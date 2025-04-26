require_relative 'lion'
require_relative 'meerkat'
require_relative 'warthog'

# Simba, Nala, Timon & Pumbaa

simba = Lion.new('Simba')
nala = Lion.new('Nala')
timon = Meerkat.new('Timon')
pumbaa = Warthog.new('Pumbaa')

lion_king = [simba, nala, timon, pumbaa]

# Iterate and call .talk on all of the animals in lion king
lion_king.each do |animal|
  puts animal.talk
end
