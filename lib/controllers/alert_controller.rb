class AlertController < AppController

  # configure do 
  #   set :views, 'lib/views'
  # end

  get '/alerts/new' do
    if session[:success_message]
      @success_message = session[:success_message]
      session[:success_message] = nil
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
    if session[:success_message]
      @success_message = session[:success_message]
      session[:success_message] = nil
    end
    @alert = Alert.find(params[:id])
    erb :'alerts/edit.html'
  end

  post '/alerts/:id' do 
    if Alert.verify_address?(params["alert"]["origin"]) && Alert.verify_address?(params["alert"]["destination"])
      @alert = Alert.find(params[:id])
      @alert.origin = params["alert"]["origin"]
      @alert.destination = params["alert"]["destination"]
      @alert.text_time = Time.parse(params["alert"]["text_time"]).localtime
      @alert.save
      erb :'alerts/show.html'
    else
      session[:success_message] = "I'm sorry, your addresses were not specific enough. Please be more exact with your input."
      redirect :"/alerts/#{params[:id]}/edit"
    end
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
      alert.text_time = Time.parse(params["alert"]["text_time"]).localtime
      alert.save
      redirect "/alerts/#{alert.id}"
    else
      session[:success_message] = "I'm sorry, your addresses were not specific enough. Please be more exact with your input."
      redirect :'/alerts/new'
    end
  end
  
end