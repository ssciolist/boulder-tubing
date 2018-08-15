class TubingPresenter
  def initialize
    @today ||= TubingConditionsService.new
  end

  def good_day?
    @today.ideal_flow? && @today.ideal_temp? && @today.ideal_condition? ? "Yes" : "No"
  end

  def temperature
    @today.temp
  end

  def conditions
    @today.weather_condition
  end

  def water_flow
    if @today.flow < 40
      "too little"
    elsif @today.flow > 300
      "too much"
    else
      "enough"
    end
  end
end
