require_relative '../../config/environment.rb'


class GoogleDirectionsController

  def build_text
    directions_obj = build_data
    string = ""

    
    string << "Depart: #{directions_obj.depart_station} -- "
    string << "Arrive: #{directions_obj.arrive_station} -- "
    string << "Duration #{directions_obj.trip_length}"
    string
    
  end

  def build_data
    directions = GoogleDirections.new.tap do |d|
      d.get_doc
      d.get_trip_time
      d.get_stations
    end
  end
end