require_relative '../animal'
# Define an Animal with an initialize(name) constructor, exposing its name.
# Define three Lion, Meerkat and Warthog classes
# Implement a #talk instance method which returns a sentence like "Simba roars" for each animal. (Hint: Meerkats bark and Warthog grunt)
# In another Ruby file, create an array with Simba, Nala, Timon & Pumbaa, iterate over it and puts the sound each animal make
# Implement a ::phyla class method which will return an array of the phyla of the animal kingdom.
# Add an #eat(food) instance method in Animal which returns a sentence like “Timon eats a scorpion”. Then override this method for the Lion class, and return a sentence like “Simba eats a gazelle. Law of the Jungle!”

describe Animal do
  describe "#initialize" do
    it 'instanciate an Animal with name' do
      animal = Animal.new("Simba")

      # Check if the instance is actually of that class
      expect(animal).to be_an(Animal)
    end
  end

  describe "readers" do
    it 'can read name' do
      animal = Animal.new("Simba")

      # Check if the instance is actually of that class
      expect(animal.name).to eq('Simba')
    end
  end

  describe "::phyla" do
    it 'returns array of phyla of animals' do
      expected = ["fish", "dog", "snake"]
      actual = Animal.phyla

      expect(expected).to eq(actual)
    end
  end

  describe "#eat" do
    it 'returns string explaining who ate what' do
      animal = Animal.new("Timone")

      expect(animal.eat('scorpion')).to eq("Timone eats scorpion")
    end
  end
end
