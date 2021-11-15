# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    email = user_params[:email]
    password = user_params[:password]
    password_confirmation = user_params[:password_confirmation]

    registration = UserRegistrationService.register(email, password, password_confirmation)

    user_email = registration[:data][:attributes][:email]
    user_api_key = registration[:data][:attributes][:api_key]

    new_user = User.create(email: user_email, api_key: user_api_key)

    if new_user.save
      session[:user_id] = new_user.id

      redirect_to road_trip_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
