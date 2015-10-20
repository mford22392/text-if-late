require_relative '../config/environment.rb'


class GoogleDirections

  attr_reader :doc, :trip_length, :depart_station, :arrive_station

  def get_url
    keys = YAML.load_file('application.yml')
    origin = keys['ORIGIN']
    destination = keys['DESTINATION']
    key = keys['KEYS']
    url="https://maps.googleapis.com/maps/api/directions/xml?origin=#{origin}&destination=#{destination}&mode=transit&key=#{key}"
  end

  def get_doc
    uri = URI.parse(get_url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    @doc = Nokogiri::XML(response.body)
  end

  def get_trip_time
    depart_time = doc.css('departure_time text').pop.text
    arrive_time = doc.css('arrival_time text').pop.text
    #Grabs LAST arrival and LAST depatrure time from XML.
    #These values are for the overal trip. 
    duration_in_minutes = (Time.parse(arrive_time) - Time.parse(depart_time))/60
    @trip_length = duration_in_minutes
  end

  def get_stations
    @depart_station = doc.css('departure_stop').text.strip.split("\n").first
    @arrive_station = doc.css('arrival_stop').text.strip.split("\n").first
  end

end




