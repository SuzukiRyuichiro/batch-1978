class Patient
  attr_accessor :room, :id
  attr_reader :name, :cured

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @cured = attributes[:cured] || false
  end
end
