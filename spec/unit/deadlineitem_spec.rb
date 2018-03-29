require 'deadlineitem'

describe 'DealineItem' do
  context 'update_quality' do
    it 'sell_in decreases by 1 each day' do
      item = Item.new('Backstage passes to a TAFKAL80ETC concert"', 2, 10)
      DeadlineItem.new(item).update_quality
      expect(item.sell_in).to eq(1)
    end

    it 'quality increases by 1 when sell_in is greater than 10' do
      item = Item.new('Backstage passes to a TAFKAL80ETC concert"', 15, 10)
      DeadlineItem.new(item).update_quality
      expect(item.quality).to eq(11)
    end

    it 'quality increases by 2 when sell_in is between 6-10' do
      item = Item.new('Backstage passes to a TAFKAL80ETC concert"', 6, 10)
      DeadlineItem.new(item).update_quality
      expect(item.quality).to eq(12)
    end

    it 'quality increases by 3 when sell_in is between 5-1' do
      item = Item.new('Backstage passes to a TAFKAL80ETC concert"', 1, 10)
      DeadlineItem.new(item).update_quality
      expect(item.quality).to eq(13)
    end

    it 'quality is 0 when sell_in is below 0' do
      item = Item.new('Backstage passes to a TAFKAL80ETC concert"', 0, 10)
      DeadlineItem.new(item).update_quality
      expect(item.quality).to eq(0)
    end

    it 'quality cannot go above MAX_QUALITY' do
      item = Item.new('Backstage passes to a TAFKAL80ETC concert"', 5, GildedRose::MAX_QUALITY)
      DeadlineItem.new(item).update_quality
      expect(item.quality).to eq(GildedRose::MAX_QUALITY)
    end
  end
end
