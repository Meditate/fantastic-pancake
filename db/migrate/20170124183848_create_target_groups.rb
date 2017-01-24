class CreateTargetGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :target_groups do |t|
      t.string :name
      t.integer :external_id
      t.integer :parent_id
      t.references :panel_provider, foreign_key: true
      t.string :secret_code

      t.timestamps
    end
  end
end
