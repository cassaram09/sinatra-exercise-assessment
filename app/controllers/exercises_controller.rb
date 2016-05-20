class ExercisesController < ApplicationController
  
  configure do
    set :views, "app/views"
  end

  get '/users/exercises' do
    erb :'users/exercises/index'
  end

  get '/users/exercises/new' do

  end

  post '/users/exercises' do
    #new workout
  end

  get '/users/exercises/:slug' do

  end

  get '/users/exercises/:id' do
    redirect '/users/exercises/:slug' 
  end

  get '/users/exercises/:id/edit' do
    redirect '/users/exercises/:slug/edit'
  end

  get '/users/exercises/:slug/edit' do

  end

  patch '/users/exercises/:slug' do
    #edit workout
  end

  delete '/users/exercises/:slug/delete' do
    #delete workout
  end

end