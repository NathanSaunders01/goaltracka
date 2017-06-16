class AddUserXpTodayToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :user_xp_today, :integer, :default => 0
  end
end
