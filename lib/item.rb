class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    input_validation(name, sell_in, quality)
    fail @error if @error != nil
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_string
    "#{@name}, #{@sell_in}, #{@quality}"
  end
  
  private

  def input_validation(name, sell_in, quality)
    name_validation(name)
    sell_in_validation(sell_in)
    quality_validation(quality)
  end

  def name_validation(name)
    @error = "Item's name must be a string" if name.instance_of?(String) == false
  end

  def sell_in_validation(sell_in)
    if !sell_in.instance_of?(Integer) 
      @error = "Sell in days value must be a positive integer"
    elsif sell_in.negative?
      @error = "Sell in days value must be a positive integer"
    end
  end

  def quality_validation(quality)
    if !quality.instance_of?(Integer)
      @error = "Quality value must be a positive integer less than or equal to 50"
    elsif quality.negative? || quality > 50
      @error = "Quality value must be a positive integer less than or equal to 50"
    end
  end
end
