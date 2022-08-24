require 'item_factory'

# the integration tests are used to test for class inheritance

describe ItemFactory do
  context "when constructing" do
    it "initiliazes with the hash of special item types: regex as key and corresponding class as values" do
      items = ItemFactory.new
      expect(items.item_types).to include({
        /aged brie/ => AgedBrie,
        /sulfuras/ => Sulfuras,
        /backstage pass/ => BackstagePass
      })
    end
  end

  context "when creating an instance of a Class" do
    it "identify 'Aged Brie''s type and uses AgedBrie Class to instantiate the instance" do
      factory = ItemFactory.new
      item = factory.create_one_item('Aged Brie', 2, 30)
      expect(item).to be_an_instance_of AgedBrie
      expect(item).not_to be_an_instance_of Sulfuras
      expect(item).not_to be_an_instance_of BackstagePass
      expect(item).not_to be_an_instance_of Item
      expect(item.to_string).to eq "Aged Brie, 2, 30"
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq 1
      expect(item.quality).to eq 31
    end

    it "identify 'Sulfuras' type and uses Sulfuras Class to instantiate the instance" do
      factory = ItemFactory.new
      item = factory.create_one_item('Sulfuras, Hand of Ragnaros', 2, 30)
      expect(item).to be_an_instance_of Sulfuras
      expect(item).not_to be_an_instance_of AgedBrie
      expect(item).not_to be_an_instance_of BackstagePass
      expect(item).not_to be_an_instance_of Item
      expect(item.to_string).to eq "Sulfuras, Hand of Ragnaros, 2, 30"
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq 2
      expect(item.quality).to eq 30
    end

    it "identify 'Backstage Passes' type and uses BackstagePass Class to instantiate the instance" do
      factory = ItemFactory.new
      item = factory.create_one_item('Backstage passes to a TAFKAL80ETC concert', 12, 30)
      expect(item).to be_an_instance_of BackstagePass
      expect(item).not_to be_an_instance_of Sulfuras
      expect(item).not_to be_an_instance_of AgedBrie
      expect(item).not_to be_an_instance_of Item
      expect(item.to_string).to eq "Backstage passes to a TAFKAL80ETC concert, 12, 30"
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq 11
      expect(item.quality).to eq 31
      item.update_quality_and_sell_in
      item.update_quality_and_sell_in
      item.update_quality_and_sell_in
      item.update_quality_and_sell_in
      item.update_quality_and_sell_in
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq 5
      expect(item.quality).to eq 44
    end

    it "identify standard item type and uses Item Class to instantiate the instance" do
      factory = ItemFactory.new
      item = factory.create_one_item('Some item', 20, 30)
      expect(item).to be_an_instance_of Item
      expect(item).not_to be_an_instance_of BackstagePass
      expect(item).not_to be_an_instance_of Sulfuras
      expect(item).not_to be_an_instance_of AgedBrie
      expect(item.to_string).to eq "Some item, 20, 30"
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq 19
      expect(item.quality).to eq 29
    end
  end

  context "when creating new objects from an array" do
    it "recognises the types and creates instances of corresponding Classes" do
      items_array = [['Aged Brie', 10, 30],
                 ['Sulfuras, Hand of Ragnaros', 6, 40],
                 ['Backstage passes to a TAFKAL80ETC concert', 8, 10],
                 ['Random item', 10, 10]]
      factory = ItemFactory.new
      factory.create_items(items_array)
      factory.items
      expect(factory.items[0]).to be_an_instance_of AgedBrie
      expect(factory.items[1]).to be_an_instance_of Sulfuras
      expect(factory.items[2]).to be_an_instance_of BackstagePass
      expect(factory.items[3]).to be_an_instance_of Item
    end
  end
end
