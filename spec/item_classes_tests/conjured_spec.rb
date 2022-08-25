require 'conjured'

# the integration tests are used to test for class inheritance

describe Conjured do
  context "when constructing" do
    it "inherits from Item class" do
      expect(Conjured).to be < Item
    end

    it "constructs and returns item's attributes as a string" do
      item = Conjured.new('conjured', 10, 30)
      expect(item.to_string).to eq "conjured, 10, 30"
    end

    it "fails to construct if any of the arguments are missing and raises an Argument error" do
      expect { Conjured.new('10', '30') }.to raise_error(ArgumentError)
    end
  
    it "raises error when the type of the argument is incorrect or when its value is out of acceptable range" do
      expect { Conjured.new(5, 10, 30) }.to raise_error "Item's name must be a string"
      expect { Conjured.new('conjured', 'argument2', 30) }.to raise_error "Sell in days value must be a positive integer"
      expect { Conjured.new('conjured', -5, 30) }.to raise_error "Sell in days value must be a positive integer"
      expect { Conjured.new('conjured', 30, 'argument3') }.to raise_error "Quality value must be a positive integer less than or equal to 50"
      expect { Conjured.new('conjured', 30, -1) }.to raise_error "Quality value must be a positive integer less than or equal to 50"
    end
  end

  context "when updating quality and sell_in values before the sell by date" do
    it "reduces the quality value by 1" do
      item = Conjured.new('conjured', 10, 30)
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq 9
      expect(item.quality).to eq 28
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq 8
      expect(item.quality).to eq 26
    end
  end

  context "when updating quality and sell_in values after the sell by date" do
    it "reduces the quality value by 2" do
      item = Conjured.new('conjured', 1, 30)
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq 0
      expect(item.quality).to eq 28
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq -1
      expect(item.quality).to eq 24
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq -2
      expect(item.quality).to eq 20
    end
  end
end
