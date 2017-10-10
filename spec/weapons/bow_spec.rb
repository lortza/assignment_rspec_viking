require 'weapons/bow'

describe Bow do
  let(:default_bow) { Bow.new }
  let(:loaded_bow) { Bow.new(20) }
  let(:empty_bow) { Bow.new(0) }

  it "'s arrow count is readable" do
    expect { default_bow.arrows }.to_not raise_error
  end

  describe '#initialize' do
    it("is a Bow") { expect(default_bow).to be_a(Bow) }
    it("has 10 arrows by default") { expect(default_bow.arrows).to eq(10) }
    it("can be loaded with a custom qty of arrows") { expect(loaded_bow.arrows).to eq(20) }
  end

  describe '#use' do
    it "reduces arrows by 1" do
      loaded_bow.use
      expect(loaded_bow.arrows).to eq(19)
    end
  end

  describe '#out_of_arrows?' do
    it "throws an error if the bow has 0 arrows" do
      expect { empty_bow.use }.to raise_error("Out of arrows")
    end
  end
end

