Garden.destroy_all if Rails.env.development?

little = Garden.create!(
  name: "My Little Garden",
  banner_url: "https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/parks-and-plants/garden_1.jpg"
)

Garden.create!(
  name: "My Other Garden",
  banner_url: "https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/parks-and-plants/garden_2.jpg"
)

Plant.create!(
  name: 'Pine tree',
  image_url: ' https://image.pollinations.ai/prompt/pine+tree',
  garden: little
)

Plant.create!(
  name: 'Cactus',
  image_url: ' https://image.pollinations.ai/prompt/Cactus',
  garden: little
)

Plant.create!(
  name: 'Hibiscus',
  image_url: ' https://image.pollinations.ai/prompt/Hibiscus',
  garden: little
)
