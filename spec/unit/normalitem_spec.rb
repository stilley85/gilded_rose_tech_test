require 'normalitem'

describe 'NormalItem' do
  context '#update_quality' do

    before(:each) do
      @item = NormalItem.new('foo', 2, 5)
      @item.update_quality
    end

    it 'sell_in decreases by 1 each day' do
      expect(@item.sell_in).to eq(1)
    end

    it 'quality decreases by 1 each day' do
      expect(@item.quality).to eq(4)
    end

    it 'Quality cannot fall below MIN_QUALITY' do
      10.times do
        @item.update_quality
      end
      expect(@item.quality).to eq(GildedRose::MIN_QUALITY)
    end

    it 'Quality reduces by 2 each day if sell_in is below 0' do
      2.times do
        @item.update_quality
      end
      expect(@item.quality).to eq(1)
    end

  end
end
