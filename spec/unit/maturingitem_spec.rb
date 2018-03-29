require 'maturingitem'

describe 'MaturingItem' do
  context '#update_quality' do
    it 'sell_in decreases by 1 each day' do
      item = Item.new('Aged Brie', 2, 10)
      MaturingItem.new(item).update_quality
      expect(item.sell_in).to eq(1)
    end

    it 'quality increases by 1 each day' do
      item = Item.new('Aged Brie', 2, 10)
      MaturingItem.new(item).update_quality
      expect(item.quality).to eq(11)
    end

    it 'quality increases by 2 each day when sell_in is below 0' do
      item = Item.new('Aged Brie', 0, 40)
      MaturingItem.new(item).update_quality
      expect(item.quality).to eq(42)
    end

    it 'quality cannot go above MAX_QUALITY' do
      item = Item.new('Aged Brie', 0, GildedRose::MAX_QUALITY)
      MaturingItem.new(item).update_quality
      expect(item.quality).to eq(GildedRose::MAX_QUALITY)
    end
  end
end
