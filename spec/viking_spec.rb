require 'pry'
require 'viking'

describe Viking do

  before do
    allow($stdout).to receive(:puts)
  end

  let(:default_viking) { Viking.new }
  let(:custom_viking) { Viking.new('Zorro', 200, 20, Axe.new) }

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
    let(:armed_viking) { Viking.new('Armed Viking', 100, 10, Axe.new) }
    let(:damage) { 5 }

    it "causes the recipient's health to drop" do
      before_health = default_viking.health
      armed_viking.attack(default_viking)
      expect(default_viking.health).to be < before_health
    end

    context 'with no weapon' do
      let(:unarmed_viking) { Viking.new('Unarmed Viking', 100, 10) }

      it "runs damage_with_fists" do
        allow(unarmed_viking).to receive(:damage_with_fists).and_return(damage)
        expect(unarmed_viking).to receive(:damage_with_fists)
        unarmed_viking.attack(default_viking)
      end

      it "deals damage equal to Fists multiplier times strength damage" do
        fists = Fists.new
        weapon_multiplier = fists.use
        strength_multiplier = armed_viking.strength
        inflicted_damage = strength_multiplier * weapon_multiplier

        expect(default_viking).to receive(:receive_attack).and_return(inflicted_damage)
        armed_viking.attack(default_viking)
      end
    end

    context 'with a weapon' do
      it "runs damage_with_weapon" do
        allow(armed_viking).to receive(:damage_with_weapon).and_return(damage)
        expect(armed_viking).to receive(:damage_with_weapon)
        armed_viking.attack(default_viking)
      end

      it "deals damage equal to the Viking's strength times that Weapon's multiplier" do
        weapon_multiplier = armed_viking.weapon.use
        strength_multiplier = armed_viking.strength
        inflicted_damage = strength_multiplier * weapon_multiplier

        expect(default_viking).to receive(:receive_attack).with(inflicted_damage)
        armed_viking.attack(default_viking)
      end

      it 'with an empty bow uses Fists instead' do
        empty_bow = Bow.new(0)
        fists = Fists.new
        weapon_multiplier = fists.use
        strength_multiplier = armed_viking.strength
        inflicted_damage = strength_multiplier * weapon_multiplier

        armed_viking.pick_up_weapon(empty_bow)
        allow(armed_viking).to receive(:damage_with_fists).and_return(inflicted_damage)
        expect(armed_viking).to receive(:damage_with_fists)
        armed_viking.attack(default_viking)
      end
    end
  end

  describe '#receive_attack' do
    let(:damage) { 5 }

    it "calls that Viking's take_damage method" do
      expect(default_viking).to receive(:take_damage).with(damage)
      default_viking.receive_attack(damage)
    end

    it "reduces that Viking's health by the specified amount" do
      before_health = default_viking.health
      default_viking.receive_attack(damage)
      expect(default_viking.health).to eq(before_health - damage)
    end

    it "killing a Viking raises an error" do
      lethal_damage = 100
      expect { default_viking.receive_attack(lethal_damage) }.to raise_error("#{default_viking.name} has Died...")
    end
  end

  describe '#pick_up_weapon' do

    it "sets it as the Viking's weapon" do
      unarmed_viking = Viking.new('Unarmed Viking', 100, 10)
      unarmed_viking.pick_up_weapon(Axe.new)
      expect(unarmed_viking.weapon.class).to be(Axe)
    end

    it "if new, it replaces the Viking's existing weapon" do
      armed_viking = Viking.new('Armed Viking', 100, 10, Axe.new)
      armed_viking.pick_up_weapon(Bow.new)
      expect(armed_viking.weapon.class).to be(Bow)
    end

    it "if it's not a weapon, it raises an exception" do
      expect { armed_viking.pick_up_weapon(FakeClass.new) }.to raise_error(NameError)
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