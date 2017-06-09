class AddTotalXpToGoalActivity < ActiveRecord::Migration[5.0]
  def change
    add_column :goal_activities, :total_xp, :integer
  end
end
