# frozen_string_literal: true

class WeatherController < ApplicationController
  def show
    if !params[:city].empty?
      weather_data = WeatherFacade.get_weather(params[:city])

      @current_weather = CurrentWeather.new(weather_data.current_weather)
      @daily_weather = weather_data.daily_weather
      @hourly_weather = weather_data.hourly_weather

      image_data = ImageService.get_image(params[:city])
      @image = Image.new(image_data)
    else
      flash[:notice] = 'No data'
      redirect_to root_path
    end
  end
end
