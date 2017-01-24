class CreateCountryAssociations < ActiveRecord::Migration[5.0]
  def change
    create_table :country_associations do |t|
      t.references :target_group, foreign_key: true
      t.references :country, foreign_key: true

      t.timestamps
    end
  end
end
