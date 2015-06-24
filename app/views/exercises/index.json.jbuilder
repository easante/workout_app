json.array!(@exercises) do |exercise|
  json.extract! exercise, :id, :duration_in_min, :distance, :activity_date, :user_id
  json.url exercise_url(exercise, format: :json)
end
