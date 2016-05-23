# sinatra-exercise-assessment
Sinatra Exercise App

This application allows users to sign up, log in and out, and track their exercise habits. 

Workout has many Exercises
  string - name
  string - date
  timestamp

Exercise belongs_to Workout
  string - name 
  sets - integer
  reps - integer
  belongs_to
  timestamp

User has_many Workouts
User has_many Exericses, through Workouts
  string - name
  string - email
  string - password
  integer - age
  integer - bodyweight
  timestamp


/ - home 
/login - login page
/signup - signup page
/logout - logout page
/users - redirect to /users/:slug or feed of all workouts
/users/:slug - user home page
/users/workouts - feed of user workouts
/users/workouts/:date /users/workouts/:id - individual workout, accessed by date or ID. Also delete workout
/users/workouts/:date/:edit - edit or delete workout
/users/workouts/:slug/delete


user = User.create(name: "Matt")
exercise = Exercise.create(name: "bench press")
workout = Workout.create(name: "May 15th")