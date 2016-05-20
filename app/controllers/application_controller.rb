class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, "public"
    set :views, "app/views"
    enable :sessions
    set :session_secret, "powerlifting4days"
  end

  get '/' do
    erb :index
  end
  
end