require_relative 'item'

class DeadlineItem < Item

  def update_quality
    @sell_in -= 1
    @sell_in < 0 ? @quality = 0 : @sell_in < 5 ? @quality += 3 : @sell_in < 10 ? @quality += 2 : @quality += 1
    @quality = GildedRose::MAX_QUALITY if @quality > GildedRose::MAX_QUALITY
  end

end
