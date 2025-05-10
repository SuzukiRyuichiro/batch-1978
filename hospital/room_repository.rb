require 'csv'
require_relative 'room'

class RoomRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @rooms = []
    # Load from the CSV
    load_csv
  end

  # TODO: create
  def create(room) # Expect an instance of room w/out ID
    # Assign the ID to the new room
    room.id = @next_id
    # Add the room into the list of rooms
    @rooms << room
    # Increment the @next_id by one
    @next_id += 1
  end

  # TODO: destroy

  private

  def load_csv
    # open the CSV file, start iterating
    CSV.foreach(@csv_file_path, headers: true, header_converters: :symbol) do |row|
      # each iteration, make an instance of Room with the row info
      id = row[:id].to_i
      capacity = row[:capacity].to_i

      room = Room.new({ id: id, capacity: capacity })
      # put them into the list of rooms (@rooms)
      @rooms << room
    end

    # Save the next ID value into an instance variable
    # Get the last instance in the @rooms array
    # Plus one to that
    @next_id = @rooms.empty? ? 1 : @rooms.last.id + 1
  end

  # TODO: save CSV is in the challenge
end
