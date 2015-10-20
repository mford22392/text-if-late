

class Alert < ActiveRecord::Base
  # origin
  # destination
  # text_time

  def self.verify_address?(address)
    Geocoder.search(address).length == 1
  end

  # def initialize(origin: origin, destination: destination, text_time: text_time)
  #   @origin = Geocoder.search(origin).first.data["formatted_address"].gsub(" ", "+")
  #   @destination = Geocoder.search(destination).first.data["formatted_address"].gsub(" ", "+")
  #   @text_time = text_time
  # end

  
end