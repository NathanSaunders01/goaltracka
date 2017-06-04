class CreateExperience < ActiveRecord::Migration[5.0]
  def change
    create_table :experiences do |t|
      t.integer :total_xp
      t.integer :user_id
    end
  end
end
