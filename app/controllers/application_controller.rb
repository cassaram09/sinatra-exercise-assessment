require 'sinatra/base'

class ApplicationController < Sinatra::Base
  use Rack::Flash

  configure do
    set :public_folder, "public"
    set :views, "app/views"
    enable :sessions
    set :session_secret, "powerlifting4days"
  end

  get '/' do
    erb :index
  end

  get '/login' do
    erb :login
  end

  post '/login' do
  
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    
  end

end