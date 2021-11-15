# frozen_string_literal: true

class ImageService < BaseService
  def self.get_image(location)
    conn = Faraday.new(url: 'https://sweater-weather-kk.herokuapp.com')

    response = conn.get('/api/v1/backgrounds') do |f|
      f.body = {
        location: location.to_s
      }
    end
    format_json(response)
  end
end
