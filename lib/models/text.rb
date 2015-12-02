class Text

  attr_reader

  def build_text(alert)
    directions_obj = build_data(alert)
    string = ""
    string << "Depart: #{directions_obj.depart_station} -- "
    string << "Arrive: #{directions_obj.arrive_station} -- "
    string << "Duration #{directions_obj.trip_length}"
    string
    
  end

  def build_data(alert)
    directions = GoogleDirections.new.tap do |d|
      d.get_doc(alert)
      d.get_trip_time
      d.get_stations
    end
  end

  def get_keys
    @keys = YAML.load_file('application.yml')
    @account_sid = @keys['TW_ACCOUNT_SID'] 
    @auth_token = @keys['TW_AUTH_TOKEN'] 
  end

  def form_text(text_input, phone_number)
    @client = Twilio::REST::Client.new @account_sid, @auth_token 
    @client.account.messages.create({
      :from => @keys['TW_FROM'], 
      :to => phone_number, 
      :body => text_input,  
    })
  end

  def send_text(text_input, phone_number)
    get_keys
    form_text(text_input, phone_number)
  end


end