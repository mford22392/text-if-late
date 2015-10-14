require "net/https"
require "uri"
require 'pry'
require 'nokogiri'
require 'time'
require 'yaml'

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
  doc = Nokogiri::XML(response.body)
end

def get_trip_data
  doc = get_doc
  depart = doc.css('departure_time text').pop.text
  arrive = doc.css('arrival_time text').pop.text
  #Grabs LAST arrival and LAST depatrure time from XML.
  #These values are for the overal trip. 
  duration_in_minutes = (Time.parse(arrive) - Time.parse(depart))/60
  trip_length = duration_in_minutes
end

puts get_trip_data

