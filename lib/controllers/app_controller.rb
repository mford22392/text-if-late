class AppController < Sinatra::Base

  configure do 
    set :views, 'lib/views'
  end
  
end