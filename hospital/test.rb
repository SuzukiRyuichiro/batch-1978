require_relative 'patient'
require_relative 'room'


antonio = Patient.new({ name: 'Antonio', cured: true })
scooter = Patient.new({ name: 'Scooter' })

room_101 = Room.new(name: '101', capacity: 3)
room_201 = Room.new(name: '201', capacity: 1)

# Let's put patients into rooms
# Add antonio into room 101
# Add scooter into room 201
# If I ask Scooter which room he's in, he should answer


room_101.add_patient(scooter)
room_201.add_patient(antonio)

p scooter
p antonio

p room_101
p room_201
