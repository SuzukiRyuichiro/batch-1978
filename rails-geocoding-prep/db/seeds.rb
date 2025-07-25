Flat.destroy_all

flats = [
  { name: "Shibuya Sky Loft", address: "Shibuya, Tokyo, Japan" },
  { name: "Ginza Urban Retreat", address: "Ginza, Tokyo, Japan" },
  { name: "Harajuku Hideaway", address: "Jingumae, Tokyo, Japan" },
  { name: "Asakusa Zen Home", address: "Asakusa, Tokyo, Japan" },
  { name: "Akihabara Tech Studio", address: "Kanda, Tokyo, Japan" },
  { name: "Meguro Riverside", address: "Meguro, Tokyo, Japan" },
  { name: "Ebisu Garden Flat", address: "Ebisu, Tokyo, Japan" },
  { name: "Roppongi Luxe", address: "Roppongi, Tokyo, Japan" },
  { name: "Ueno Park View", address: "Ueno, Tokyo, Japan" },
  { name: "Kichijoji Cozy Corner", address: "Kichijoji, Tokyo, Japan" }
]

flats.each do |flat|
  Flat.create!(flat)
end
