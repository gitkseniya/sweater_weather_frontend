# frozen_string_literal: true

class WeatherFacade
  def self.get_weather(location)
    weather_data = WeatherService.get_weather(location)

    Weather.new(weather_data)
  end
end
