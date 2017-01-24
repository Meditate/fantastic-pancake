class AddIndexToTargetGroups < ActiveRecord::Migration[5.0]
  def change
    add_index :target_groups, :external_id, unique: true
  end
end
