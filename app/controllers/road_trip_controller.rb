# frozen_string_literal: true

class RoadTripController < ApplicationController
  def show
    if params[:origin].present? && params[:destination].present?
      roadtrip_info = RoadTripService.get_trip_details(params[:origin], params[:destination], current_user.api_key)

      @roadtrip = RoadTrip.new(roadtrip_info)
    end
  end
end
