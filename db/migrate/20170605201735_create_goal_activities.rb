class CreateGoalActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :goal_activities do |t|
      t.integer :goal_id
      t.integer :activity_id
    end
  end
end
