require 'backstage_pass'

# the integration tests are used to test for class inheritance

describe BackstagePass do
  context "when constructing" do
    it "inherits from Item class" do
      expect(BackstagePass).to be < Item
    end

    it 'is an instance of BackstagePass class' do
      item = BackstagePass.new('backstage passes', 10, 30)
      expect(item).to be_instance_of(BackstagePass)
    end

    it "constructs and returns item's attributes as a string" do
      item = BackstagePass.new('backstage passes', 10, 30)
      expect(item.to_string).to eq "backstage passes, 10, 30"
    end

    it "fails to construct if any of the arguments are missing and raises an Argument error" do
      expect { BackstagePass.new('10', '30') }.to raise_error(ArgumentError)
    end
  
    it "raises error when the type of the argument is incorrect or when its value is out of acceptable range" do
      expect { BackstagePass.new(5, 10, 30) }.to raise_error "Item's name must be a string"
      expect { BackstagePass.new('backstage passes', 'argument2', 30) }.to raise_error "Sell in days value must be a positive integer"
      expect { BackstagePass.new('backstage passes', -5, 30) }.to raise_error "Sell in days value must be a positive integer"
      expect { BackstagePass.new('backstage passes', 30, 'argument3') }.to raise_error "Quality value must be a positive integer less than or equal to 50"
      expect { BackstagePass.new('backstage passes', 30, -1) }.to raise_error "Quality value must be a positive integer less than or equal to 50"
    end
  end

  context "when there are more than 10 days till the event" do
    it "the quality increases by 1 and the sell_in value decreases by 1" do
      item = BackstagePass.new('backstage passes', 20, 30)
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq 19
      expect(item.quality).to eq 31
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq 18
      expect(item.quality).to eq 32
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq 17
      expect(item.quality).to eq 33
    end

    it "tops the quality value at 50" do
      item = BackstagePass.new('backstage passes', 20, 48)
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq 19
      expect(item.quality).to eq 49
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq 18
      expect(item.quality).to eq 50
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq 17
      expect(item.quality).to eq 50
    end
  end

  context "when there are less than 10 days till the event" do
    it "the quality increases by 2 and the sell_in value decreases by 1" do
      item = BackstagePass.new('backstage passes', 12, 30)
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq 11
      expect(item.quality).to eq 31
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq 10
      expect(item.quality).to eq 33
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq 9
      expect(item.quality).to eq 35
      item.update_quality_and_sell_in
    end

    it "tops the quality value at 50 if the difference between quality today and yesterday equals to 2" do
      item = BackstagePass.new('backstage passes', 9, 48)
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq 8
      expect(item.quality).to eq 50
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq 7
      expect(item.quality).to eq 50
    end

    it "tops the quality value at 50 if the difference between quality today and yesterday equals to 1" do
      item = BackstagePass.new('backstage passes', 9, 47)
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq 8
      expect(item.quality).to eq 49
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq 7
      expect(item.quality).to eq 50
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq 6
      expect(item.quality).to eq 50
    end
  end

  context "when there are less than 5 days till the event" do
    it "the quality increases by 3 and the sell_in value decreases by 1" do
      item = BackstagePass.new('backstage passes', 7, 30)
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq 6
      expect(item.quality).to eq 32
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq 5
      expect(item.quality).to eq 35
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq 4
      expect(item.quality).to eq 38
    end

    it "tops the quality value at 50 if the difference between quality today and yesterday equals to 3" do
      item = BackstagePass.new('backstage passes', 5, 47)
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq 4
      expect(item.quality).to eq 50
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq 3
      expect(item.quality).to eq 50
    end

    it "tops the quality value at 50 if the difference between quality today and yesterday equals to 2" do
      item = BackstagePass.new('backstage passes', 5, 45)
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq 4
      expect(item.quality).to eq 48
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq 3
      expect(item.quality).to eq 50
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq 2
      expect(item.quality).to eq 50
    end

    it "tops the quality value at 50 if the difference between quality today and yesterday equals to 1" do
      item = BackstagePass.new('backstage passes', 5, 46)
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq 4
      expect(item.quality).to eq 49
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq 3
      expect(item.quality).to eq 50
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq 2
      expect(item.quality).to eq 50
    end
  end

  context "once the event has taken place" do
    it "the quality drops to 0 the sell_in value decreases by 1" do
      item = BackstagePass.new('backstage passes', 2, 30)
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq 1
      expect(item.quality).to eq 33
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq 0
      expect(item.quality).to eq 36
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq -1
      expect(item.quality).to eq 0
      item.update_quality_and_sell_in
      expect(item.sell_in).to eq -2
      expect(item.quality).to eq 0
    end
  end
end
