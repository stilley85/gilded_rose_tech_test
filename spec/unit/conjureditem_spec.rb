require 'conjureditem'

describe 'ConjuredItem' do
  context 'update_quality' do
    it 'sell_in decreases by 1 each day' do
      item = Item.new('Conjured Mana Cake', 5, 10)
      update = ConjuredItem.new(item)
      update.update_quality
      expect(item.sell_in).to eq(4)
    end

    it 'quality decreases by 2 each day' do
      item = Item.new('Conjured Mana Cake', 5, 10)
      update = ConjuredItem.new(item)
      update.update_quality
      expect(item.quality).to eq(8)
    end

    it 'quality cannot fall below MIN_QUALITY' do
      item = Item.new('Conjured Mana Cake', 5, GildedRose::MIN_QUALITY)
      update = ConjuredItem.new(item)
      update.update_quality
      expect(item.quality).to eq(GildedRose::MIN_QUALITY)
    end

    it 'quality reduces by 4 each day if sell_in is below 0' do
      item = Item.new('Conjured Mana Cake', 0, 20)
      update = ConjuredItem.new(item)
      update.update_quality
      expect(item.quality).to eq(16)
    end
  end
end
