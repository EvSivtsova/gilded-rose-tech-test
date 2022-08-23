require 'Item'

describe Item do
  it "constructs" do
    item = Item.new('orange juice', '10', '30')
    expect(item.to_s).to eq "orange juice, 10, 30"
  end
end
