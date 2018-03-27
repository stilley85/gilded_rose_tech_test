require 'gilded_rose'
# require 'item'
# require 'conjureditem'
# require 'maturingitem'
# require 'normalitem'
# require 'legendaryitem'
# require 'deadlineitem'
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

#
#   context '#Backstage passes to a TAFKAL80ETC concert' do
#     before(:each) do
#       @items = [DeadlineItem.new('Backstage passes to a TAFKAL80ETC concert', 15, 20),
#                 DeadlineItem.new('Backstage passes to a TAFKAL80ETC concert', 10, 20),
#                 DeadlineItem.new('Backstage passes to a TAFKAL80ETC concert', 5, 20),
#                 DeadlineItem.new('Backstage passes to a TAFKAL80ETC concert', 0, 20),
#                 DeadlineItem.new('Backstage passes to a TAFKAL80ETC concert', 5, 49)]
#       GildedRose.new(@items).update_quality
#     end
#
#     it 'sell_in decreases by 1 each day' do
#       expect(@items[0].sell_in).to eq(14)
#     end
#
#     it 'quality increases by 1 when sell_in is greater than 10' do
#       expect(@items[0].quality).to eq(21)
#     end
#
#     it 'quality increases by 2 when sell_in is between 5-10' do
#       expect(@items[1].quality).to eq(22)
#     end
#
#     it 'quality increases by 3 when sell_in is between 5-0' do
#       expect(@items[2].quality).to eq(23)
#     end
#
#     it 'quality is 0 when sell_in is below 0' do
#       expect(@items[3].quality).to eq(0)
#     end
#
#     it 'maximum quality is 50' do
#       expect(@items[4].quality).to eq(50)
#     end
#   end
#

#   context '#conjured_item' do
#     before(:each) do
#       @items = [ConjuredItem.new('Conjured Mana Cake', 5, 10),
#                 ConjuredItem.new('Conjured Mana Cake', -1, 1),
#                 ConjuredItem.new('Conjured Mana Cake', 1, 10)]
#       GildedRose.new(@items).update_quality
#     end
#
#     it 'sell_in decreases by 1 each day' do
#       expect(@items[0].sell_in).to eq(4)
#     end
#
#     it 'quality decreases by 2 each day' do
#       expect(@items[0].quality).to eq(8)
#     end
#
#     it 'Quality cannot fall below 0' do
#       5.times do
#         GildedRose.new(@items).update_quality
#       end
#       expect(@items[1].quality).to eq(0)
#     end
#
#     it 'Quality reduces by 4 each day if sell_in is below 0' do
#       GildedRose.new(@items).update_quality
#       expect(@items[2].quality).to eq(4)
#     end
#   end
# end
