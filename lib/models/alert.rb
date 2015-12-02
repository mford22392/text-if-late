class Alert < ActiveRecord::Base

  def self.verify_address?(address)
    Geocoder.search(address).length >= 1
  end

  def origin=(origin)
    origin = Geocoder.search(origin).first.data["formatted_address"]
    super
  end

  def destination=(destination)
    destination = Geocoder.search(destination).first.data["formatted_address"]
    super
  end
    
end