require_relative 'config/environment'

class App < Sinatra::Base

  def self.run

      alert = Alert.find(5)

      text_input = GoogleDirectionsController.new.build_text(alert)

      Text.new.send_text(text_input)
      

      # Alert.all.each do |alert| 
      #   if alert.text_time == Time.now
      #     GoogleDirectionsController.new.build_text(alert)
      #   end
      # end
  
  end

  

end

