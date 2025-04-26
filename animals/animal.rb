class Animal
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.phyla
    ["fish", "dog", "snake"]
  end

  def eat(food)
    "#{@name} eats #{food}"
  end
end
