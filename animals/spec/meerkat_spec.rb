require_relative '../meerkat'

describe Meerkat do
  describe "#talk" do
    it 'returns string that says the meerkat bark' do
      timone = Meerkat.new('Timone')
      expect(timone.talk).to eq('Timone barks')
    end
  end
end
