class RemoveGoalXpFromGoals < ActiveRecord::Migration[5.0]
  def change
    remove_column :goals, :goal_xp
  end
end
