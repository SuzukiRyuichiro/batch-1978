require_relative '../lion'

describe Lion do
  describe "#talk" do
    it 'roar with name' do
      simba = Lion.new('Simba')

      expect(simba.talk).to eq "Simba roars"
    end
  end

   describe "#eat" do
    it 'returns string explaining who ate what with king of the jungle' do
      lion = Lion.new("Simba")

      expect(lion.eat('gazelle')).to eq("Simba eats gazelle. Law of the Jungle!")
    end
  end
end
