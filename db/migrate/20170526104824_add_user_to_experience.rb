class AddUserToExperience < ActiveRecord::Migration[5.0]
  def change
    add_column :experiences, :user_id, :integer
  end
end
