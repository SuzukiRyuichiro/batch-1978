require_relative '../warthog'

describe Warthog do
  describe "#talk" do
    it 'returns string that says the warthog grunts' do
      pumba = Warthog.new('Pumba')
      expect(pumba.talk).to eq('Pumba grunts')
    end
  end
end
