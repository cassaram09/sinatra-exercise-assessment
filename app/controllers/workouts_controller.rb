class WorkoutsController < ApplicationController
  configure do
    set :views, "app/views"
  end

  get '/users/:slug/workouts' do
    @user = User.find_by_slug(params[:slug])
    @current = Helpers.current_user(session)
    if @current.id = @user.id
      erb :'/users/workouts/index'
    else
      redirect "/users/#{@current.slug}"
    end
  end

  get '/users/workouts/new' do

  end

  post '/users/workouts' do
    #new workout
  end

  get '/users/:slug/workouts/:id' do
    @user = User.find_by_slug(params[:slug])
    @current = Helpers.current_user(session)
    if @current.id = @user.id
      @workout = Workout.find_by(id: params[:id])
      erb :'/users/workouts/show'
    else
      redirect "/users/#{@current.slug}"
    end
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