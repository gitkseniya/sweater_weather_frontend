# frozen_string_literal: true

class Image
  attr_reader :author,
              :url

  def initialize(image_data)
    @author = image_data[:data][:attributes][:credit][:author]
    @url = image_data[:data][:attributes][:credit][:url]
  end
end
