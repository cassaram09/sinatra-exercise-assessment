# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160520181701) do

  create_table "exercises", force: :cascade do |t|
    t.string  "name"
    t.integer "sets"
    t.integer "reps"
    t.integer "workout_id"
  end

  add_index "exercises", ["workout_id"], name: "index_exercises_on_workout_id"

  create_table "user_exercises", force: :cascade do |t|
    t.integer "user_id"
    t.integer "exercise_id"
  end

  add_index "user_exercises", ["exercise_id"], name: "index_user_exercises_on_exercise_id"
  add_index "user_exercises", ["user_id"], name: "index_user_exercises_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
  end

  create_table "workouts", force: :cascade do |t|
    t.string  "name"
    t.string  "date"
    t.integer "user_id"
  end

  add_index "workouts", ["user_id"], name: "index_workouts_on_user_id"

end
