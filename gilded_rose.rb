require_relative './lib/item_factory'
require_relative './data'

class GildedRose
  attr_reader :items
  def initialize(items)
    @items = items
  end

  def update_quality_and_sell_in
    @items.map { |item| item.update_quality_and_sell_in }
  end

  def items_to_string
    @items.map { |item| item.to_string }
  end
end

if __FILE__ == $PROGRAM_NAME
  factory = ItemFactory.new
  factory.create_items(@items_array)
  gilded_rose = GildedRose.new(factory.items)
  gilded_rose.update_quality_and_sell_in
  puts gilded_rose.items_to_string
end
