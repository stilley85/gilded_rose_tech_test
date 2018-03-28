require 'normalitem'

describe 'NormalItem' do
  context '#update_quality' do
    before(:each) do
      @item = Item.new('+5 Dexterity Vest', 2, 5)
      @update = NormalItem.new(@item)
      @update.update_quality
    end

    it 'sell_in decreases by 1 each day' do
      expect(@item.sell_in).to eq(1)
    end

    it 'quality decreases by 1 each day' do
      expect(@item.quality).to eq(4)
    end

    it 'quality cannot fall below MIN_QUALITY' do
      10.times do
        @update.update_quality
      end
      expect(@item.quality).to eq(GildedRose::MIN_QUALITY)
    end

    it 'quality reduces by 2 each day if sell_in is below 0' do
      2.times do
        @update.update_quality
      end
      expect(@item.quality).to eq(1)
    end
  end
end
