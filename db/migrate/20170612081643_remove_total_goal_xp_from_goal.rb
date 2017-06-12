class RemoveTotalGoalXpFromGoal < ActiveRecord::Migration[5.0]
  def change
    remove_column :goals, :total_goal_xp
  end
end
