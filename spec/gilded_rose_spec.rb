require 'gilded_rose'
describe GildedRose do

  let(:item1) { double("An item", update_quality: 'update_quality') }
  let(:item2) { double("An item", update_quality: 'update_quality') }

  context '#update_quality' do
    it 'calls the update_quality method on each item' do
      items = [item1, item2]
      GildedRose.new(items).update_quality
      expect(item1).to have_received(:update_quality)
      expect(item2).to have_received(:update_quality)
    end
  end
end
#   describe '#update_quality' do
#     it 'does not change the name' do
#       items = [NormalItem.new('foo', 0, 0)]
#       GildedRose.new(items).update_quality
#       expect(items[0].name).to eq 'foo'
#     end
#   end
