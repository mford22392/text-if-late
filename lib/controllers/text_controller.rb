require_relative '../../config/environment.rb'
require 'time'
require 'pry'


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

GoogleDirections.new.get_trip_data