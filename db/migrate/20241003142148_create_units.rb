class CreateUnits < ActiveRecord::Migration[7.2]
  def change
    create_table :units do |t|
      t.string :name, null: false
      t.string :description
      t.string :fleet, null: false
      t.string :methodology, null: false
      t.string :category, null: false
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
