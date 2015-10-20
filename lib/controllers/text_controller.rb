require_relative '../../config/environment.rb'
require 'time'
require 'pry'

require 'rails'
require 'net/https'
require 'uri'
require 'pry'
require 'nokogiri'
require 'time'
require 'yaml'
# require 'rubyrequires'
require 'twilio-ruby'
require 'require_all'


# while true
#   while Time.now > Time.parse('11:15am') && Time.now < Time.parse('11:20am')
#     trip_durration = GoogleDirections.new.get_trip_data
#     if trip_durration > 25
#       text="It will take you #{trip_durration}min to get to school."
#       Twilio.new.send_text(text)
#       sleep(60)
#     end
#   end
# end

text_input = GoogleDirectionsController.new.build_text

Text.new.send_text(text_input)
