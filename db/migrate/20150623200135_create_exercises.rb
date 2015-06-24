class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.integer :duration_in_min
      t.float :distance
      t.date :activity_date
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
