class AddIndexToLocations < ActiveRecord::Migration[5.0]
  def change
    add_index :locations, :external_id, unique: true
  end
end
