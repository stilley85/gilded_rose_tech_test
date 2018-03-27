class GildedRose

  MAX_QUALITY = 50
  MIN_QUALITY = 0

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      item.update_quality
    end
  end
end
