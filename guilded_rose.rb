require_relative './lib/item_factory'
require_relative './data'

class GuildedRose
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
  guilded_rose = GuildedRose.new(factory.items)
  guilded_rose.update_quality_and_sell_in
  puts guilded_rose.items_to_string
end
