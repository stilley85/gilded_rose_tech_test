class GildedRose

  MAX_QUALITY = 50
  MIN_QUALITY = 0

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      if item.name == "Sulfuras, Hand of Ragnaros"
        return item
      elsif item.name == "Aged Brie"
        maturing_item(item)
      elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
        deadline_item(item)
      elsif item.name == "Conjured Mana Cake"
        conjured_item(item)
      else
        normal_item(item)
      end
    end
  end

  def normal_item(item)
    item.sell_in -= 1
    item.sell_in < 0 ? item.quality -= 2 : item.quality -= 1
    below_min?(item)
  end

  def maturing_item(item)
    item.sell_in -= 1
    item.sell_in > 0 ? item.quality += 1 : item.quality += 2
    over_max?(item)
  end

  def deadline_item(item)
    item.sell_in -= 1
    item.sell_in < 0 ? item.quality = 0 : item.sell_in < 5 ? item.quality += 3 : item.sell_in < 10 ? item.quality += 2 : item.quality += 1
    over_max?(item)
  end

  def conjured_item(item)
    item.sell_in -= 1
    item.sell_in < 0 ? item.quality -= 4 : item.quality -= 2
    below_min?(item)
  end

  private

  def over_max?(item)
    if item.quality > MAX_QUALITY
      item.quality = MAX_QUALITY
    end
  end

  def below_min?(item)
    if item.quality < MIN_QUALITY
      item.quality = MIN_QUALITY
    end
  end

end
