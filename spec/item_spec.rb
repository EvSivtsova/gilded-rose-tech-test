require 'Item'

describe Item do
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
