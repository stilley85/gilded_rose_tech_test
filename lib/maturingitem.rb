class MaturingItem < Item

  def update_quality
    @sell_in -= 1
    @sell_in > 0 ? @quality += 1 : @quality += 2
    @quality = 50 if @quality > 50
  end

end
