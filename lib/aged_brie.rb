require_relative "./item"

class AgedBrie < Item
  def initialize(name, sell_in, quality)
    super(name, sell_in, quality)
  end

	private 

  def update_quality
    @quality += 1 if @quality < 50
  end
end
