class AddXpTodayToGoals < ActiveRecord::Migration[5.0]
  def change
    add_column :goals, :xp_today, :integer, :default => 0
  end
end
