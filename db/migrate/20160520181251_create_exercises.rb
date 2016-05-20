class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :sets
      t.integer :reps
      t.timestamp null: false
      t.belongs_to :workout, index: true
    end
  end
end
