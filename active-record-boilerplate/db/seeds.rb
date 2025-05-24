# delete everything first
Consultation.destroy_all
Patient.destroy_all
Intern.destroy_all
Doctor.destroy_all

antonio = Doctor.create(first_name: 'Antonio', last_name: 'Vinciguerra')
mizuki = Doctor.create(first_name: 'Mizuki', last_name: 'Harthan')

phuong = Intern.create(first_name: "Phuong", last_name: "Nguyen")
phuong.doctor = antonio


scooter = Patient.create(first_name: 'Ryuichiro', last_name: 'Suzuki')

Consultation.create(doctor: antonio, patient: scooter)
Consultation.create(doctor: mizuki, patient: scooter)
