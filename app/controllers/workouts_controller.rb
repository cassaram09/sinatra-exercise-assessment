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

  get '/users/:slug/workouts/:id' do
    @user = User.find_by_slug(params[:slug])
    @workout = Workout.find_by(params[:id])
    erb :'/users/workouts/show'
  end

  get '/users/workouts/:id/edit' do
    erb :edit
  end

  get '/users/workouts/:id/edit' do

  end

  patch '/users/workouts/:id' do
    #edit workout
  end

  delete '/users/workouts/:id/delete' do
    #delete workout
  end

end