require_relative '../animal'
# Define an Animal with an initialize(name) constructor, exposing its name.

describe Animal do
  describe "#initialize" do
    it 'takes one argument and make an instance of Animal' do
      antonio = Animal.new("Antonio")
      # If antonio is actually an instance of Animal
      # antonio.class == Animal
      expect(antonio).to be_an(Animal)
    end
  end

  describe "#name" do
    it 'returns the name of the animal' do
      antonio = Animal.new("Antonio")
      expect(antonio.name).to eq('Antonio')
    end
  end

  describe "::phyla" do
    it 'return all 5 phylas in the world' do
      expected = ['Fish', 'Mammals', 'Insects', 'Birds', 'Reptiles']
      actual = Animal.phyla

      expect(expected).to  eq(actual)
    end
  end

  describe "#eat" do
    it 'returns the string explaining who ate what' do
      phuong = Animal.new('Phuong')

      expect(phuong.eat('chicken')).to eq('Phuong eats chicken')
    end
  end

end
