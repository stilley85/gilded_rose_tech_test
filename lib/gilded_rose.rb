require_relative 'item'
require_relative 'normalitem'
require_relative 'maturingitem'
require_relative 'deadlineitem'
require_relative 'legendaryitem'
require_relative 'conjureditem'


class GildedRose
  MAX_QUALITY = 50
  MIN_QUALITY = 0

  ITEM_TYPES = {
  '+5 Dexterity Vest' =>                         NormalItem,
  'Elixir of the Mongoose' =>                    NormalItem,
  'Aged Brie' =>                                 MaturingItem,
  'Sulfuras, Hand of Ragnaros' =>                LegendaryItem,
  'Backstage passes to a TAFKAL80ETC concert' => DeadlineItem,
  'Conjured Mana Cake' =>                        ConjuredItem
}

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      ITEM_TYPES[item.name].new(item).update_quality
    end
  end
end
