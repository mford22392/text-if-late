class TextController < AppController

  alert = Alert.find(3)

  text_input = GoogleDirectionsController.new.build_text(alert)

  def send_text
    Text.new.send_text(text_input)
  end

end
