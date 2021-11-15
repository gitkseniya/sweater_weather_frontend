# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    User.find_by(email: params[:email])

    redirect_to road_trip_path
  end
end
