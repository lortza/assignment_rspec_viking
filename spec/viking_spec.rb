require 'viking'

describe Viking do

  it "Passing a name to a new Viking sets that name attribute" do
  end

  it "Passing a health attribute to a new Viking sets that health attribute" do
  end

  it "health cannot be overwritten after it's been set on initialize" do
  end

  it "A Viking's weapon starts out nil by default" do
  end

  it "Picking up a Weapon sets it as the Viking's weapon" do
  end

  it "Picking up a non-Weapon raises an exception" do
  end

  it "Picking up a new Weapon replaces the Viking's existing weapon" do
  end

  it "Dropping a Viking's weapon leaves the Viking weaponless" do
  end

  it "The receive_attack method reduces that Viking's health by the specified amount" do
  end

  it "The receive_attack method calls the take_damage method (hint: recall expect(...).to receive(...))" do
  end

  it "attacking another Viking causes the recipient's health to drop" do
  end

  it "attacking another Viking calls that Viking's take_damage method" do
  end

  it "attacking with no weapon runs damage_with_fists" do
  end

  it "attacking with no weapon deals Fists multiplier times strength damage" do
  end

  it "attacking with a weapon runs damage_with_weapon" do
  end

  it "attacking with a weapon deals damage equal to the Viking's strength times that Weapon's multiplier" do
  end

  it "attacking using a Bow without enough arrows uses Fists instead" do
  end

  it "Killing a Viking raises an error" do
  end

end #Viking