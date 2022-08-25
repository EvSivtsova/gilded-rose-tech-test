require_relative './lib/item_factory'

class GuildedRose
  attr_reader :items
  def initialize(items)
    @items = items
  end

  def update_quality_and_sell_in
    @items.map { |item| item.update_quality_and_sell_in }
  end
end
