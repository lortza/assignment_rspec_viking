require 'viking'

describe Viking do
  let(:default_viking) { Viking.new }
  let(:custom_viking) { Viking.new('Zorro', 200, 20) }

  describe '#initialize' do
    it "passing a name sets the name attribute" do
      expect(custom_viking.name).to eq('Zorro')
    end

    it "passing a health attribute sets the health attribute" do
      expect(custom_viking.health).to eq(200)
    end

    it "health cannot be overwritten after it's been set on initialize" do
      expect { custom_viking.health = 50 }.to raise_error(NoMethodError)
    end

    it "sets the weapon to nil by default" do
      expect(default_viking.weapon).to eq(nil)
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
    let(:armed_viking) { Viking.new('Armed Viking', 100, 10, Axe.new) }

    it "leaves the Viking weaponless" do
      expect(armed_viking.weapon).to_not eq(nil)
      armed_viking.drop_weapon
      expect(armed_viking.weapon).to eq(nil)
    end
  end

end #Viking