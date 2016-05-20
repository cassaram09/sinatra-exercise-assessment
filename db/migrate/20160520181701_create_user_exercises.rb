class CreateUserExercises < ActiveRecord::Migration
  def change
    create_table :user_exercises do |t|
      t.belongs_to :user, index: true
      t.belongs_to :exercise, index: true
      t.timestamp null: false
    end
  end
end
