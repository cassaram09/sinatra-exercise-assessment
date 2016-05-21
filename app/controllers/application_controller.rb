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
    if Helpers.is_logged_in?(session)
       @user = Helpers.current_user(session)
      redirect "/users/#{@user.slug}"
    else
      erb :login
    end
  end

  post '/login' do
    if !params.has_value?("")
      @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
        session[:id] = @user.id
        @session = session
        flash[:message] = "Welcome, #{@user.name}!"
        redirect "/users/#{@user.slug}"
      else
        flash[:message] = "Incorrect username or password."
        redirect '/login'
      end
    else
      flash[:message] = "Error: Please fill out all fields."
      redirect '/login'
    end
  end

  get '/register' do
    if Helpers.is_logged_in?(session)
      @user = Helpers.current_user(session)
      redirect "/users/#{@user.slug}"
    else
      erb :register
    end
  end

  post '/register' do
    if !params.has_value?("")
      if User.find_by(email: params[:email])
        flash[:message] = "That email is already associated with another account."
        redirect '/register'
      end
      @user = User.new(params)
      if @user.save
        @user.save
        session[:id] = @user.id
        @session = session
        redirect "/users/#{@user.slug}"
      else
        flash[:message] = "There was an error. Please try again."
        redirect '/register'
      end
    else
      flash[:message] = "Please fill out all fields."
      redirect '/register'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  get '/users' do
    if Helpers.is_logged_in?(session)
      @user = Helpers.current_user(session)
      redirect "/users/#{@user.slug}"
    else
      redirect '/login'
    end
  end

  get '/users/:slug' do
    if Helpers.is_logged_in?(session)
      @user = Helpers.current_user(session)
      erb :'/users/show'
    else
      redirect '/login'
    end
  end

end