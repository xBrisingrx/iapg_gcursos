class CreateIvaConditions < ActiveRecord::Migration[7.2]
  def change
    create_table :iva_conditions do |t|
      t.string :name, null: false
      t.string :description
      t.boolean :active, default: true

      t.timestamps
    end
    add_index :iva_conditions, :name, unique: true
  end
end
