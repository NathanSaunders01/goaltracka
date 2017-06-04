class AddDescriptionToGoal < ActiveRecord::Migration[5.0]
  def change
    add_column :goals, :description, :string
  end
end
