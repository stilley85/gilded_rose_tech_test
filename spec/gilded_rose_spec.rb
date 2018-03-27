require 'gilded_rose'

describe GildedRose do
  describe '#update_quality' do
    it 'does not change the name' do
      items = [Item.new('foo', 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].name).to eq 'foo'
    end
  end

  context '#standard_item' do
    before(:each) do
      @items = [Item.new('foo', 5, 10),
                Item.new('foo', -1, 1),
                Item.new('foo', 1, 10)]
      GildedRose.new(@items).update_quality
    end

    it 'sell_in decreases by 1 each day' do
      expect(@items[0].sell_in).to eq(4)
    end

    it 'quality decreases by 1 each day' do
      expect(@items[0].quality).to eq(9)
    end

    it 'Quality cannot fall below 0' do
      5.times do
        GildedRose.new(@items).update_quality
      end
      expect(@items[1].quality).to eq(0)
    end

    it 'Quality reduces by 2 each day if sell_in is below 0' do
      2.times do
        GildedRose.new(@items).update_quality
      end
      expect(@items[2].quality).to eq(5)
    end
  end

  context '#Sulfuras, Hand of Ragnaros' do
    before(:each) do
      @items = [Item.new('Sulfuras, Hand of Ragnaros', 0, 80)]
      GildedRose.new(@items).update_quality
    end

    it 'sell_in does not change' do
      expect(@items[0].sell_in).to eq(0)
    end

    it 'quality does not change' do
      expect(@items[0].quality).to eq(80)
    end
  end

  context '#Backstage passes to a TAFKAL80ETC concert' do
    before(:each) do
      @items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 15, 20),
                Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 20),
                Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 20),
                Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 20),
                Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 49)]
      GildedRose.new(@items).update_quality
    end

    it 'sell_in decreases by 1 each day' do
      expect(@items[0].sell_in).to eq(14)
    end

    it 'quality increases by 1 when sell_in is greater than 10' do
      expect(@items[0].quality).to eq(21)
    end

    it 'quality increases by 2 when sell_in is between 5-10' do
      expect(@items[1].quality).to eq(22)
    end

    it 'quality increases by 3 when sell_in is between 5-0' do
      expect(@items[2].quality).to eq(23)
    end

    it 'quality is 0 when sell_in is below 0' do
      expect(@items[3].quality).to eq(0)
    end

    it 'maximum quality is 50' do
      expect(@items[4].quality).to eq(50)
    end
  end

  context '#Aged Brie' do
    before(:each) do
      @items = [Item.new('Aged Brie', 2, 10),
                Item.new('Aged Brie', 0, 10),
                Item.new('Aged Brie', 2, 50)]
      GildedRose.new(@items).update_quality
    end

    it 'sell_in decreases by 1 each day' do
      expect(@items[0].sell_in).to eq(1)
    end

    it 'quality increases by 1 each day' do
      expect(@items[0].quality).to eq(11)
    end

    it 'quality increases by 2 each day when sell_in is below 0' do
      expect(@items[1].quality).to eq(12)
    end

    it 'maximum quality is 50' do
      expect(@items[2].quality).to eq(50)
    end
  end
end

describe Item do
  describe '#to_s' do
    it 'converts the item to a string' do
      item = Item.new('foo', 0, 0)
      expect(item.to_s).to eq 'foo, 0, 0'
    end
  end
end
