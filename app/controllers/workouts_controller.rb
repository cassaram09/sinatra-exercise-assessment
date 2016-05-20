class WorkoutsController < ApplicationController
  configure do
    set :views, "app/views"
  end

  get '/users/workouts' do
    erb :'/users/workouts/workouts'
  end

  get '/users/workouts/new' do

  end

  post '/users/workouts' do
    #new workout
  end

  get '/users/workouts/:slug' do

  end

  get '/users/workouts/:id' do
    redirect '/users/workouts/:slug' 
  end

  get '/users/workouts/:id/edit' do
    redirect '/users/workouts/:slug/edit'
  end

  get '/users/workouts/:slug/edit' do

  end

  patch '/users/workouts/:slug' do
    #edit workout
  end

  delete '/users/workouts/:slug/delete' do
    #delete workout
  end

end