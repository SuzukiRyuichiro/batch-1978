class Room
  attr_reader :patients, :capacity
  attr_accessor :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @capacity = attributes[:capacity]
    @patients = attributes[:patients] || []
  end

  def add_patient(patient) # Expects instance of patient
    # Check if the room is full, if it is, error out
    if full?
      raise StandardError, "We cannot let #{patient.name} in!"
    else
      # If not continue adding
      @patients << patient
      # Assign attribute room to the patient
      patient.room = self
    end
  end

  private

  def full?
    # Return boolean if the room is over capacity?
    @patients.count >= @capacity
  end
end
