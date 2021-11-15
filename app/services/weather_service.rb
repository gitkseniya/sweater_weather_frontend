# frozen_string_literal: true

class WeatherService < BaseService
  def self.get_weather(location)
    conn = Faraday.new(url: 'https://sweater-weather-kk.herokuapp.com')

    response = conn.get('/api/v1/forecast') do |f|
      f.body = {
        location: location
      }
    end
    format_json(response)
  end
end
