require_relative '../meerkat'

describe Meerkat do
  describe "#talk" do
    it 'bark with name' do
      nala = Meerkat.new('Nala')

      expect(nala.talk).to eq "Nala barks"
    end
  end
end
