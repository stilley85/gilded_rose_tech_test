class NormalItem

  def initialize(item)
    @item = item
  end

  def update_quality
    return if @item.quality == GildedRose::MIN_QUALITY
    @item.sell_in -= 1
    @item.sell_in < 0 ? @item.quality -= 2 : @item.quality -= 1
    @item.quality = GildedRose::MIN_QUALITY if @item.quality < GildedRose::MIN_QUALITY
  end
end
