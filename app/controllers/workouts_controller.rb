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

  get '/users/:slug/workouts/new' do
    @user = User.find_by_slug(params[:slug])
    @current = Helpers.current_user(session)
    if @current.id = @user.id
      @all_exercises = Exercise.all.map { |exercise| exercise.name }
      erb :'/users/workouts/new'
    else
      redirect "/users/#{@current.slug}"
    end
  end

  post '/users/:slug/workouts' do
    @user = User.find_by_slug(params[:slug]).first
    @current = Helpers.current_user(session)
    if @current.id == @user.id
      @workout = Workout.create(name: params[:name], date: params[:date])
      @workout.user_id = @user.id
      params[:exercises].each do |exercise| #iterate over the array of exercise hashes
        if exercise.has_value?("")
          next
        else
          new_exercise = Exercise.create(exercise)
          new_exercise.workout_id = @workout.id
          new_exercise.save
        end
      end
      @workout.save
      @user.save
      redirect "/users/#{@current.slug}/workouts/#{@workout.id}"
    else
      redirect "/users/#{@current.slug}"
    end
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

  get '/users/:slug/workouts/:id/edit' do
    @user = User.find_by_slug(params[:slug])
    @current = Helpers.current_user(session)
    if @current.id = @user.id
      @workout = Workout.find_by(id: params[:id])
      @all_exercises = Exercise.all.map { |exercise| exercise.name }
      erb :'/users/workouts/edit'
    else
      redirect "/users/#{@current.slug}"
    end
  end

  patch '/users/:slug/workouts/:id' do
    binding.pry
    @user = User.find_by_slug(params[:slug]).first
    @current = Helpers.current_user(session)
    if @current.id == @user.id
      @workout = Workout.find_by(id: params[:id])
      @workout.name = params[:name]
      @workout.date = params[:date]
      @workout.exercises.clear
      params[:exercises].each do |exercise| #iterate over the array of exercise hashes
        if exercise.has_value?("")
          next
        else
          new_exercise = Exercise.create(exercise)
          new_exercise.workout_id = @workout.id
          new_exercise.save
        end
      end
      @workout.save
      @user.save
      redirect "/users/#{@current.slug}/workouts/#{@workout.id}"
    else
      redirect "/users/#{@current.slug}"
    end
  end

  delete '/users/workouts/:id/delete' do
    #delete workout
  end

end

