require_relative '../config/environment'
 
keys = YAML.load_file('application.yml')


# put your own credentials here 
account_sid = keys['TW_ACCOUNT_SID'] 
auth_token = keys['TW_AUTH_TOKEN'] 
 
# set up a client to talk to the Twilio REST API 
@client = Twilio::REST::Client.new account_sid, auth_token 
 
@client.account.messages.create({
  :from => keys['TW_FROM'], 
  :to => keys['TW_TO'], 
  :body => 'Test1',  
})