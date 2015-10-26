class AlertController < AppController

  # configure do 
  #   set :views, 'lib/views'
  # end

  get '/alerts/new' do
    erb :'alerts/new.html'
  end

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
    @alert.text_time = Time.new(params["alert"]["text_time"]).change(:offset => "EST")
    @alert.save
    erb :'alerts/show.html'
  end

  post '/alerts/:id/delete' do
    Alert.destroy(params[:id])
    redirect '/'
  end

  get '/alerts/:id/send_text' do
    @alert = Alert.find(params[:id])
    @text_input = GoogleDirectionsController.new.build_text(@alert)
    Text.new.send_text(@text_input)
    redirect '/'
  end

  post '/alerts' do
    alert = Alert.new
    alert.origin = Geocoder.search(params["alert"]["origin"]).first.data["formatted_address"]
    alert.destination = Geocoder.search(params["alert"]["destination"]).first.data["formatted_address"]
    alert.text_time = Time.new(params["alert"]["text_time"]).change(:offset => "EST")
    alert.save
    redirect "/alerts/#{alert.id}"
  end
  
end