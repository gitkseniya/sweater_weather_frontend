# frozen_string_literal: true

class RoadTripService < BaseService
  def self.get_trip_details(origin, destination, api_key)
    conn = Faraday.new(url: 'https://sweater-weather-kk.herokuapp.com')

    response = conn.post('/api/v1/road_trip') do |f|
      f.body = {
        origin: origin.to_s,
        destination: destination.to_s,
        api_key: api_key.to_s
      }
    end
    format_json(response)
  end
end
