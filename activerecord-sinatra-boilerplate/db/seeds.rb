require 'faker'

10.times do
  Restaurant.create!(
    name: Faker::Coffee.blend_name,
    address: Faker::Address.full_address
  )
end
