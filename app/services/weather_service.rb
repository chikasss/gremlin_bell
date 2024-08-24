class WeatherService
  def initialize(lat, long, units)
    @lat = lat
    @long = long
    @units = units
  end

  def get_current_weather
    params = {
      lat: @lat,
      lon: @long,
      units: @units,
      appid: ENV["OPENWEATHER_API_KEY"]
    }

    response = HTTParty.get(
      'https://api.openweathermap.org/data/2.5/weather',
      query: params
    )
  end

  def get_forecast
    params = {
      lat: @lat,
      lon: @long,
      units: @units,
      appid: ENV["OPENWEATHER_API_KEY"]
    }

    response = HTTParty.get(
      'https://api.openweathermap.org/data/2.5/forecast',
      query: params
    )
  end

end
