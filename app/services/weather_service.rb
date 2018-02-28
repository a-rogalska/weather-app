class WeatherService
  attr_accessor :conn, :city, :response

  def initialize(city, forecast)
    option = forecast ? "forecast" : "weather"
    @conn = Faraday.new(url: "http://api.openweathermap.org/data/2.5/#{option}")
    @city = city
  end

  def self.call(city, forecast = false)
    new(city, forecast).call
  end

  def call
    do_request

    return JSON.parse(response.body)
  end

  private

  def do_request
    self.response = conn.get do |req|
      req.params['q'] = city
      req.params['units'] = 'metric'
      req.params['APPID'] = "a3c23e88af2c54d60ba2d1f1554c28bd"
    end
  end
end