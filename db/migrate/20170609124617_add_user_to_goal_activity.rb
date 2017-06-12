class AddUserToGoalActivity < ActiveRecord::Migration[5.0]
  def change
    add_column :goal_activities, :user_id, :integer
  end
end
