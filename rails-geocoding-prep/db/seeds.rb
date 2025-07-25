Flat.destroy_all

flats = [
  { name: "Shibuya Sky Loft", address: "2-24-12 Shibuya, Tokyo" },
  { name: "Ginza Urban Retreat", address: "5-8-1 Ginza, Tokyo" },
  { name: "Harajuku Hideaway", address: "1-19-11 Jingumae, Tokyo" },
  { name: "Asakusa Zen Home", address: "2-3-1 Asakusa, Tokyo" },
  { name: "Akihabara Tech Studio", address: "3-16-9 Sotokanda, Tokyo" },
  { name: "Meguro Riverside", address: "1-5-1 Kamimeguro, Tokyo" },
  { name: "Ebisu Garden Flat", address: "4-20-3 Ebisu, Tokyo" },
  { name: "Roppongi Luxe", address: "7-14-7 Roppongi, Tokyo" },
  { name: "Ueno Park View", address: "6-13-9 Ueno, Tokyo" },
  { name: "Kichijoji Cozy Corner", address: "2-4-2 Kichijoji Minamicho, Tokyo" }
]

flats.each do |flat|
  Flat.create!(flat)
end
