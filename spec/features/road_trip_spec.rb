require 'rails_helper'

RSpec.describe "road trip page" do
  describe "when look for a roadtrip" do
    it "it can return trip details", :vcr do
      visit root_path
      click_on "Register"
      fill_in 'user_email', with: 'wxyz@email.com'
      fill_in 'user_password', with: '1234'
      fill_in 'user_password_confirmation', with: '1234'

      click_on "Register"
      expect(current_path).to eq(road_trip_path)
      expect(page).to have_field(:origin)
      expect(page).to have_field(:destination)

      fill_in :origin, with: 'Denver,CO'
      fill_in :destination, with: 'Boulder,CO'
      click_on "Search"

      expect(current_path).to eq(road_trip_path)
    end

    it "it cant return trip details", :vcr do
      visit root_path
      click_on "Register"
      fill_in 'user_email', with: 'klm@email.com'
      fill_in 'user_password', with: '1234'
      fill_in 'user_password_confirmation', with: '1234'

      click_on "Register"

      visit root_path

      click_on 'Login'
      expect(current_path).to eq(login_path)

      fill_in :email, with: 'klm@email.com'
      fill_in :password, with: '1234'
      click_on 'Log In'

      expect(current_path).to eq(road_trip_path)

      fill_in :origin, with: 'Denver,CO'
      fill_in :destination, with: 'London'
      click_on "Search"

      expect(current_path).to eq(road_trip_path)
    end

    it "it cant login", :vcr do
      visit root_path
      click_on "Register"
      fill_in 'user_email', with: 'abcdefg@email.com'
      fill_in 'user_password', with: '1234'
      fill_in 'user_password_confirmation', with: '1234'

      click_on "Register"

      visit root_path

      click_on 'Login'
      expect(current_path).to eq(login_path)

      fill_in :email, with: 'wwwww@email.com'
      fill_in :password, with: '4321'
      click_on 'Log In'

      expect(current_path).to eq(login_path)
      expect(page).to have_content('Incorrect input')
    end

  end
end
