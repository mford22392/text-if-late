class AppController < Sinatra::Base

  configure do 
    set :views, 'lib/views'
    # set :public_folder, 'public'
  end

  get '/' do
    @alerts = Alert.all 
    erb :'/alerts/index.html'
  end

  enable :sessions
end