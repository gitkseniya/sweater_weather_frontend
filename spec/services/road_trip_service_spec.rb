require 'rails_helper'

RSpec.describe RoadTripService do
  describe 'happy path' do
    it 'grabs top forty movies', :vcr do
        data = RoadTripService.get_trip_details("Denver,CO", "Gunnison,CO", "123")

        expect(data).to be_a(Hash)
        expect(data[:data][:attributes].keys).to eq([:start_city, :end_city, :travel_time, :weather_at_eta])
        expect(data[:data][:attributes][:start_city]).to eq("Denver,CO")
        expect(data[:data][:attributes][:end_city]).to eq("Gunnison,CO")
        expect(data[:data][:attributes][:travel_time]).to eq("3h 36min")
        expect(data[:data][:attributes][:weather_at_eta]).to be_a(Hash)
        expect(data[:data][:attributes][:weather_at_eta].keys).to eq([:date, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon])

    end

  end
end
