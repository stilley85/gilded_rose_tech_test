class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      if item.name == "Sulfuras, Hand of Ragnaros"
        return item
      elsif item.name == "Aged Brie"
        item.sell_in -= 1
        if item.sell_in > 0
          item.quality += 1
          over_max?(item)
        else
          item.quality += 2
          over_max?(item)
        end
      elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
        item.sell_in -= 1
        if item.sell_in < 0
          item.quality = 0
        elsif item.sell_in < 5
          item.quality += 3
          over_max?(item)
        elsif item.sell_in < 10
          item.quality += 2
          over_max?(item)
        else
          item.quality += 1
          over_max?(item)
        end
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

  private

  def over_max?(item)
    if item.quality > 50
      item.quality = 50
    end
  end

  def below_min?(item)
    if item.quality < 0
      item.quality = 0
    end
  end

end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
