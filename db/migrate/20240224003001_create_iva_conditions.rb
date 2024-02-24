class CreateIvaConditions < ActiveRecord::Migration[7.1]
  def change
    create_table :iva_conditions do |t|
      t.string :name, null: false
      t.string :description
      t.string :active, default: true, null: false

      t.timestamps
    end
  end
end
