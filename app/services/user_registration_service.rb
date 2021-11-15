# frozen_string_literal: true

class UserRegistrationService < BaseService
  def self.register(email, password, password_confirmation)
    conn = Faraday.new(url: 'https://sweater-weather-kk.herokuapp.com')

    response = conn.post('/api/v1/users') do |f|
      f.body = {
        email: email.to_s,
        password: password.to_s,
        password_confirmation: password_confirmation.to_s
      }
    end
    format_json(response)
  end
end
