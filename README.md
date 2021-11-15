## About
This project is a spinoff of Sweater Weather back-end application that allows users to see the current weather as well as the forecasted weather at the destination.

## Project Goals
* Consume an API that aggregates data from multiple other external APIs
* Align the needs of response as per json contract for developers empathy
* Follow best industry practices to the best of the abilities

## Deployment
Visit the endpoints on __[Heroku](https://sweater-weather-frontend-kk.herokuapp.com/)__ or on [Local Host 3000](http://localhost:3000/) after completing the setup steps below.

## Versions
* Ruby 2.5.3
* Rails 5.2.5

## Setup
If you are running this API locally, follow the steps below:
  1. Fork and clone this repo
  2. Install gem packages by running `bundle`
  3. Setup the database: `rails db:(create)`
  4. Obtain necessary API keys:
     * [OpenWeather](https://home.openweathermap.org/users/sign_up)
     * [MapquestAPI](https://developer.mapquest.com/documentation/) (Click on 'join the community' to sign up and receive a key)
     * No key needed for OpenLibrary
  5. Protect your API keys by placing them in `config/application.yml`. Save under the following variable names:
     * OpenWeather: `weather_api_key:`
     * Maquest: `geocode_key:`
     * Note: key strings must not be placed inside quotes

## Running the Tests

Run all tests in application with `bundle exec rspec`. When test is complete, run `open coverage` to see where tests are being run and where they are not.
