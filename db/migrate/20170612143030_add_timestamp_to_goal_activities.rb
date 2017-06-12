class AddTimestampToGoalActivities < ActiveRecord::Migration[5.0]
  def change
    add_column(:goal_activities, :created_at, :datetime)
  end
end
