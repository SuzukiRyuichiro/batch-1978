# TODO: Define an Animal with an initialize(name) constructor, exposing its name.

class Animal
  attr_reader :name

  def initialize(name)
    @name = name
  end

  # TODO: define class method phyla that returns ['Fish', 'Mammals', 'Insects', 'Birds', 'Reptiles']

  def self.phyla
    return ['Fish', 'Mammals', 'Insects', 'Birds', 'Reptiles']
  end

  # TODO: define eat instance method
  def eat(food)
    # return string like `name eats food`
    "#{@name} eats #{food}"
  end
end
