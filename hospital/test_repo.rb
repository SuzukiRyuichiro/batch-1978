require_relative 'room_repository'
require_relative 'patient_repository'

room_csv_file_path = File.join(__dir__, './rooms.csv')
room_repository = RoomRepository.new(room_csv_file_path)


patient_csv_file_path = File.join(__dir__, './patients.csv')
patient_repository = PatientRepository.new(patient_csv_file_path, room_repository)

pp room_repository
