require 'gilded_rose'

describe GildedRose do

  describe '#update_quality' do
    it 'does not change the name' do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end
  end

  context '#standard_item' do

    before(:each) do
      @items = [Item.new("foo", 5, 10), Item.new("foo", 5, 1), Item.new("foo", 1, 10)]
      GildedRose.new(@items).update_quality()
    end

    it 'sell_in decreases by 1 each day' do
      expect(@items[0].sell_in).to eq(4)
    end

    it 'quality decreases by 1 each day' do
      expect(@items[0].quality).to eq(9)
    end

    it 'Quality cannot fall below 0' do
      5.times do
        GildedRose.new(@items).update_quality()
      end
      expect(@items[1].quality).to eq(0)
    end

    it 'Quality reduces by 2 each day if sell_in is below 0' do
      2.times do
        GildedRose.new(@items).update_quality()
      end
      expect(@items[2].quality).to eq(5)
    end
  end

end
