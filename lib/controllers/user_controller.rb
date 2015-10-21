class UsertController < AppController

  configure do 
    set :views, 'lib/views'
  end

  get '/' do
    @alerts = Alert.all 
    erb :'/alerts/index.html'
  end

end