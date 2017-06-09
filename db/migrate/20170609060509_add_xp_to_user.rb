class AddXpToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :total_user_xp, :integer, :default => 0
  end
end
