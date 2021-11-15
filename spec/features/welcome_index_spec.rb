require 'rails_helper'

RSpec.describe "welcome index page" do
  before :each do
    visit root_path
  end

  describe "when I visit main page" do
    it "has a button to search for weather for city", :vcr do
      expect(page).to have_field(:city)

      fill_in :city, with: 'Denver,CO'
      click_on "Search"

      expect(current_path).to eq(weather_path)
      expect(page).to have_content("Current Weather")
      expect(page).to have_content("Sunrise time: 06:45 AM")
      expect(page).to have_content("Sunset time: 04:44 PM")
    end

    it "returns results for bogus cities via API data", :vcr do

      fill_in :city, with: "123"
      click_on("Search")

      expect(current_path).to eq(weather_path)
    end

    it "returns no result for empty city", :vcr do
      click_on("Search")

      expect(current_path).to eq(root_path)
      expect(page).to have_content("No data")
    end
  end
end
