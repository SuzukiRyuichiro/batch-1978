class Patient
  attr_reader :name, :cured
  attr_accessor :room

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @cured = attributes[:cured] || false
    @room = attributes[:room]
  end
end
