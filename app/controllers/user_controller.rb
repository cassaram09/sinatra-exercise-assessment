class UserController < ApplicationController

  configure do
    set :views, "app/views"
  end

  get '/users' do
    erb :'/users/index'
  end

  get '/users/:slug' do
    erb :'/users/show'
  end

end