class AlertController < AppController

  # configure do 
  #   set :views, 'lib/views'
  # end

  get '/alerts/new' do

    binding.pry

    if session[:params]
      @default_values=session[:params]
      @success_message=session[:success_message]
      session[:params] = nil
      session[:success_message] = nil
    else
      @default_values=Alert.default_values
    end
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
    @alert.text_time = params["alert"]["text_time"].to_time
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
    if Alert.verify_address?(params["alert"]["origin"]) && Alert.verify_address?(params["alert"]["destination"])
      alert = Alert.new
      alert.origin = Geocoder.search(params["alert"]["origin"]).first.data["formatted_address"]
      alert.destination = Geocoder.search(params["alert"]["destination"]).first.data["formatted_address"]
      alert.text_time = params["alert"]["text_time"].to_time
      alert.save
      redirect "/alerts/#{alert.id}"
    else
      session[:params]=params
      session[:success_message]="I'm sorry, your addresses were not specific enough. Please be more exact with your input."

      binding.pry

      redirect '/alerts/new'
    end
  end
  
end