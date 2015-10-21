class GoogleDirectionsController

  # Put in the model?
  def build_text(alert)
    directions_obj = build_data(alert)
    string = ""
    string << "Depart: #{directions_obj.depart_station} -- "
    string << "Arrive: #{directions_obj.arrive_station} -- "
    string << "Duration #{directions_obj.trip_length}"
    string
    
  end

  # Put in the model?
  def build_data(alert)
    directions = GoogleDirections.new.tap do |d|
      d.get_doc(alert)
      d.get_trip_time
      d.get_stations
    end
  end

  # Had problem on 10-20 where GoogleDirectionsController.new did not know #build_text

end