require 'csv'
require_relative 'patient'

class PatientRepository
  def initialize(csv_file_path, room_repository)
    @csv_file_path = csv_file_path
    @room_repository = room_repository
    @patients = []
    load_csv
  end

  # Create
  # Destroy

  private

  # Load CSV
  def load_csv
    # Open CSV
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      # Iterate over each row
      # Make Patient instance
      name = row[:name]
      cured = row[:cured] == 'true' # Because CSV parse is string
      room_id = row[:room_id].to_i

      # Use room id to find a room (Ask Room Repository)
      room = @room_repository.find(room_id)

      patient = Patient.new(name: name, cured: cured)
      room.add_patient(patient)
      # Put them in @patients array
      @patients << patient
    end
  end
  # Save CSV
end
