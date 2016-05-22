class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :name
      t.string :date
      t.timestamp null: false
      t.belongs_to :user, index: true
    end
  end
end
