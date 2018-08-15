class TubingConditionsService
  def temp
    data[:temperature_f]
  end

  def weather_condition
    data[:weather_condition]
  end

  def flow
    data[:flow_rate_cfs]
  end

  def ideal_condition?
    suitable_conditions.include?(weather_condition.downcase) ? true : false
  end

  def suitable_conditions
    ["windy", "cloudy", "mostly cloudy", "partly cloudy", "clear", "sunny", "fair", "hot"]
  end

  def ideal_temp?
    temp.to_i > 85 ? true : false
  end

  def ideal_flow?
    flow > 40 && flow < 300 ? true : false
  end

  private

  def conn
    Faraday.new(url: "https://boulder-tubing-api.herokuapp.com/conditions")
  end

  def response
    conn.get
  end

  def data
    JSON.parse(response.body, symbolize_names: true)
  end

end
