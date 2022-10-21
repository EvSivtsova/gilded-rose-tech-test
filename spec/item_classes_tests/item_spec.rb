require 'item'

describe Item do
  context "when constructing" do
    it 'is an instance of Item class' do
      item = Item.new('orange juice', 10, 30)
      expect(item).to be_instance_of(Item)
    end
    
    it "constructs and returns item's attributes as a string" do
      item = Item.new('orange juice', 10, 30)
      expect(item.to_string).to eq "orange juice, 10, 30"
    end
    
    it "fails to construct if any of the arguments are missing and raises an Argument error" do
      expect { Item.new('10', '30') }.to raise_error(ArgumentError)
    end

    it "raises error when the type of the argument is incorrect or when its value is out of acceptable range" do
      expect { Item.new(5, 10, 30) }.to raise_error "Item's name must be a string"
      expect { Item.new('item', 'argument2', 30) }.to raise_error "Sell in days value must be a positive integer"
      expect { Item.new('item', -5, 30) }.to raise_error "Sell in days value must be a positive integer"
      expect { Item.new('item', 30, 'argument3') }.to raise_error "Quality value must be a positive integer less than or equal to 50"
      expect { Item.new('item', 30, -1) }.to raise_error "Quality value must be a positive integer less than or equal to 50"
    end
  end

  context "when updating quality and sell_in values before the sell by date" do
    it "reduces the quality value by 1" do
      item = Item.new('orange juice', 10, 30)
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq 9
      expect(item.quality).to eq 29
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq 8
      expect(item.quality).to eq 28
    end
  end

  context "when updating quality and sell_in values after the sell by date" do
    it "reduces the quality value by 2" do
      item = Item.new('orange juice', 1, 30)
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq 0
      expect(item.quality).to eq 29
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq -1
      expect(item.quality).to eq 27
      item.update_quality_and_sell_in
      expect(item.name).to eq "orange juice"
      expect(item.sell_in).to eq -2
      expect(item.quality).to eq 25
    end
  end
end
