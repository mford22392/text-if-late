class AlertController < AppController

  # configure do 
  #   set :views, 'lib/views'
  # end

  get '/' do
    @alerts = Alert.all 
    erb :'/alerts/index.html'
  end

  get '/alerts/:id' do
    @alert = Alert.find(params[:id])
    erb :'/alerts/show.html'
  end

  get '/alerts/:id/edit' do
    @alert = Alert.find(params[:id])
    erb :'alerts/edit.html'
  end

  post '/alerts/:id' do 
    @alert = Alert.find(params[:id])
    @alert.origin = params["alert"]["origin"]
    @alert.destination = params["alert"]["destination"]
    @alert.text_time = params["alert"]["text_time"].to_time
    @alert.save
    erb :'alerts/show.html'
  end

  post '/alerts/:id/delete' do
    Alert.destroy(params[:id])
    redirect '/'
  end


end