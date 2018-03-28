class DeadlineItem
  def initialize(item)
    @item = item
  end

  def update_quality
    @item.sell_in -= 1
    @item.sell_in < 0 ? @item.quality = 0 : @item.sell_in < 5 ? @item.quality += 3 : @item.sell_in < 10 ? @item.quality += 2 : @item.quality += 1
    @item.quality = GildedRose::MAX_QUALITY if @item.quality > GildedRose::MAX_QUALITY
  end
end
