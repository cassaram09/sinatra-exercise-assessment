class Exercise < ActiveRecord::Base

  belongs_to :workout
  has_many :user_exercises
  has_many :users, through: :user_exercises

end