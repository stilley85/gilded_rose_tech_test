require 'deadlineitem'

describe 'DealineItem' do
  context 'update_quality' do
    it 'sell_in decreases by 1 each day' do
      item = DeadlineItem.new('foo', 2, 10)
      item.update_quality
      expect(item.sell_in).to eq(1)
    end

    it 'quality increases by 1 when sell_in is greater than 10' do
      item = DeadlineItem.new('foo', 15, 10)
      item.update_quality
      expect(item.quality).to eq(11)
    end

    it 'quality increases by 2 when sell_in is between 6-10' do
      item = DeadlineItem.new('foo', 6, 10)
      item.update_quality
      expect(item.quality).to eq(12)
    end

    it 'quality increases by 3 when sell_in is between 5-1' do
      item = DeadlineItem.new('foo', 1, 10)
      item.update_quality
      expect(item.quality).to eq(13)
    end

    it 'quality is 0 when sell_in is below 0' do
      item = DeadlineItem.new('foo', 0, 10)
      item.update_quality
      expect(item.quality).to eq(0)
    end

    it 'quality cannot go above MAX_QUALITY' do
      item = DeadlineItem.new('foo', 5, GildedRose::MAX_QUALITY)
      item.update_quality
      expect(item.quality).to eq(GildedRose::MAX_QUALITY)
    end
  end
end
