class AddTotalGoalXpToGoalTable < ActiveRecord::Migration[5.0]
  def change
    add_column :goals, :total_goal_xp, :integer, :default => 0
  end
end
