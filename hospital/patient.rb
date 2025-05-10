class Patient
  attr_accessor :room
  attr_reader :name, :cured

  def initialize(attributes = {})
    @name = attributes[:name]
    @cured = attributes[:cured] || false
  end
end
