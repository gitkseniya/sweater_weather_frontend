require 'rails_helper'

RSpec.describe "road trip page" do
  before :each do
    visit root_path
    click_on "Register"
    fill_in 'user_email', with: '1234@email.com'
    fill_in 'user_password', with: '1234'
    fill_in 'user_password_confirmation', with: '1234'

    click_on "Register"
  end


  describe "when look for a roadtrip" do
    it "it can return trip details", :vcr do
      expect(current_path).to eq(road_trip_path)
      expect(page).to have_field(:origin)
      expect(page).to have_field(:destination)

      fill_in :origin, with: 'Denver,CO'
      fill_in :destination, with: 'Boulder,CO'
      click_on "Search"

      expect(current_path).to eq(road_trip_path)
    end
  end
end
