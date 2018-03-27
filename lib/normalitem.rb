class NormalItem < Item

  def update_quality
    @sell_in -= 1
    @sell_in < 0 ? @quality -= 2 : @quality -= 1
    @quality = GildedRose::MIN_QUALITY if @quality < GildedRose::MIN_QUALITY
  end

end
