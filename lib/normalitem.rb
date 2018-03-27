class NormalItem < Item

  def update_quality
    @sell_in -= 1
    @sell_in < 0 ? @quality -= 2 : @quality -= 1
    @quality = 0 if @quality < 0
  end

end
