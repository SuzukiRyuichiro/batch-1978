require_relative 'room_repository'

rooms_csv_file = File.join(__dir__, 'rooms.csv')

room_repository = RoomRepository.new(rooms_csv_file)

new_room = Room.new({ capacity: 100 })

room_repository.create(new_room)

pp room_repository
