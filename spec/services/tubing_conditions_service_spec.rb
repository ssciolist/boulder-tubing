require 'rails_helper'

describe 'TubingConditionsService' do
  it 'returns daily info on temp, conditions, and flow' do
    stub_request(:any, "https://boulder-tubing-api.herokuapp.com/conditions")
      .to_return(status: 200, body: File.read("./spec/fixtures/weather_api_response.json"))
      response = TubingConditionsService.new
      expect(response.temp).to eq("59")
      expect(response.weather_condition).to eq("Partly Cloudy")
      expect(response.flow).to eq(129.0)
  end
end
