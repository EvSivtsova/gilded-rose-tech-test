require_relative "./item"

class BackstagePass < Item
  def initialize(name, sell_in, quality)
    super(name, sell_in, quality)
  end

  private 

  def update_quality
    return @quality = 0 if @sell_in.negative?
    return before_event_5_days if @sell_in <= 5
    return before_event_10_days if @sell_in <= 10
    return @quality += 1 if @quality < 50
  end
  
  def before_event_5_days
    if @quality == 49
      @quality += 1
    elsif @quality == 48
      @quality += 2
    elsif @quality <= 47
      @quality += 3
    end
  end

  def before_event_10_days
    if @quality <= 48
      @quality += 2
    elsif @quality == 49
      @quality += 1
    end
  end
end
