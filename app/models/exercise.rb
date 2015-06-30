class Exercise < ActiveRecord::Base
  belongs_to :user

  default_scope { where('workout_date > ?', 7.days.ago)
                  .order(workout_date: :desc) } 
end
