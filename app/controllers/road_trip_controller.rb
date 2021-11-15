# frozen_string_literal: true

class RoadTripController < ApplicationController
  def show
    if params[:origin].present? && params[:destination].present?
      roadtrip_info = RoadTripService.get_trip_details(params[:origin], params[:destination], current_user.api_key)

      if roadtrip_info[:data][:attributes][:travel_time] == "impossible"
        flash[:notice] = 'Unable to build a trip with given parameters 🙁 '
        redirect_to road_trip_path
      else
        @roadtrip = RoadTrip.new(roadtrip_info)
      end
    end
  end
end
