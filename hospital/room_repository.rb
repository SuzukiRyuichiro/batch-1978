require 'csv'
require_relative 'room'

class RoomRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @rooms = []
    load_csv
  end

  # Create
  def create(room) # Expect room instance
    # Room doesn't have ID, so let's assign one that is unique
    room.id = @next_id
    @next_id += 1 # Update the next ID to a new unique one
    # Insert room into @rooms array
    @rooms << room
    # save to CSV -> you'll do this in challenge
  end

  # Find using ID
  def find(id)
    # iterate and find matching ID
    @rooms.find { |room| room.id == id }
  end

  private

  # Load CSV
  def load_csv
    # Open and iterate over each row
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      # Make instance of room
      room = Room.new(id: row[:id].to_i, capacity: row[:capacity].to_i)
      @rooms << room
    end

    # Figure out what the next ID should be
    # If there is nothing in CSV, id should be 1
    # If there are many things in CSV, should be +1 of the last ID
    @next_id = @rooms.empty? ? 1 : @rooms.last.id + 1
  end

  # Save CSV -> todo
end
