require_relative './item'
require_relative './sulfuras'
require_relative './aged_brie'
require_relative './backstage_pass'

class ItemFactory
  attr_reader :item_types, :items

  def initialize
    @item_types = {
      /aged brie/ => AgedBrie,
      /sulfuras/ => Sulfuras,
      /backstage pass/ => BackstagePass
    }
    @items = []
  end
  
  def create_items(items_array)
    items_array.each do |item|
      raise "Please make sure that each item contains three values" if item.length != 3
      item = create_one_item(item[0], item[1], item[2]) 
      @items << item
    end
  end
  
  def create_one_item(name, sell_in, quality)
    type = identify_type(name)
    item = type.new(name, sell_in, quality)
    return item
  end
  
  private
  
  def identify_type(name)
    raise "Item's name must be a string" if name.instance_of?(String) == false
    @item_types.map do |key, type|
      return type if name.downcase.match?(key)
    end
    return Item
  end
end
