require 'aged_brie'

# the integration tests are used to test for class inheritance

describe AgedBrie do
  context "when constructing" do
    it "inherits from Item class" do
      expect(AgedBrie).to be < Item
    end

    it "constructs and returns item's attributes as a string" do
      item = AgedBrie.new('aged brie', 10, 30)
      expect(item.to_string).to eq "aged brie, 10, 30"
    end

    it "fails to construct if any of the arguments are missing and raises an Argument error" do
      expect { AgedBrie.new('10', '30') }.to raise_error(ArgumentError)
    end
  
    it "raises error when the type of the argument is incorrect or when its value is out of acceptable range" do
      expect { AgedBrie.new(5, 10, 30) }.to raise_error "Item's name must be a string"
      expect { AgedBrie.new('aged brie', 'argument2', 30) }.to raise_error "Sell in days value must be a positive integer"
      expect { AgedBrie.new('aged brie', -5, 30) }.to raise_error "Sell in days value must be a positive integer"
      expect { AgedBrie.new('aged brie', 30, 'argument3') }.to raise_error "Quality value must be a positive integer less than or equal to 50"
      expect { AgedBrie.new('aged brie', 30, -1) }.to raise_error "Quality value must be a positive integer less than or equal to 50"
    end
  end

  context "when updating quality and sell_in values" do
    it "the quality increases regardless of the sell_in" do
      item = AgedBrie.new('aged brie', 2, 30)
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq 1
      expect(item.quality).to eq 31
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq 0
      expect(item.quality).to eq 32
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq -1
      expect(item.quality).to eq 33
    end

    it "tops the quality value at 50" do
      item = AgedBrie.new('aged brie', 2, 49)
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq 1
      expect(item.quality).to eq 50
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq 0
      expect(item.quality).to eq 50
    end
  end
end
