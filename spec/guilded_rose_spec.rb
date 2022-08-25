require_relative "../guilded_rose"

# the integration tests are used to test for class inheritance

describe GuildedRose do
  it "updates quality and sell_in values of a range of items in an array" do
    items_array = [['Aged Brie', 10, 30],
                ['Sulfuras, Hand of Ragnaros', 6, 40],
                ['Backstage passes to a TAFKAL80ETC concert', 8, 10],
                ['Random item', 10, 10],
                ['Conjured', 10, 10]]
    factory = ItemFactory.new
    factory.create_items(items_array)
    guilded_rose = GuildedRose.new(factory.items)
    guilded_rose.update_quality_and_sell_in
    expect(guilded_rose.items[0].to_string).to eq 'Aged Brie, 9, 31'
    expect(guilded_rose.items[1].to_string).to eq 'Sulfuras, Hand of Ragnaros, 6, 40'
    expect(guilded_rose.items[2].to_string).to eq 'Backstage passes to a TAFKAL80ETC concert, 7, 12'
    expect(guilded_rose.items[3].to_string).to eq 'Random item, 9, 9'
    expect(guilded_rose.items[4].to_string).to eq 'Conjured, 9, 8'
  end

  context "when input is incorrect" do
    it "fails to create an array if any of the arguments are missing and raises an Argument error" do
      items_array = [[10, 30],
      ['Sulfuras, Hand of Ragnaros', 6, 40],
      ['Backstage passes to a TAFKAL80ETC concert', 8, 10],
      ['Random item', 10, 10]]
      factory = ItemFactory.new
      expect { factory.create_items(items_array) }.to raise_error("Please make sure that each item contains three values")
    end

    it "fails to create an array if any of the arguments are missing and raises an Argument error" do
      items_array = [[10, 30],
      ['Sulfuras, Hand of Ragnaros', 6, 40],
      ['Backstage passes to a TAFKAL80ETC concert', 8, 10],
      ['Random item', 10, 10]]
      factory = ItemFactory.new
      expect { factory.create_items(items_array) }.to raise_error
    end

    it "raises error when the type of the argument is incorrect or when its value is out of acceptable range" do
      items_array = [[10, 30, 10],
      ['Sulfuras, Hand of Ragnaros', 6, 40]]
      factory = ItemFactory.new
      expect { factory.create_items(items_array) }.to raise_error "Item's name must be a string"
    end

    it "raises error when the type of the argument is incorrect or when its value is out of acceptable range" do
      items_array = [['aged brie', 'argument2', 30],
      ['Sulfuras, Hand of Ragnaros', 6, 40]]
      factory = ItemFactory.new
      expect { factory.create_items(items_array) }.to raise_error "Sell in days value must be a positive integer"
    end

    it "raises error when the type of the argument is incorrect or when its value is out of acceptable range" do
      items_array = [['aged brie', 10, 30],
      ['Sulfuras, Hand of Ragnaros', -6, 40]]
      factory = ItemFactory.new
      expect { factory.create_items(items_array) }.to raise_error "Sell in days value must be a positive integer"
    end

    it "raises error when the type of the argument is incorrect or when its value is out of acceptable range" do
      items_array = [['aged brie', 10, 'argument3'],
      ['Sulfuras, Hand of Ragnaros', -6, 40]]
      factory = ItemFactory.new
      expect { factory.create_items(items_array) }.to raise_error "Quality value must be a positive integer less than or equal to 50"
    end

    it "raises error when the type of the argument is incorrect or when its value is out of acceptable range" do
      items_array = [['aged brie', 10, 3],
      ['Sulfuras, Hand of Ragnaros', 6, -1]]
      factory = ItemFactory.new
      expect { factory.create_items(items_array) }.to raise_error "Quality value must be a positive integer less than or equal to 50"
    end
  end
end
