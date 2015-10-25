

class Alert < ActiveRecord::Base
  # origin
  # destination
  # text_time

  def self.verify_address?(address)
    Geocoder.search(address).length == 1
  end

  def origin=(origin)
    origin = Geocoder.search(origin).first.data["formatted_address"]
    super
  end

  def destination=(destination)
    destination = Geocoder.search(destination).first.data["formatted_address"]
    super
  end

  def self.default_values
    {"alert"=>
    {"origin"=>"Origin",
    "destination"=>"Destination",
    "text_time"=>"6"}}
  end

  # def initialize(origin: origin, destination: destination, text_time: text_time)
  #   @origin = Geocoder.search(origin).first.data["formatted_address"].gsub(" ", "+")
  #   @destination = Geocoder.search(destination).first.data["formatted_address"].gsub(" ", "+")
  #   @text_time = text_time
  # end

  
end