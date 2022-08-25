require_relative "./item"

class Conjured < Item
  def initialize(name, sell_in, quality)
    super(name, sell_in, quality)
  end

  private 

  def update_quality
    @quality -= 2 if @sell_in >= 0
    @quality -= 4 if @sell_in.negative?
  end
end
