class ConjuredItem < Item

  def update_quality
    @sell_in -= 1
    @sell_in < 0 ? @quality -= 4 : @quality -= 2
    @quality = 0 if @quality < 0
  end

end
