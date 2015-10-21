# alert = Alert.create(origin: "11+Broadway+NY+NY", destination: "10+West+87th+Street+NY+NY", text_time: "")
alert = Alert.find(5)

text_input = GoogleDirectionsController.new.build_text(alert)

# Text.new.send_text(text_input)
