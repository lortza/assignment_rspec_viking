require 'viking'

describe Viking do
  let(:default_viking) { Viking.new }
  let(:named_viking) { Viking.new(name: 'Sven') }

  describe '#initialize' do
    xit "passing a name sets the name attribute" do
    end

    xit "passing a health attribute sets the health attribute" do
    end

    xit "health cannot be overwritten after it's been set on initialize" do
    end

    xit "sets the weapon to nil by default" do
    end
  end

  describe '#attack' do
    xit "causes the recipient's health to drop" do
    end

    xit "calls that Viking's take_damage method" do
    end

    context 'with no weapon' do
      xit "runs damage_with_fists" do
      end

      xit "deals Fists multiplier times strength damage" do
      end
    end

    context 'with a weapon' do
      xit "runs damage_with_weapon" do
      end

      xit "deals damage equal to the Viking's strength times that Weapon's multiplier" do
      end

      xit 'with an empty bow uses Fists instead' do
      end
    end
  end

  describe '#receive_attack' do
    xit "reduces that Viking's health by the specified amount" do
    end

    xit "calls the take_damage method (hint: recall expect(...).to receive(...))" do
    end

    xit "killing a Viking raises an error" do
    end
  end

  describe '#pick_up_weapon' do
    xit "sets it as the Viking's weapon" do
    end

    xit "if new, it replaces the Viking's existing weapon" do
    end

    xit "if it's not a weapon, it raises an exception" do
    end
  end

  describe '#drop_weapon' do
    xit "leaves the Viking weaponless" do
    end
  end

end #Viking