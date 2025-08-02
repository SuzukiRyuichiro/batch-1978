Contact.destroy_all
25.times do
  Contact.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.phone_number,
    birthday: Faker::Date.birthday(min_age: 18, max_age: 65)
  )
end
