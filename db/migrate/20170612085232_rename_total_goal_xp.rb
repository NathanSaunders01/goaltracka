class RenameTotalGoalXp < ActiveRecord::Migration[5.0]
  def change
    rename_column :goals, :total_goal_xp, :goal_xp
  end
end
