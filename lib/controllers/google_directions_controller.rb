require_relative '../../config/environment.rb'


class GoogleDirectionsController

  def build_text
    directions_obj = build_data
    binding.pry
    string = ""
    
  end

  def build_data
    directions = GoogleDirections.new.tap do |d|
      d.get_doc
      d.get_trip_time
      d.get_stations
    end
  end
end