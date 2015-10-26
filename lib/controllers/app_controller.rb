class AppController < Sinatra::Base

  configure do 
    set :views, 'lib/views'
    enable :sessions
    set :session_secret, "anhthing you want" 
    # set :public_folder, 'public'
  end

  get '/' do
    @alerts = Alert.all 
    erb :'/alerts/index.html'
  end

end