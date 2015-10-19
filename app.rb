require_relative 'config/environment'

class App

  def self.run
    GoogleDirectionsController.new.build_text
  end

end

App.run