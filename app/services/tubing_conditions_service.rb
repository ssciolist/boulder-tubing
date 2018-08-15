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
  end

  def suitable_conditions
  end

  def ideal_temp?
  end

  def ideal_flow?
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
