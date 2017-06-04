class AddDefaultValueToTotalXp < ActiveRecord::Migration[5.0]
  def change
    change_column_default :goals, :total_goal_xp, 0
  end
end
