# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:email])

    if user.nil? 
      flash[:notice] = 'Incorrect input'
      redirect_to login_path
    else
      redirect_to road_trip_path
    end
  end
end
