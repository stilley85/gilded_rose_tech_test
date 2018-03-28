require 'item'

describe Item do
  describe '#initialize' do
    it 'initializes with a name' do
      item = Item.new('foo', 0, 0)
      expect(item.name).to eq('foo')
    end

    it 'initializes with a sell_in value' do
      item = Item.new('foo', 0, 0)
      expect(item.sell_in).to eq(0)
    end

    it 'initializes with a quality value' do
      item = Item.new('foo', 0, 0)
      expect(item.quality).to eq(0)
    end
  end

  describe '#to_s' do
    it 'converts the item to a string' do
      item = Item.new('foo', 0, 0)
      expect(item.to_s).to eq 'foo, 0, 0'
    end
  end
end
