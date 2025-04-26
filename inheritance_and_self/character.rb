class Character
  attr_reader :name, :health

  def initialize(name, health)
    @name = name
    @health = health
  end

  def total_power
    @health * 1.5
  end
end


