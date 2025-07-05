Pet.destroy_all

pets = [
  { name: "Buddy", species: "dog", address: "1-1 Chiyoda, Chiyoda-ku, Tokyo", found_on: Date.today - 2 },
  { name: "Whiskers", species: "cat", address: "2-2 Shibuya, Shibuya-ku, Tokyo", found_on: Date.today - 5 },
  { name: "Thumper", species: "rabbit", address: "3-3 Harajuku, Shibuya-ku, Tokyo", found_on: Date.today - 1 },
  { name: "Slinky", species: "snake", address: "4-4 Akihabara, Chiyoda-ku, Tokyo", found_on: Date.today - 7 },
  { name: "Shelly", species: "turtle", address: "5-5 Ueno, Taito-ku, Tokyo", found_on: Date.today - 3 },
  { name: "Max", species: "dog", address: "6-6 Meguro, Meguro-ku, Tokyo", found_on: Date.today - 4 },
  { name: "Mittens", species: "cat", address: "7-7 Asakusa, Taito-ku, Tokyo", found_on: Date.today - 6 },
  { name: "Coco", species: "rabbit", address: "8-8 Ebisu, Shibuya-ku, Tokyo", found_on: Date.today - 8 },
  { name: "Stripes", species: "snake", address: "9-9 Ginza, Chuo-ku, Tokyo", found_on: Date.today - 9 },
  { name: "Turbo", species: "turtle", address: "10-10 Setagaya, Setagaya-ku, Tokyo", found_on: Date.today - 10 }
]

pets.each do |pet_attrs|
  Pet.create!(pet_attrs)
end

puts "Created #{Pet.count} pets!"
