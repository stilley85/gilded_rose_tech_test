require 'legendaryitem'

describe 'LegendaryItem' do
  context '#update_quality' do
    before(:each) do
      @item = LegendaryItem.new('foo', 1, 80)
      @item.update_quality
    end

    it 'sell_in does not change' do
      expect(@item.sell_in).to eq(1)
    end

    it 'quality does not change' do
      expect(@item.quality).to eq(80)
    end
  end
end
