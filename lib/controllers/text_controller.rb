class TextController < Sinatra::Base

  alert = Alert.find(3)


  text_input = GoogleDirectionsController.new.build_text(alert)

  Text.new.send_text(text_input)

end
