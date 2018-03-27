require 'conjureditem'

describe 'ConjuredItem' do
  context 'update_quality' do
    it 'sell_in decreases by 1 each day' do
      item = ConjuredItem.new('foo', 5, 10)
      item.update_quality
      expect(item.sell_in).to eq(4)
    end

    it 'quality decreases by 2 each day' do
      item = ConjuredItem.new('foo', 5, 10)
      item.update_quality
      expect(item.quality).to eq(8)
    end

    it 'Quality cannot fall below 0' do
      item = ConjuredItem.new('foo', 5, GildedRose::MIN_QUALITY)
      item.update_quality
      expect(item.quality).to eq(GildedRose::MIN_QUALITY)
    end

    it 'Quality reduces by 4 each day if sell_in is below 0' do
      item = ConjuredItem.new('foo', 0, 20)
      item.update_quality
      expect(item.quality).to eq(16)
    end
  end
end
