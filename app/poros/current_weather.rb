# frozen_string_literal: true

class CurrentWeather
  attr_reader :sunrise_time,
              :sunset_time,
              :datetime,
              :temperature,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :conditions

  def initialize(current_weather_data)
    @sunrise_time = current_weather_data[:sunrise].to_datetime.new_offset('MST').strftime('%I:%M %p')
    @sunset_time = current_weather_data[:sunset].to_datetime.new_offset('MST').strftime('%I:%M %p')
    @datetime = current_weather_data[:datetime].to_datetime.new_offset('MST').strftime('%I:%M %p %B %d, %Y')
    @temperature = current_weather_data[:temperature]
    @feels_like = current_weather_data[:feels_like]
    @humidity = current_weather_data[:humidity]
    @uvi = current_weather_data[:uvi]
    @visibility = current_weather_data[:visibility]
    @conditions = current_weather_data[:conditions]
  end
end
