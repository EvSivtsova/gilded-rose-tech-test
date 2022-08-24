require 'sulfuras'

# the integration tests are used to test for class inheritance

describe Sulfuras do
  context "when constructing" do
    it "inherits from Item class" do
      expect(Sulfuras).to be < Item
    end

    it "fails to construct if any of the arguments are missing and raises an Argument error" do
      expect { Sulfuras.new('10', '30') }.to raise_error(ArgumentError)
    end
  
    it "raises error when the type of the argument is incorrect or when its value is out of acceptable range" do
      expect { Sulfuras.new(5, 10, 30) }.to raise_error "Item's name must be a string"
      expect { Sulfuras.new('sulfuras', 'argument2', 30) }.to raise_error "Sell in days value must be a positive integer"
      expect { Sulfuras.new('sulfuras', -5, 30) }.to raise_error "Sell in days value must be a positive integer"
      expect { Sulfuras.new('sulfuras', 30, 'argument3') }.to raise_error "Quality value must be a positive integer less than or equal to 50"
      expect { Sulfuras.new('sulfuras', 30, -1) }.to raise_error "Quality value must be a positive integer less than or equal to 50"
    end
  end

  context "when updating quality and sell_in values" do
    it "the quality and sell_in values remains the same" do
      item = Sulfuras.new('sulfuras', 2, 30)
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq 2
      expect(item.quality).to eq 30
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq 2
      expect(item.quality).to eq 30
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq 2
      expect(item.quality).to eq 30
    end
  end
end
