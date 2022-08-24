require_relative "./item"

class Sulfuras < Item
  def initialize(name, sell_in, quality)
    super(name, sell_in, quality)
  end

  private 

  def update_quality
    @quality
  end

  def update_sell_in
    @sell_in
  end
end
