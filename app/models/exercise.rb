class Exercise < ActiveRecord::Base
  belongs_to :user

  default_scope { order(workout_date: :desc) } 
end
