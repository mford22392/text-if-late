class AppController < Sinatra::Base

  configure do 
    set :views, 'lib/views'
    enable :sessions
    set :session_secret, "anhthing you want" 
  end

  get '/' do
    @alerts = Alert.all 
    erb :'/alerts/index.html'
  end

end