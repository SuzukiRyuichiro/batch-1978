class Room
  attr_accessor :id

  def initialize(attributes = {})
    @id = attributes[:id]
    @patients = attributes[:patients] || []
    @capacity = attributes[:capacity] || 0
  end

  def add_patient(patient) # Expect instance of patient
    # Check if the room is full
    # raise error (Guard Clause)
    raise FullRoom, "Room is over capacity. Max: #{@capacity}" if full?

    # Put the patient instance into @patients
    @patients << patient
    # Make sure patient get the room as their attribute
    patient.room = self
  end

  private

  def full?
    # number of patients is greater than or equal to capacity
    @patients.size >= @capacity
  end
end

class FullRoom < StandardError; end
