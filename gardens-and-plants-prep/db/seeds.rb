Plant.destroy_all if Rails.env.development?
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
  name: 'Cactus',
  image_url: 'https://image.pollinations.ai/prompt/cactus',
  garden: little
)

Plant.create!(
  name: 'Palm tree',
  image_url: 'https://image.pollinations.ai/prompt/Palm+tree',
  garden: little
)
