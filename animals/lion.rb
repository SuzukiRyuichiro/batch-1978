require_relative 'animal'

class Lion < Animal
  def talk
    "#{@name} roars"
  end

  # TODO: define eat instance method that overrides the one in animal
  def eat(food)
    "#{super}. Law of the jungle!"
  end
end
