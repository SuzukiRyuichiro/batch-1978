require 'faker'

CATEGORIES = ["chinese", "italian", "japanese", "french", "belgian"]

puts "Cleaning database..."
Review.destroy_all
Restaurant.destroy_all

puts "Creating restaurants and reviews..."

20.times do
  restaurant = Restaurant.create!(
    name: Faker::Restaurant.unique.name + [" & Sons", " Palace", " Shack", " Bistro", " Laboratory", " Emporium", " Noodle House", " Tavern", " Diner", " Observatory"].sample,
    address: Faker::Address.street_address + ", " + Faker::Address.city,
    phone_number: Faker::PhoneNumber.phone_number,
    category: CATEGORIES.sample
  )

  rand(10..20).times do
    content = [
      "Absolutely loved it! The chef wore a wizard hat.",
      "Waiter recited poetry with every course.",
      "Food was great, but the chairs squeaked in Morse code.",
      "Best meal I've had while being serenaded by a ukulele.",
      "The dessert came with a tiny umbrella and a riddle.",
      "Soup was served in a teapot. 10/10 would slurp again.",
      "Ambience: 5 stars, especially the disco ball in the restroom.",
      "Menu had a secret code. Solved it for a free appetizer!",
      "Chef juggled knives while cooking. Impressive and slightly terrifying.",
      "My water glass was never empty, thanks to the robot waiter.",
      "The bread basket was shaped like a swan.",
      "Got a fortune cookie with my pizza. It predicted dessert.",
      "The napkins were origami animals.",
      "A cat sat at the next table and ordered fish.",
      "The chef sang opera while flambéing.",
      "Chopsticks were actually pencils. Fun!",
      "The bill came in a treasure chest.",
      "The lights dimmed every time someone said 'delicious'.",
      "The chef asked me to rate his moustache. 5 stars!",
      "The menu was written in haiku."
    ].sample
    rating = rand(0..5)
    Review.create!(
      content: content,
      rating: rating,
      restaurant: restaurant
    )
  end
end

puts "Seeding done!"
