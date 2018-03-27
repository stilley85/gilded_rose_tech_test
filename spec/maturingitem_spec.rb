require 'maturingitem'

describe 'MaturingItem' do
  context '#update_quality' do

    it 'sell_in decreases by 1 each day' do
      item = MaturingItem.new('foo', 2, 10)
      item.update_quality
      expect(item.sell_in).to eq(1)
    end

    it 'quality increases by 1 each day' do
      item = MaturingItem.new('foo', 2, 10)
      item.update_quality
      expect(item.quality).to eq(11)
    end

    it 'quality increases by 2 each day when sell_in is below 0' do
      expired_item = MaturingItem.new('foo', 0, 40)
      expired_item.update_quality
      expect(expired_item.quality).to eq(42)
    end

    it 'Quality cannot go above MAX_QUALITY' do
      maxed_item = MaturingItem.new('foo', 0, GildedRose::MAX_QUALITY)
      maxed_item.update_quality
      expect(maxed_item.quality).to eq(GildedRose::MAX_QUALITY)
    end
  end
end
