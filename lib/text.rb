require_relative '../config/environment'
 
class Text

  attr_reader

  def get_keys
    keys = YAML.load_file('application.yml')
    @account_sid = keys['TW_ACCOUNT_SID'] 
    @auth_token = keys['TW_AUTH_TOKEN'] 
  end

  def form_text(text_input)
    @client = Twilio::REST::Client.new account_sid, auth_token 
    @client.account.messages.create({
      :from => keys['TW_FROM'], 
      :to => keys['TW_TO'], 
      :body => text_input,  
    })
  end

  def send_text(text_input)
    get_keys
    form_text(text_input)
  end
end