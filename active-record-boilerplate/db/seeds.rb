Consultation.destroy_all
Patient.destroy_all
Intern.destroy_all
Doctor.destroy_all

tony = Doctor.new(first_name: 'Tony', last_name: 'Stark')
tony.save

# Let's make peter intern of Tony

peter = Intern.new(first_name: 'Peter', last_name: 'Parker', doctor_id: tony.id)
peter.save

scooter = Patient.create!(first_name: 'Scoot', last_name: 'Scoot')
antonio = Patient.create!(first_name: 'Anton', last_name: 'Anton')

Consultation.create!(doctor: tony, patient: scooter)
Consultation.create!(doctor: tony, patient: antonio)
