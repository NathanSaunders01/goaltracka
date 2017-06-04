class AddTotalGoalXpToGoal < ActiveRecord::Migration[5.0]
  def change
    add_column :goals, :total_goal_xp, :integer
  end
end
