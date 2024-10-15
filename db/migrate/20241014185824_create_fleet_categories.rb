class CreateFleetCategories < ActiveRecord::Migration[7.2]
  def change
    create_table :fleet_categories do |t|
      t.string :name, null: false
      t.string :description
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
