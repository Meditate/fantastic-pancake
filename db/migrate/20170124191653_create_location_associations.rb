class CreateLocationAssociations < ActiveRecord::Migration[5.0]
  def change
    create_table :location_associations do |t|
      t.references :location_group, foreign_key: true
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
