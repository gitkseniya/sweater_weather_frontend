# frozen_string_literal: true

class Weather
  attr_reader :current_weather,
              :daily_weather,
              :hourly_weather

  def initialize(weather_data)
    @current_weather = weather_data[:data][:attributes][:current_weather]
    @daily_weather = weather_data[:data][:attributes][:daily_weather]
    @hourly_weather = weather_data[:data][:attributes][:hourly_weather]
  end
end
