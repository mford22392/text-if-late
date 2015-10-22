class TextController < AppController

  alert = Alert.find(5)

  text_input = GoogleDirectionsController.new.build_text(alert)

  def send_text
    Text.new.send_text(text_input)
  end

end
