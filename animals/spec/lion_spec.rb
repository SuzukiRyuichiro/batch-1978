require_relative '../lion'

describe Lion do
  describe "#talk" do
    it 'returns string that says the lion roared' do
      simba = Lion.new('Simba')
      expect(simba.talk).to eq('Simba roars')
    end
  end

  describe "#eat" do
    it 'returns the string explaining who ate what and law of the jungle!' do
      simba = Lion.new('Simba')

      expect(simba.eat('gazelle')).to eq('Simba eats gazelle. Law of the jungle!')
    end
  end
end
