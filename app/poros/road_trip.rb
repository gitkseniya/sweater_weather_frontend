# frozen_string_literal: true

class RoadTrip
  attr_reader :start_city,
              :end_city,
              :travel_time,
              :time_at_eta,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :conditions,
              :icon

  def initialize(roadtrip_info)
    @start_city = roadtrip_info[:data][:attributes][:start_city]
    @end_city = roadtrip_info[:data][:attributes][:end_city]
    @travel_time = roadtrip_info[:data][:attributes][:travel_time]
    @time_at_eta =  roadtrip_info[:data][:attributes][:weather_at_eta][:date].to_datetime.new_offset('MST').strftime('%I:%M %p')
    @sunrise = roadtrip_info[:data][:attributes][:weather_at_eta][:sunrise].to_datetime.new_offset('MST').strftime('%I:%M %p')
    @sunset = roadtrip_info[:data][:attributes][:weather_at_eta][:sunset].to_datetime.new_offset('MST').strftime('%I:%M %p')
    @max_temp = roadtrip_info[:data][:attributes][:weather_at_eta][:max_temp]
    @min_temp = roadtrip_info[:data][:attributes][:weather_at_eta][:min_temp]
    @conditions = roadtrip_info[:data][:attributes][:weather_at_eta][:conditions]
    @icon = roadtrip_info[:data][:attributes][:weather_at_eta][:icon]
  end
end
