class User < ActiveRecord::Base

  has_secure_password

  has_many :workouts
  has_many :user_exercises
  has_many :exercises, through: :user_exercises

end