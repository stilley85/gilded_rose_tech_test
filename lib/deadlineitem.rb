class DeadlineItem
  def initialize(item)
    @item = item
  end

  EXPIRY = 0
  LAST_MINUTE = 5
  EARLY_BIRD = 10

  def update_quality
    return if @item.quality == GildedRose::MAX_QUALITY
    @item.sell_in -= 1
    @item.sell_in < EXPIRY ? @item.quality = 0 : @item.sell_in < LAST_MINUTE ? @item.quality += 3 : @item.sell_in < EARLY_BIRD ? @item.quality += 2 : @item.quality += 1
    @item.quality = GildedRose::MAX_QUALITY if @item.quality > GildedRose::MAX_QUALITY
  end
end
