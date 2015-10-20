require_relative 'config/environment'

class App

  def self.run
    
      
      binding.pry

      Alert.all.each do |alert| 
        if alert.text_time == Time.now
          GoogleDirectionsController.new.build_text(alert)
        end
      end
  
  end

  

end

